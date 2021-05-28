class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id'

  #  def active_tests(level)
  #    Test.where(level: level, id: tests)
  #  end
end
