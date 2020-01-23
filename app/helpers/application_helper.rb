module ApplicationHelper
  require 'rounding'

  def link_to_function_page(name, path)
    opt = {}
    opt.store(:class, 'is-active') if current_page?(path)
    link_to name, path, opt
  end

  def url_to_thread(id)
    "http://agree.5ch.net/test/read.cgi/liveanarchy/#{id}"
  end

  def cal_thread_down_time(time)
    time.since(3.minutes).ceil_to(1.minutes)
  end

end
