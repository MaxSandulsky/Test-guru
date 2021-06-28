module NavigationHelper
  def test_search; end

  def nav_registration
    if logged_in?
      "Welcome, #{current_user.email} Guru"
    else
      link_to "I'm not Guru, yet", new_user_path
    end
  end

  def nav_logout
    if logged_in?
      link_to 'Logout', session_path(@current_user),
              method: :delete,
              data: { confirm: 'Are you sure?' }
    else
      link_to 'Login', sessions_new_path
    end
  end
end
