module ApplicationHelper
  def sample_helper
    '<p>My helper</p>'.html_safe
  end

  def another_sample_helper
    content_tag(:div, 'My content', class: 'my-class')
  end

  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: style) +
        (link_to 'Register', new_user_registration_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on #{layout_name}",
                  class: 'source-greeting')
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: '/rails/info/routes',
        title: 'ROUTES'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def nav_helper_heredocs(style, tag_type)
    nav_links = <<~NAV_STRING
      <#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
      <#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a></#{tag_type}>
      <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
      <#{tag_type}><a href="#{about_path}" class="#{style} #{active? about_path}">About</a></#{tag_type}>
      <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
      <#{tag_type}><a href="/rails/info/routes" class="#{style} #{active? '/rails/info/routes'}">ROUTES</a></#{tag_type}>
    NAV_STRING
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
