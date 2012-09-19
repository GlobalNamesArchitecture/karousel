Dir[File.join(File.dirname(__FILE__), "karousel", "*.rb")].each {|f| require f}


class Karousel
  attr_reader :size, :time_interval
  alias :seats_size :size

  def initialize(klass, size=10, time_interval = 0)
    @klass = klass
    @size = size
    @time_interval = time_interval
    @seats = []
  end

  def populate
    @klass.send("populate", @size).each do |inst|
      @seats << Job.new(inst)
    end
  end

  def run
    true
  end
  
  def filled_seats 
    @seats
  end

end
