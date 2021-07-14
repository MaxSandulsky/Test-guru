class Admin::BadgesRulesController < Admin::BaseController
  def index
    @badges_rules = BadgesRule.all
  end

  def new
    @badges_rule = BadgesRule.new
  end

  def create
    @badges_rule = BadgesRule.new(badges_rule_params)

    if @badges_rule.save
      redirect_to admin_badges_rules_path
    else
      render :new
    end
  end

  private

  def badges_rule_params
    params.require(:badges_rule).permit(:title, :level, :category_id, :test_id, :attempts, :pic_url)
  end
end
