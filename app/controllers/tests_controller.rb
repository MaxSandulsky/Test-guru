class TestsController < ApplicationController
  before_action :test_by_id, only: %i[show destroy]

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
    @test = Test.create!(test_params)
    # @test.category = Category.find_by!()
    show
  end

  def destroy
    logger.info('Starting destroy')
    @test.destroy
    logger.info('After destroy')
    flash[:notice] = 'Page destroyed successfully.'
    redirect_to tests_path
  end

  def test_by_id
    @test = Test.find_by!(id: params[:id])
  end

  def test_params
    p = params.require(:test).permit(:title, :level, :category_id)
    params.require(:category).permit(:category_id).merge(author_id: 1).merge(p)
  end

  def rescue_with_test_not_found
    head :not_found
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
