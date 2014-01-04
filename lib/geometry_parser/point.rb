module GeometryParser
  class Point
    attr_accessor :x, :y

    # 0 => colinear, 1 => clockwise, -1 => counterclockwise
    def self.orientation(point1, point2, point3)
      area = (point2.x - point1.x) * (point3.y - point1.y) - (point2.y - point1.y) * (point3.x - point1.x)

      return area if area == 0
      area > 0 ? 1 : -1
    end

    def initialize(data)
      @x = data['x']
      @y = data['y']
    end

    def to_s
      "(#{@x}, #{@y})"
    end
  end
end
