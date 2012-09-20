class ClientJobDummy
  def self.populate(karousel_size)
    karousel_size.times.map { self.new }
  end

  def status
    @status ||= 1
  end

  def status=(new_status)
    @status = new_status
  end

  def send
    true
  end

  def finished?
    true
  end

  def process
    true
  end
end

