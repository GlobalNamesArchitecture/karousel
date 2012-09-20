class Karousel
  class Job
    STATUS = { 1 => :init, 2 => :sent, 3 => :success, 4 => :failure }
    attr_reader :client_job

    def initialize(client_job)
      @client_job = client_job
      @invert_status = STATUS.invert
    end

    def status
      @status = STATUS[@client_job.status]
      raise TypeError.new("status must be an integer between 1 and 4") unless @status
      @status
    end

    def status= (new_status)
      new_status = @invert_status[new_status]
      raise TypeError.new("Unknown status") unless new_status
      @client_job.status = new_status
    end

    def send
      is_ok = @client_job.send
      self.status = is_ok ? :sent : :failure 
      is_ok
    end

    def finished?
      is_ok = @client_job.finished?
      self.status = is_ok ? :success : :failure
      is_ok
    end

    def process
      is_ok = @client_job.process
      self.status = is_ok ? :success : :failure
      is_ok
    end

  end
end
