module GeometryParser
  class Segment
    attr_reader :point1, :point2

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    def intersects?(segment)
      # ignore endpoint to endpoint intersections
      return false if @point1 == segment.point2 || @point2 == segment.point1

      o0 = Point.orientation(@point1, @point2, segment.point1)
      o1 = Point.orientation(@point1, @point2, segment.point2)
      o2 = Point.orientation(segment.point1, segment.point2, @point1)
      o3 = Point.orientation(segment.point1, segment.point2, @point2)
      return true if o0 != o1 && o2 != o3

      [
        [@point1, segment.point1, @point2],
        [@point1, segment.point2, @point2],
        [segment.point1, @point1, segment.point2],
        [segment.point1, @point2, segment.point2]
      ].each_with_index do |points, i|
        return true if eval("o#{i}") == 0 && Point.on_segment?(*points)
      end

      false
    end

    def to_s
      "#{@point1.to_s}-#{@point2.to_s}"
    end
  end
end
