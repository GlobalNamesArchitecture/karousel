class ClientJobDummy
  def self.populate(karousel_size)
    karousel_size.times.map { self.new }
  end

  def send
  end

  def enquire
  end

  def process
  end
end

