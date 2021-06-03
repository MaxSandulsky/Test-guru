class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id'
  has_many :passed_tests
  has_many :tests_passed, through: :passed_tests, source: :test

  def active_tests(level)
    Test.where(level: level)
        .joins("JOIN passed_tests ON tests.id = passed_tests.test_id AND passed_tests.user_id = #{id}")
  end
end
