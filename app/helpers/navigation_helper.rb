module NavigationHelper
  def test_search; end

  def nav_registration
    if user_signed_in?
      "Welcome, #{current_user.email}"
    else
      link_to "I'm not Guru, yet", new_user_registration_path
    end
  end

  def nav_logout
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      link_to 'Login', new_user_session_path
    end
  end
end
