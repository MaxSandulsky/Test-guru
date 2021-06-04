class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.titles(category)
    Test.joins(:category).where(categories: { title: category }).pluck(:title)
  end
end
