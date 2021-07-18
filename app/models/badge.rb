class Badge < ApplicationRecord
  RULES = { tests_by_category: Specifications::Badges::TestsByCategory,
            tests_by_level: Specifications::Badges::TestsByLevel,
            test_by_first_attempt: Specifications::Badges::TestsByFirstAttempt}

  validates :title,
            :pic_url,
            :description,
            :rule,
            presence: true
end
