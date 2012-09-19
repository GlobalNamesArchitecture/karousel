class Karousel
  class Job
    attr_reader :client_job

    def initialize(client_job)
      @client_job = client_job
    end
  end
end
