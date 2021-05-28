class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category, foreign_key: 'category_id'

  has_many :questions

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.titles(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
