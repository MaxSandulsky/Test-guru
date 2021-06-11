class QuestionsController < ApplicationController
  before_action :test_by_id, only: %i[index new create]
  before_action :question_by_id, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.create!(question_params)

    redirect_to test_questions_url
  end

  def destroy
    logger.info('Starting destroy')
    @question.destroy
    logger.info('After destroy')
    flash[:notice] = 'Page destroyed successfully.'
    redirect_to test_questions_url
  end

  def test_by_id
    @test = Test.find_by!(id: params[:test_id])
  end

  def question_by_id
    @question = Question.find_by!(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    head :not_found
  end
end
