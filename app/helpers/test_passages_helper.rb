module TestPassagesHelper
  MS_IN_SEC = 1000
  MS_IN_MIN = 60_000

  def result_text
    @test_passage.result_success ? 'Success' : 'Failure'
  end

  def result_color
    @test_passage.result_success ? 'green' : 'red'
  end

  def sec_to_ms(secs)
    secs * MS_IN_SEC
  end

  def min_to_ms(mins)
    mins * MS_IN_MIN
  end
end
