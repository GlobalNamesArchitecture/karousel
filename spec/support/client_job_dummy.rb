require_relative './dummy_server'

class ClientJobDummy
  @@i = 0 

  def self.populate(karousel_size)
    @@i += karousel_size
    return [] if @@i > 100
    karousel_size.times.map { self.new }
  end

  def self.reset
    @@i = 0
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
    rand(0..10) > 9 ? false : true
  end
end

