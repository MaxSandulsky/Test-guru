module QuestionsHelper
  def question_header(action, title)
    label(nil, "#{action} question for #{title}")
  end
end
