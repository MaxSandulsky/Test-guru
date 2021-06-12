class TestsController < ApplicationController
  before_action :set_test, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index
    # str = []
    # Test.joins(:category).each do |test|
    #   str.push("#{test.title} #{test.level} #{test.category.title}\n")
    # end
    # render plain: str
  end

  def show
    redirect_to test_questions_path(@test)
  end

  def new; end

  def create
    @test = Test.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    logger.info('Starting destroy')
    @test.destroy
    logger.info('After destroy')
    flash[:notice] = 'Page destroyed successfully.'
    redirect_to tests_path
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    hash = params.require(:test).permit(:title, :level, :category_id)
    params.require(:category).permit(:category_id).merge(author_id: 1).merge(hash)
  end

  def rescue_with_test_not_found
    head :not_found
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
