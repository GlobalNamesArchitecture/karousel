# frozen_string_literal: true

class Karousel
  # Abstract class for ClientJob
  class ClientJob
    attr_accessor :status

    def initialize
      @status = 1
    end

    def self.populate
      not_implemented_error
    end

    def send
      not_implemented_error
    end

    def finished?
      not_implemented_error
    end

    def process
      not_implemented_error
    end

    private

    def not_implemented_error
      raise Karousel::NotImplementedError
    end
  end
end
