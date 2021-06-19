class QuestionsController < ApplicationController
  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show new edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index; end

  def show; end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to edit_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to edit_test_path(@question.test)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    return @question = Question.new if params[:action] == 'new'

    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found
    render plain: 'Record not found'
  end
end
