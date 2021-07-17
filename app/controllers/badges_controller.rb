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

  def check_user_attempts(badge, test_passage)
    badge.attempts.nil? ? true : (badge.attempts * badge.required_tests.count >= badge.completed_by(test_passage.user).count)
  end
end
