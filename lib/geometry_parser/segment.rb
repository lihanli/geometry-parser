module GeometryParser
  class Segment
    attr_accessor :point1, :point2

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    def intersects?(segment)
      o1 = Point.orientation(@point1, @point2, segment.point1)
      o2 = Point.orientation(@point1, @point2, segment.point2)
      o3 = Point.orientation(segment.point1, segment.point2, @point1)
      o4 = Point.orientation(segment.point1, segment.point2, @point2)

      return true  if o1 != o2 && o3 != o4

      
    end
  end
end
