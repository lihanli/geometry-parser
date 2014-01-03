module GeometryParser
  class Polygon
    def initialize(data)
      @name = data['id']
      @points = data['point']
      @valid = false
    end

    def valid?
      @valid
    end
  end
end
