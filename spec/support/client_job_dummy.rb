require_relative './dummy_server'

class ClientJobDummy
  @@dummy_data = 0 
  
  def self.reset
    @@dummy_data = 0
  end

  def self.reset_failures
  end

  def self.populate(karousel_size)
    @@dummy_data += karousel_size
    return [] if @@dummy_data > 100
    karousel_size.times.map { self.new }
  end

  def status
    @status ||= 1
  end

  def status=(new_status)
    @status = new_status
  end

  def send
    @server = DummyServer.new
    @server.first_request
    rand(0..10) > 9 ? false : true
  end

  def finished?
    @server.following_request
    rand(0..10) > 8 ? false : true
  end

  def process
  end

end

