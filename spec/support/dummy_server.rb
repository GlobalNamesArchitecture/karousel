class DummyServer

  def start
    @wait_num = rand(1..10)
    @tries_num = 0
  end

  def finished?
    @tries_num += 1
    @tries_num == @wait_num ? true : false
  end

end
