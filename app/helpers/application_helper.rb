module ApplicationHelper

  def link_to_function_page(name, path)
    opt = {}
    opt.store(:class, 'is-active') if current_page?(path)
    link_to name, path, opt
  end

end
