class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index; end

  def start
    if @test.questions.empty?
      redirect_to tests_path
    else
      redirect_to test_passage(@test)
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to tests_path
  end

  def test_passage(test)
    @test_passage = current_user.uncomplete_test_passage(test)

    @test_passage ||= current_user.tests_passed.push(test).find(test.id).test_passages.by_uncomplete.find_by(user_id: current_user.id)
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
