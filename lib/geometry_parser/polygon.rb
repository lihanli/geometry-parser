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

    def convex?
      return false unless simple?

      ConvexHull.convert(@points).size == @points.size
    end

    def simple?
      @segments.each_with_index do |segment, i|
        break if i == @segments.size - 1

        (i + 1..@segments.size - 1).each do |other_segment_idx|
          return false if segment.intersects?(@segments[other_segment_idx])
        end
      end

      true
    end

    def valid?
      @valid
    end
  end
end
