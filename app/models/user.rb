class User < ApplicationRecord
  def active_tests(level)
    Test.where(level: level)
        .joins("JOIN passed_tests ON tests.id = passed_tests.test_id AND passed_tests.user_id = #{id}")
  end
end
