class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_easy, -> { by_level(0..1) }
  scope :by_normal, -> { by_level(2..4) }
  scope :by_hard, -> { by_level(5..) }
  scope :by_category, ->(category) { where(category: category) }

  def self.titles(category)
    by_category(category).pluck(:title)
  end
end
