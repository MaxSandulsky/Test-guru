class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!

  def index; end
end
