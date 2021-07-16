class Badge < ApplicationRecord
  WHITELIST = %w[id title pic_url created_at updated_at user_id achieved].freeze

  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :test, optional: true

  validates :title, :pic_url, presence: true
  validate :at_least_one_criterion
  validate :achievable

  def completed_by(user)
    attempts_by(user).map { |test_passage| test_passage.test }
  end

  def attempts_by(user)
    required_tests.map { |test| test.test_passages.where(user: user) }
                  .flatten
  end

  def required_tests
    tests = []
    active_rules.except('attempts').each do |attr, value|
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

  def achievable
    errors.add(:id) if required_tests.empty?
  end
end
