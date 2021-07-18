class TestsByFirstAttempt
  def self.satisfied?(value, test_passage, magnitude)
    test_passage.user.test_passages.where(test: test_passage.test).success.count == 1
  end
end
