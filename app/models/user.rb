class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests_passed, through: :passed_tests, source: :test

  validates :e_mail, presence: true
  validates :login, presence: true
  validates :password, presence: true

  def active_tests(level)
    tests_passed.by_level(level)
  end
end
