module QuestionsHelper
  def question_header
    (@question.new_record? ? 'Create New' : 'Edit') + " question for #{@question.test.title} test"
  end
end
