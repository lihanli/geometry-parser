require 'test_helper'

class PointTest < GeometryParser::Test
  def setup
    super
    @Point = GeometryParser::Point
  end

  def test_orientation
    assert_equal(0, @Point.orientation(Factories.point(0, 0), Factories.point(1, 1), Factories.point(2, 2)))
    assert_equal(1, @Point.orientation(Factories.point(0, 0), Factories.point(1, 1), Factories.point(0, 2)))
    assert_equal(-1, @Point.orientation(Factories.point(0, 0), Factories.point(0, 2), Factories.point(1, -1)))
  end
end