module GeometryParser
  class ConvexPolygon < Polygon
    def initialize(*)
      super
      @valid = convex?
      add_to_collection
    end

    def find_relationship(convex_polygon)
      found_points = 0
      convex_polygon.points.each do |point|
        found_points += 1 if has_point?(point)
      end

      other_id = convex_polygon.id
      if found_points == convex_polygon.points.size
        @relationships[other_id] = :surrounds
        convex_polygon.relationships[@id] = :inside
      elsif found_points > 0
        @relationships[other_id] = :intersects
        convex_polygon.relationships[@id] = :intersects
      else
        @relationships[other_id] = :separate
      end

      @relationships[other_id]
    end
  end
end
