class User < ApplicationRecord
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests_passed, through: :test_passages, source: :test

  validates :e_mail, presence: true
  validates :login, presence: true
  validates :password, presence: true

  def active_tests(level)
    tests_passed.by_level(level)
  end

  def uncomplete_test_passage(test)
    test_passages.where.not(current_question: nil).order(id: :desc).find_by(test_id: test.id)
  end
end
