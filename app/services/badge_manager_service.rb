class BadgeManagerService
  RULES = { tests_by_category: Specifications::Badges::TestsByCategory,
            tests_by_level: Specifications::Badges::TestsByLevel,
            test_by_first_attempt: Specifications::Badges::TestsByFirstAttempt }

  attr_accessor :test_passage, :magnitude, :badge

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      test_passage.user.badges << badge if process(badge)
    end
  end

  def count_magnitude
    @magnitude = test_passage.user.user_badges.where(badge: badge).count + 1
  end

  def process(badge)
    @badge = badge
    @magnitude = count_magnitude
    RULES[badge.rule.to_sym].satisfied?(self)
  end
end
