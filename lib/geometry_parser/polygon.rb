module GeometryParser
  class Polygon
    attr_reader :segments

    def initialize(data)
      @name = data['id']
      @points = data['point'].map { |p| Point.new(p) }
      @valid = false

      @segments = []
      (0..@points.size - 1).each do |i|
        if i == @points.size - 1
          @segments << Segment.new(@points[i], @points[0])
        else
          @segments << Segment.new(@points[i], @points[i + 1])
        end
      end
    end

    def valid?
      @valid
    end
  end
end
