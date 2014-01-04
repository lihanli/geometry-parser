module GeometryParser
  class Point
    attr_accessor :x, :y

    # 0 => colinear, 1 => clockwise, -1 => counterclockwise
    def self.orientation(point1, point2, point3)
      area = (point2.x - point1.x) * (point3.y - point1.y) - (point2.y - point1.y) * (point3.x - point1.x)

      return area if area == 0
      area > 0 ? 1 : -1
    end

    # check if point2 lies on segment point1, point3
    def self.on_segment?(point1, point2, point3)
      x_values = [point1.x, point3.x]
      y_values = [point1.y, point3.y]

      (point2.x <= x_values.max &&
       point2.x >= x_values.min &&
       point2.y <= y_values.max &&
       point2.y >= y_values.min)
    end

    def initialize(data)
      @x = data['x']
      @y = data['y']
    end

    def ==(point)
      @x == point.x && @y == point.y
    end

    def to_s
      "(#{@x}, #{@y})"
    end
  end
end
