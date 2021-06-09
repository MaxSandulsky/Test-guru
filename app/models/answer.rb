class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_answer_count

  def validate_answer_count
    errors.add(:question_id) unless question.answers.count < 4
  end
end
