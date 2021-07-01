class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_test_invalid

  def index; end

  def start
    redirect_to set_test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to tests_path
  end

  def set_test_passage(test)
    current_user.uncomplete_test_passage(test)
  end

  def rescue_with_test_invalid(exemption)
    render plain: exemption
  end
end
