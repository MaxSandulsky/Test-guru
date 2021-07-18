class TestsByLevel
  def self.satisfied?(value, user, magnitude)
    (user.tests_passed_times(magnitude) & Test.by_level(value.to_i)).size == Test.by_level(value.to_i).size
  end
end
