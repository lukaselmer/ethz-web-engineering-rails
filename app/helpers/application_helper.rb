module ApplicationHelper
  def page_title
    'Hello!'
  end

  def navi_link(name, path)
    content_tag('li', link_to(name, path), class: (current_page?(path) ? 'active' : nil))
  end
end
