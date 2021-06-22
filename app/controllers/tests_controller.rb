class TestsController < ApplicationController
  before_action :set_test, only: %i[show new edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index; end

  def show; end

  def new; end

  def create
    @test = author.tests.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  private

  def author
    @author = User.last
  end

  def set_test
    return @test = Test.new if params[:action] == 'new'

    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    redirect_to tests_path
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
