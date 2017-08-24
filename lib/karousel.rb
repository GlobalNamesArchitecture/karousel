# frozen_string_literal: true

require_relative 'karousel/client_job'
require_relative 'karousel/errors'
require_relative 'karousel/job'
require_relative 'karousel/version'

# Implements karousel
class Karousel
  attr_reader :size, :seats, :time_interval
  STATUS = { init: 1, sent: 2, success: 3, failure: 4 }.freeze

  def self.version
    VERSION
  end

  def initialize(klass, size = 10, time_interval = 0)
    @klass = klass
    @size = size
    @time_interval = time_interval
    @seats = []
  end

  def populate
    new_seats = []
    @klass.populate(@size - @seats.size).each do |inst|
      new_seats << Job.new(inst)
    end
    @seats = new_seats + @seats
  end

  def run(&block)
    populate
    until @seats.empty?
      send_request
      sleep(@time_interval)
      check_response
      yield if block
      populate
    end
  end

  private

  def send_request
    @cursor = 0
    @seats.each_with_index do |job, index|
      if job.status == STATUS[:sent]
        @cursor = index
        break
      end
      job.send
    end
  end

  def check_response
    @seats = @seats[@cursor..-1] + @seats[0...@cursor] if @cursor != 0
    @seats.size.times do
      job = @seats.shift
      if job.status != :failure && job.finished?
        job.process
      else
        @seats.push(job)
      end
    end
    @cursor = 0
  end
end
