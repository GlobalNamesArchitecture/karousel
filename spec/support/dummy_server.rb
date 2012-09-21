class DummyServer

  def first_request
    @wait_num = rand(10) + 1
    @tries_num = 0
  end

  def following_request
    @tries_num += 1
    @tries_num == @wait_num ? true : false
  end

end
