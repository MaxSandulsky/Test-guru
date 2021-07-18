class BadgeManagerService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      if Badge::RULES[badge.rule.to_sym].satisfied?(badge.rule_value, @user, magnitude(badge))
        @user.badges << badge
      end
    end
  end

  def magnitude(badge)
    @user.user_badges.where(badge: badge).count
  end
end
