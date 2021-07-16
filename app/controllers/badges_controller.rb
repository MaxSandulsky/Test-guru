class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.unachieved_badges
    @achieved_badges = current_user.achieved_badges
  end

  def achieve(test_passage)
    test_passage.user.unachieved_badges.each do |badge|
      next unless (badge.completed_by(test_passage.user) & badge.required_tests).size == badge.required_tests.size && check_user_attempts(
        badge, test_passage
      )

      badge.attempts_by(test_passage.user).each(&:destroy)
      next_badge = badge.dup
      next_badge.save!
      badge.achieved = true
      badge.save!
    end
  end

  def check_user_attempts(badge, test_passage)
    badge.attempts.nil? ? true : (badge.attempts * badge.required_tests.count >= badge.completed_by(test_passage.user).count)
  end
end
