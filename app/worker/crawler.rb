require 'sidekiq-scheduler'

class Crawler
  include Sidekiq::Worker

  def perform
    puts '[Test] Hello world'
  end
end