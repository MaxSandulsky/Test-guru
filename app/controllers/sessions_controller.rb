class SessionsController < Devise::SessionsController
  def create
    super do
      if current_user.first_name.present?
        flash.notice = "Welcome aboard, #{current_user.first_name} #{current_user.last_name}"
      end
    end
  end
end
