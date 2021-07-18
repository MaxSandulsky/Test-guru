class TestsByFirstAttempt
  def self.satisfied?(_value, user, _magnitude)
    Test.all.select { |test| test.test_passages.where(user: user).count == 1 }.present?
  end
end
