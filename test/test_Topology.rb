require 'minitest_helper'

class TestTopology < MiniTest::Unit::TestCase
  def setup
    @s2 = Set[1, 2]
    @s3 = Set[1, 2, 3]
    @top2 = @s2.power
    @top  = Topology.new Set[1,2], Set[Set[2], Set[1]]
  end

  def test_power
    assert_equal(@s2.power, Set[Set[], Set[1], Set[2], Set[1, 2]])
    assert_equal(
      @s3.power,
      Set[Set[], Set[1], Set[2], Set[3], Set[1, 2], Set[2, 3], Set[3, 1], Set[1, 2, 3]]
    )
  end

  def test_sos?
    assert @s2.power.sos?
  end

  def test_top?
    assert @top2.axiom1?
    assert @top2.axiom2?
    assert @top2.axiom3?(@s2)
    assert @top2.top? @s2
    assert @top.top? Set[1,2]
  end
end
