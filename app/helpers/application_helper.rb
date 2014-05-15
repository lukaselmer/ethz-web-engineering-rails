module ApplicationHelper
  def page_title(title)
    content_tag(:div, content_tag(:h1, title), class: 'page-header')
  end

  def navi_link(name, path)
    content_tag('li', link_to(name, path), class: (current_page?(path) ? 'active' : nil))
  end
end
