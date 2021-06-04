class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id'
  has_many :passed_tests
  has_many :tests_passed, through: :passed_tests, source: :test

  def active_tests(level)
    tests_passed.where(tests: { level: level })
  end
end
