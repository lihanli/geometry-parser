module GeometryParser
  module ConvexHull
    module_function

    def convert(points)
      size = points.size
      valid_indices = Array.new(size, -1)

      left_most_idx = 0
      (1..size - 1).each do |i|
        left_most_idx = i if points[i].x < points[left_most_idx].x
      end

      idx = left_most_idx
      while true
        next_idx = (idx + 1) % size

        (0..size - 1).each do |i|
          next_idx = i if Point.orientation(points[idx], points[i], points[next_idx]) == -1
        end

        valid_indices[idx] = next_idx
        idx = next_idx

        break if idx == left_most_idx
      end

      hull = []
      (0..size - 1).each do |i|
        hull << points[i] unless valid_indices[i] == -1
      end

      hull
    end
  end
end
