class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  scope :by_uncomplete, -> { where.not(current_question: nil).order(id: :desc) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def test_passage_result
    correct_questions * 100 / test.questions.count
  end

  def result_success
    test_passage_result > SUCCESS_RATIO
  end

  def current_question_index
    test.questions.pluck(:id).index(current_question_id)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    unless current_question.nil?
      self.current_question = test.questions.order(:id).where('id > ?',
                                                              current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
