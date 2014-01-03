require 'test_helper'

class PolygonTest < GeometryParser::Test
  def test_polygon_is_initially_invalid
    polygon = GeometryParser::Polygon.new('id' => {}, 'point' => {})
    assert_equal(false, polygon.valid?)
  end
end