class GistsController < Admin::BaseController
  before_action :set_test_passage, only: %i[create]
  before_action :set_gists, only: :index

  skip_before_action :admin_required!, only: %i[create]

  def index; end

  def create
    result = GistQuestionService.new(@test_passage.current_question, current_user.github_token).call

    flash_options = result.nil? ? { notice: t('.failure') } : save_record_gist(result)

    redirect_to @test_passage, flash_options
  end

  private

  def save_record_gist(result)
    @gist = Gist.new(user: current_user, url: result[:html_url], question: @test_passage.current_question)
    if @gist.save
      { notice: "#{t('.success')} #{result[:html_url]}".html_safe }
    else
      { notice: t('.failure') }
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def set_gists
    @gists = Gist.all
  end
end
