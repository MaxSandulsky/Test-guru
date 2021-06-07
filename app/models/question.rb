class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_count_answers, on: :use
  # validates_associated :answers

  def validate_count_answers
    errors.add(:answers) unless answers.count.between?(1, 4)
  end
end
