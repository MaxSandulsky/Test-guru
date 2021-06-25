module TestPassagesHelper
  def result_text
    @test_passage.result_success ? 'Success' : 'Failure'
  end

  def result_color
    @test_passage.result_success ? 'green' : 'red'
  end
end
