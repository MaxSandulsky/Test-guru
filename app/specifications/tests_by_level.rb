class TestsByLevel
  def self.satisfied?(value, user)
    (user.tests_passed & Test.by_level(value.to_i)).size == Test.by_level(value.to_i).size
  end
end
