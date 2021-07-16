module TestPassagesHelper
  MS_IN_SEC = 1000
  MS_IN_MIN = 60_000

  def result_text
    @test_passage.result_success ? 'Success' : 'Failure'
  end

  def result_color
    @test_passage.result_success ? 'green' : 'red'
  end

  def timer
    text = content_tag :div, content_tag(:span, t('.time_left'))

    time = content_tag :span, '0:00:00', class: "timer",
                        data: { time_limit: min_to_ms(@test_passage.test.timer),
                                time_now: sec_to_ms(Time.now.to_i),
                                time_start: sec_to_ms(@test_passage.created_at.to_i)}
    text.concat(time) unless @test_passage.test.timer == 0
  end

  def sec_to_ms(secs)
    secs * MS_IN_SEC
  end

  def min_to_ms(mins)
    mins * MS_IN_MIN
  end
end
