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
end
