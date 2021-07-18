class TestsByCategory
  def self.satisfied?(value, user, magnitude)
    (user.tests_passed_times(magnitude) & Test.by_category(value)).size == Test.by_category(value).size
  end
end
