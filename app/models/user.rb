require 'digest/sha1'

class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests_passed, through: :test_passages, source: :test

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true

  has_secure_password

  def active_tests(level)
    tests_passed.by_level(level)
  end

  def uncomplete_test_passage(test)
    test_passages.by_uncomplete.find_by(test_id: test.id)
  end
end
