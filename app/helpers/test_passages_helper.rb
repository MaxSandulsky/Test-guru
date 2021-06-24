module TestPassagesHelper
  def test_passage_result
    @test_passage.correct_questions * 100 / @test_passage.test.questions.count
  end

  def result_color
    test_passage_result > 85 ? 'green' : 'red'
  end

  def result_text
    test_passage_result > 85 ? 'Success' : 'Failure'
  end

  def completeness
    question_ids = @test_passage.test.questions.pluck(:id)
    "#{question_ids.index(@test_passage.current_question.id)}/#{question_ids.count}"
  end
end
