module TestsHelper
  TEST_LEVELS = { 1 => :Elementary, 2 => :Easy, 3 => :Advanced, 4 => :Hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'Very hard'
  end
end
