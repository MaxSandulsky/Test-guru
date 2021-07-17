module BadgesRules
  def self.tests_by_category(value, user)
    (Test.passed_by(user) & Test.by_category(value)).size == Test.by_category(value).size
  end

  def self.test_by_first_attempt(value, user)
    Test.find_by(id: value).test_passages.where(user: user).count == 1
  end

  def self.tests_by_level(value, user)
    (Test.passed_by(user) & Test.by_level(value)).size == Test.by_level(value).size
  end
end
