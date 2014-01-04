module GeometryParser
  class << self
    attr_accessor :polygons
    GeometryParser.polygons = []
  end

  class Polygon
    attr_reader :segments, :points, :id
    attr_accessor :relationships

    def initialize(data)
      @id = data['id']
      @points = data['point'].map { |p| Point.new(p) }
      @valid = false
      @relationships = {}

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

    def has_point?(test_point)
      found = false
      prev_i = @points.size - 1

      (0..@points.size - 1).each do |i|
        if (@points[i].y > test_point.y != @points[prev_i].y > test_point.y) &&
           (test_point.x < (@points[prev_i].x - @points[i].x) * (test_point.y - @points[i].y) / (@points[prev_i].y - @points[i].y) + @points[i].x)
          found = !found
        end

        prev_i = i
      end

      found
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

    private

    def add_to_collection
      GeometryParser.polygons << self if @valid
    end
  end
end
