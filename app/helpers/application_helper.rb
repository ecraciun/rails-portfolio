module ApplicationHelper
  def sample_helper
    '<p>My helper</p>'.html_safe
  end

  def another_sample_helper
    content_tag(:div, 'My content', class: 'my-class')
  end

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path) + ' | ' +
        (link_to 'Register', new_user_registration_path)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on #{layout_name}",
                  class: 'source-greeting')
    end
  end
end
