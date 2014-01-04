require 'test_helper'

class PolygonTest < GeometryParser::Test
  def test_polygon_is_initially_invalid
    polygon = GeometryParser::Polygon.new('id' => {}, 'point' => [])
    assert_equal(false, polygon.valid?)
  end

  def test_segments_initialized
    polygon = Factories.polygon([[0, 0], [1, 1], [2, 0]])
    assert_equal('(0, 0)-(1, 1) (1, 1)-(2, 0) (2, 0)-(0, 0)', polygon.segments.map(&:to_s).join(' '))
  end

  def test_simple?
    # [[0, 0], [1, 1], [2, 0]]
    assert_equal(true, Factories.polygon.simple?)

    polygon = Factories.polygon([[-2, 0], [-12, 0], [-12, 5], [-7, 5], [-7, -4]])
    assert_equal(false, polygon.simple?)
  end

  def test_convex?
    assert_equal(false, Factories.polygon([[0, 0], [0, 10], [10, 10], [10, 0], [5, 5]]).convex?)
    # [[0, 0], [1, 1], [2, 0]]
    assert_equal(true, Factories.polygon.convex?)
  end
end