class BadgesRule < ApplicationRecord
  WHITELIST = %w[id title pic_url created_at updated_at].freeze

  belongs_to :category, optional: true
  belongs_to :test, optional: true

  has_many :badges_test_passages
  has_many :badges

  validates :title, :pic_url, presence: true
  validate :at_least_one_criterion

  def tests_completed_by(user)
    Test.where(id: badges_test_passages.where(user: user).select(:test_id))
  end

  def required_tests
    tests = []
    active_rules.each do |attr, value|
      tests.push(Test.where(attr => value))
    end
    tests.flatten
  end

  def active_rules
    rules = attributes.except(*WHITELIST)
    rules['id'] = rules.delete('test_id')
    rules.reject! { |_attr, value| value.nil? }
  end

  private

  def at_least_one_criterion
    errors.add(:id) if attributes.except(*WHITELIST).all? { |_attr, value| value.nil? }
  end
end
