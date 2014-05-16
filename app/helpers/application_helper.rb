module ApplicationHelper
  def page_title(title=nil, &block)
    content_tag(:div, class: 'page-header') do
      content_tag(:h1, title, &block)
    end
  end

  def navi_link(name, path)
    content_tag('li', link_to(name, path), class: (current_page?(path) ? 'active' : nil))
  end

  def gravatar_url(user, size = 50)
    gravatar_hash = Digest::MD5.hexdigest(user.email.downcase)
    "https://gravatar.com/avatar/#{gravatar_hash}?s=#{size}"
  end
end
