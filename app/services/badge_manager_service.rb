class BadgeManagerService
  def self.call(current_user)
    manager = self.new
    manager.achieve(current_user)
  end

  def achieve(current_user)
    Badge.find_each do |badge|
      if Badge::RULES[badge.rule.to_sym].satisfied?(badge.rule_value, current_user, magnitude(badge, current_user))
        current_user.badges << badge
      end
    end
  end

  def magnitude(badge, user)
    user.user_badges.where(badge: badge).count
  end
end
