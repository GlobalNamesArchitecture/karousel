class Karousel
  class Job
    STATUS = { 1 => :init, 2 => :sent, 3 => :success, 4 => :failure }
    attr_reader :client_job

    def initialize(client_job)
      @client_job = client_job
    end

    def status
      @status = STATUS[@client_job.status]
      raise TypeError.new("status must be an integer between 1 and 4") if wrong_status?(@status)
      @status
    end

    def status= (new_status)
      raise TypeError.new("status must be an integer between 1 and 4") if wrong_status?(new_status)
      @client_job.status = new_status
    end

    def send
      @status = 2 #:sent
      true
    end

    def finished?
      @status = 3 #success
      true
    end

    def process
      true
    end

    private

    def wrong_status?(new_status)
      new_status.class == Fixnum && new_status.between?(1, 4)
    end
  end
end
