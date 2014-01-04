require 'test_helper'

class PolygonTest < GeometryParser::Test
  def setup
    super
    @polygon = Factories.polygon
  end

  def test_polygon_is_initially_invalid
    polygon = GeometryParser::Polygon.new('id' => {}, 'point' => [])
    assert_equal(false, polygon.instance_eval { @valid })
  end

  def test_segments_initialized
    assert_equal('(0, 0)-(1, 1) (1, 1)-(2, 0) (2, 0)-(0, 0)', @polygon.segments.map(&:to_s).join(' '))
  end

  def test_simple?
    assert_equal(true, @polygon.simple?)

    polygon = Factories.polygon(points: [[-2, 0], [-12, 0], [-12, 5], [-7, 5], [-7, -4]])
    assert_equal(false, polygon.simple?)
  end

  def test_convex?
    assert_equal(false, Factories.polygon(points: [[0, 0], [0, 10], [10, 10], [10, 0], [5, 5]]).convex?)
    assert_equal(true, @polygon.convex?)
  end

  def test_has_point?
    assert_equal(true, @polygon.has_point?(Factories.point(1, 0.5)))
    assert_equal(false, @polygon.has_point?(Factories.point(1, 2)))
  end
end