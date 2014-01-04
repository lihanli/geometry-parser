require 'test_helper'

class PointTest < GeometryParser::Test
  def setup
    super
    @Point = GeometryParser::Point
  end

  def test_orientation
    point1 = @Point.new('x' => 0, 'y' => 0)
    point2 = @Point.new('x' => 1, 'y' => 1)
    point3 = @Point.new('x' => 2, 'y' => 2)
    assert_equal(0, @Point.orientation(point1, point2, point3))

    point1 = @Point.new('x' => 0, 'y' => 0)
    point2 = @Point.new('x' => 1, 'y' => 1)
    point3 = @Point.new('x' => 0, 'y' => 2)
    assert_equal(1, @Point.orientation(point1, point2, point3))

    point1 = @Point.new('x' => 0, 'y' => 0)
    point2 = @Point.new('x' => 0, 'y' => 2)
    point3 = @Point.new('x' => 1, 'y' => -1)
    assert_equal(-1, @Point.orientation(point1, point2, point3))
  end
end