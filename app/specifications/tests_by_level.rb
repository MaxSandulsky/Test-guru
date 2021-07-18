class TestsByLevel
  def self.satisfied?(obj)
    (obj.test_passage.user.tests_passed_times(obj.magnitude) & Test.by_level(obj.badge.rule_value.to_i)).size == Test.by_level(obj.badge.rule_value.to_i).size
  end
end
