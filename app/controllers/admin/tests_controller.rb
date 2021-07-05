class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show new edit update destroy start]

  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index
    @tests = Test.all
  end

  def show; end

  def new; end

  def create
    @test = current_user.tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find_or_initialize_by(id: params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def test_passage(test)
    @test_passage = current_user.uncomplete_test_passage(test)

    @test_passage ||= current_user.tests_passed.push(test).find(test.id).test_passages.by_uncomplete.find_by(user_id: current_user.id)
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
