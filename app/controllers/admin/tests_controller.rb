class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_test, only: %i[show new edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index; end

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

  def edit; end

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

  def start
    if @test.questions.empty?
      redirect_to tests_path
    else
      redirect_to test_passage(@test)
    end
  end

  private

  def set_test
    @test = if params[:action] == 'new'
              Test.new
            else
              Test.find(params[:id])
            end
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    redirect_to admin_tests_path
  end

  def test_passage(test)
    @test_passage = current_user.uncomplete_test_passage(test)

    @test_passage ||= current_user.tests_passed.push(test).find(test.id).test_passages.by_uncomplete.find_by(user_id: current_user.id)
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
