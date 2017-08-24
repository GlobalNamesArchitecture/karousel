# frozen_string_literal: true

class ClientJobDummy < Karousel::ClientJob
  @dummy_data = 0

  def self.reset
    @dummy_data = 0
  end

  def self.populate(karousel_size)
    @dummy_data += karousel_size
    return [] if @dummy_data > 100
    Array.new(karousel_size, new)
  end

  def send
    @server = DummyServer.new
    @server.first_request
    rand(100) > 95 ? false : true
  end

  def finished?
    @server.are_we_there_yet_request
  end

  def process; end
end
