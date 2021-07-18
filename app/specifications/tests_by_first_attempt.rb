class TestsByFirstAttempt
  def self.satisfied?(obj)
    obj.test_passage.user.test_passages.where(test: obj.test_passage.test).success.count == 1
  end
end
