class User < ApplicationRecord
  def active_tests(level)
    Test.where('level = :level AND id IN (:id)', level: level, id: tests)
  end
end
