class User < ApplicationRecord
  has_many :tests, foreign_key: 'author_id'
  has_many :passed_tests
  has_many :test_passed, through: :passed_tests, source: :tests

  def active_tests(level)
    test_passed.order(:id).where(level: level)
  end
end
