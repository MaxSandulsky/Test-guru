class BadgeManagerService
  def self.call(current_user)
    manager = self.new
    manager.achieve(current_user)
  end

  def achieve(current_user)
    Badge.find_each do |badge|
      if Badge::RULES[badge.rule.to_sym].satisfied?(badge.rule_value, current_user)
        current_user.badges << badge
      end
    end
  end
end
