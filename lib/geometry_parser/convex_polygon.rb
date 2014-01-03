module GeometryParser
  class ConvexPolygon < Polygon
    def initialize(data)
      super

      if @points.size == 3
        @points[0]['x']
      end
    end
  end
end
