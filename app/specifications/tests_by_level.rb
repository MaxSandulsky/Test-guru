class TestsByLevel
  def self.satisfied?(value, test_passage, magnitude)
    (test_passage.user.tests_passed_times(magnitude) & Test.by_level(value.to_i)).size == Test.by_level(value.to_i).size
  end
end
