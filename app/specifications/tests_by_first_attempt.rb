class TestsByFirstAttempt
  def self.satisfied?(value, user, magnitude)
    Test.all.select { |test| test.test_passages.where(user: user).count == 1 }.present?
  end
end
