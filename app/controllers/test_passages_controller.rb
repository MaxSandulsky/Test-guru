class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, current_user.github_token).call

    flash_options = if result.nil?
                      { notice: t('.failure') }
                    else
                      create_gist(result)

                      { notice: "#{t('.success')} #{result[:html_url]}".html_safe }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist(result)
    @gist = Gist.create(user: current_user, url: result[:html_url], question: @test_passage.current_question)
  end
end
