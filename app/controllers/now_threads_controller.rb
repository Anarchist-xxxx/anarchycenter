class NowThreadsController < ApplicationController
  def index
    a = Itest5ch::Board.find('liveanarchy').threads.partition do |thread|
      thread.dat.to_s.start_with?('924')
    end
    @threads924 = a[0]
    @threads = a[1]
  end
end
