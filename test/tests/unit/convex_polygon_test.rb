require 'test_helper'

class ConvexPolygonTest < GeometryParser::Test
  def test_valid_polygon_added_to_collection
    convex_polygon = Factories.polygon(type: :convex_polygon)
    assert_equal([convex_polygon], GeometryParser.polygons)

    # non convex
    Factories.polygon(type: :convex_polygon, points: [[-2, 0], [-12, 0], [-12, 5], [-7, 5], [-7, -4]])
    assert_equal(1, GeometryParser.polygons.size)
  end

  def test_find_relationship
    polygon1 = Factories.polygon(
      type: :convex_polygon,
      points: [
        [0, 0], [0, 10], [10, 10], [10, 0]
      ],
      id: 'polygon1'
    )
    polygon2 = Factories.polygon(
      type: :convex_polygon,
      points: [
        [1, 1], [2, 2], [3, 1]
      ],
      id: 'polygon2'
    )

    polygon1.find_relationship(polygon2)
    assert_equal(:surrounds, polygon1.relationships['polygon2'])
    assert_equal(:inside, polygon2.relationships['polygon1'])

    polygon2.find_relationship(polygon1)
    assert_equal(:separate, polygon2.relationships['polygon1'])

    polygon1 = Factories.polygon(
      type: :convex_polygon,
      points: [
        [4, 1], [8, 1], [6, 4]
      ],
      id: 'polygon1'
    )
    polygon2 = Factories.polygon(
      type: :convex_polygon,
      points: [
        [7, 3], [17, 3], [17, -3], [7, -3]
      ],
      id: 'polygon2'
    )

    polygon2.find_relationship(polygon1)
    assert_equal(:intersects, polygon1.relationships['polygon2'])
    assert_equal(:intersects, polygon2.relationships['polygon1'])
  end
end