class Badge < ApplicationRecord
  RULES = { tests_by_category: Specifications::Badges::TestsByCategory,
            tests_by_level: Specifications::Badges::TestsByLevel,
            test_by_first_attempt: Specifications::Badges::TestsByFirstAttempt}

  validates :title,
            :pic_url,
            :description,
            :rule,
            presence: true

  def related_test_passages(user)
    user.test_passages.each do |tp|
      user.test_passages.delete(tp)
      user.test_passages.build(test: tp.test) unless achieved(user)
    end
    user.test_passages
  end
end
