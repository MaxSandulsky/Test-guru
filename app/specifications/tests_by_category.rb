class TestsByCategory
  def self.satisfied?(value, test_passage, magnitude)
    (test_passage.user.tests_passed_times(magnitude) & Test.by_category(value)).size == Test.by_category(value).size
  end
end
