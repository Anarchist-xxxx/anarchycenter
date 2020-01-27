class NowThreadsController < ApplicationController
  def index
    arr = Itest5ch::Board.find('liveanarchy').threads.partition do |thread|
      thread.dat.to_s.start_with?('924')
    end
    @threads924 = arr[0]
    @threads = arr[1]
  end
end
