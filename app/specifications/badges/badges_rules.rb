module BadgesRules
  def self.tests_by_category(value, user)
    (user.tests_passed & Test.by_category(value)).size == Test.by_category(value).size
  end

  def self.tests_by_first_attempt(user)
    Test.all.select { |test| test.test_passages.where(user: user).count == 1 }.empty?
  end

  def self.specific_test_first_attempt(value, user)
    user.tests_passed.where(id: value).count == 1
  end

  def self.tests_by_level(value, user)
    (user.tests_passed & Test.by_level(value)).size == Test.by_level(value).size
  end
end
