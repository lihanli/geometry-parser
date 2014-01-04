module GeometryParser
  class ConvexPolygon < Polygon
    def initialize(*)
      super
      @valid = convex?
      add_to_collection
    end
  end
end
