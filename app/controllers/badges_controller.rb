class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = current_user.badges
    @badges = Badge.all
  end

  def achieve(current_user)
    Badge.find_each do |badge|
      if badge.achieved(current_user)
        current_user.badges << badge
        badge.related_tests.each { |test| test.test_passages.by_user(current_user).not_expired.update(expired: true) }
      end
    end
  end
end
