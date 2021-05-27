class User < ApplicationRecord
  def active_tests(level)
    Test.where(level: level, id: tests)
  end
end
