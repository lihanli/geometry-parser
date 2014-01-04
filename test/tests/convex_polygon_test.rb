require 'test_helper'

class ConvexPolygonTest < GeometryParser::Test
  def test_valid_polygon_added_to_collection
    convex_polygon = Factories.polygon(type: :convex_polygon)
    assert_equal([convex_polygon], GeometryParser.polygons)

    # non convex
    Factories.polygon(type: :convex_polygon, points: [[-2, 0], [-12, 0], [-12, 5], [-7, 5], [-7, -4]])
    assert_equal(1, GeometryParser.polygons.size)
  end
end