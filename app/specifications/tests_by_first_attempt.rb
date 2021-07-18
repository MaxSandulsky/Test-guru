module TestsByFirstAttempt
  def self.satisfied?(value user)
    Test.all.select { |test| test.test_passages.where(user: user).count == 1 }.empty?
  end
end
