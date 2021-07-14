module NavigationHelper
  def test_search; end

  def nav_registration
    if user_signed_in?
      "Welcome, #{current_user.email}"
    else
      link_to "I'm not Guru, yet", new_user_registration_path
    end
  end

  def nav_menu
    if user_signed_in?
      if !current_user.is_a? Admin
        render 'shared/menu'
      else
        render 'admin/menu'
      end
    else
      link_to 'Login', new_user_session_path
    end
  end
end
