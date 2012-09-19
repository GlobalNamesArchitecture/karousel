Dir[File.join(File.dirname(__FILE__), "karousel", "*.rb")].each {|f| require f}


class Karousel
  attr_reader :size, :time_interval

  def initialize(klass, size=10, time_interval = 0)
    @size = size
    @time_interval = time_interval
  end

  def run
    true
  end
end
