module GeometryParser
  class Polygon
    def initialize(data)
      @points = data['point']
      @name = data['id']
    end
  end
end