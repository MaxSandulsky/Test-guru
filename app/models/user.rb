class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :tests, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests_passed, through: :test_passages, source: :test
  has_many :badges, dependent: :destroy

  def active_tests(level)
    tests_passed.by_level(level)
  end

  def uncomplete_test_passage(test)
    test_passages.by_uncomplete.find_or_create_by(test_id: test.id)
  end

  def achieved_badges
    badges.where(achieved: true)
  end

  def unachieved_badges
    badges.where(achieved: false)
  end
end
