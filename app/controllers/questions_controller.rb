class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    logger.info('Starting destroy')
    @question.destroy
    logger.info('After destroy')
    flash[:notice] = 'Page destroyed successfully.'
    redirect_to question_path(@question)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    head :not_found
  end
end
