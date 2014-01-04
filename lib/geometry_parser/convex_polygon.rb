module GeometryParser
  class ConvexPolygon < Polygon
    def initialize(*)
      super
      @valid = convex?
      add_to_collection
    end

    def find_relationship(convex_polygon)
      convex_polygon.points.each do |point|
      end
    end
  end
end
