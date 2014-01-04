require 'test_helper'

class SegmentTest < GeometryParser::Test
  def setup
    super
    @Point = GeometryParser::Point
  end

  def test_orientation
    assert_equal(0, @Point.orientation(Factories.point(0, 0), Factories.point(1, 1), Factories.point(2, 2)))
    assert_equal(1, @Point.orientation(Factories.point(0, 0), Factories.point(1, 1), Factories.point(0, 2)))
    assert_equal(-1, @Point.orientation(Factories.point(0, 0), Factories.point(0, 2), Factories.point(1, -1)))
  end

  def test_intersects?
    assert_equal(false, Factories.segment(1, 1, 10, 1).intersects?(Factories.segment(1, 2, 10, 2)))
    assert_equal(true, Factories.segment(10, 0, 0, 10).intersects?(Factories.segment(0, 0, 10, 10)))
    assert_equal(false, Factories.segment(-5, -5, 0, 0).intersects?(Factories.segment(1, 1, 10, 10)))
  end
end