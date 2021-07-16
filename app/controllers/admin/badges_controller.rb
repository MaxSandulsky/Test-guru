class Admin::BadgesController < Admin::BaseController
  def index
    @badges = current_user.unachieved_badges
    @achieved_badges = current_user.achieved_badges
  end

  def new
    @badge = Badge.new
  end

  def create
    ActiveRecord::Base.transaction do
      User.all.each do |user|
        @badge = user.badges.build(badge_params)
        @badge.save!
      end
    end
    redirect_to admin_badges_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :level, :category_id, :test_id, :attempts, :pic_url)
  end
end
