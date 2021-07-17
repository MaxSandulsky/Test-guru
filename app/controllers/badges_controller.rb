class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = current_user.badges
    @badges = Badge.all
  end

  def achieve(current_user)
    Badge.find_each do |badge|
      current_user.badges << badge if badge.achieved(current_user)
    end
  end
end
