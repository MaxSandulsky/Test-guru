class GistsController < Admin::BaseController
  skip_before_action :admin_required!, only: :create

  def index
    @gists = Gist.all
  end

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = result.success? ? save_record_gist(result) : { notice: t('.failure') }

    redirect_to @test_passage, flash_options
  end

  private

  def save_record_gist(result)
    @gist = Gist.new(user: current_user, url: result.url, question: @test_passage.current_question)

    if @gist.save
      { notice: "#{t('.success')} #{result.url}".html_safe }
    else
      { notice: t('.failure') }
    end
  end
end
