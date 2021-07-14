class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @badges_rules = BadgesRule.all
  end

  def achieve(test_passage)
    BadgesRule.all.each do |rule|
      if rule.required_tests.include?(test_passage.test)
        rule.badges_test_passages.find_or_create_by(test: test_passage.test, user: test_passage.user)
      end

      next unless rule.required_tests == rule.tests_completed_by(test_passage.user)

      puts rule.badges_test_passages.where(user_id: test_passage.user.id).destroy_all
      badge = rule.badges.build(pic_url: rule.pic_url, title: rule.title, user: test_passage.user)
      badge.save!
    end
  end
end
