module TestsHelper
  TEST_LEVELS = { 1 => :Elementary, 2 => :Easy, 3 => :Advanced, 4 => :Hard }.freeze

  def test_level(_test)
    TEST_LEVELS.fetch(level, 'Very hard')
  end
end
