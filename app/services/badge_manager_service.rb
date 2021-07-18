class BadgeManagerService
  def self.call(test_passage)
    manager = self.new
    manager.achieve
  end

  def achieve
    Badge.find_each do |badge|
      if Badge::RULES[badge.rule].satisfied?(badge.rule_value, user)
        current_user.badges << badge
        badge.related_test_passages(current_user).each { |tp| tp.not_expired.update(expired: true) }
      end
    end
  end
end
