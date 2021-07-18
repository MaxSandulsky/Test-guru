module TestsByCategory
  def self.satisfied?(value, user)
    (user.tests_passed & Test.by_category(value)).size == Test.by_category(value).size
  end
end
