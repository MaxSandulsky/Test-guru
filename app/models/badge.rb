class Badge < ApplicationRecord
  RULES = %i[tests_by_category tests_by_level test_by_first_attempt].freeze

  validates :title,
            :pic_url,
            :description,
            :rule_value,
            :rule,
            presence: true

  def achieved(user)
    BadgesRules.send rule.to_sym, rule_value, user
  end

  def related_tests
    user = User.new
    Test.find_each do |test|
      user.test_passages.build(test: test)
    end
    user.test_passages.each do |tp|
      user.test_passages.delete(tp)
      user.test_passages.build(test: tp.test) unless achieved(user)
    end
    user.test_passages.map(&:test)
  end
end
