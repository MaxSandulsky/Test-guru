class TestsByCategory
  def self.satisfied?(obj)
    (obj.test_passage.user.tests_passed_times(obj.magnitude) & Test.by_category(obj.badge.rule_value)).size == Test.by_category(obj.badge.rule_value).size
  end
end
