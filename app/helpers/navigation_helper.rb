module NavigationHelper
  def test_search; end

  def nav_user
    "Welcome, #{current_user.email} Guru" if logged_in?
  end

  def nav_logout
    link_to 'Logout', logout_path if logged_in?
  end

  def nav_registration
    link_to "I'm not Guru, yet", signup_path unless logged_in?
  end

  def nav_login
    link_to "Login", login_path unless logged_in?
  end
end
