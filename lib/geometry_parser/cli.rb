module GeometryParser
  module Cli
    module_function

    def run(file)
      data = JSON.parse(file.read)
      data['geometry']['shape'].each do |shape|
        polygon = ConvexPolygon.new(shape)
        puts "#{polygon.id} is not a convex polygon" unless polygon.valid?
      end

      Polygon.find_all_relationships

      GeometryParser.polygons.each do |polygon|
        polygon.relationships.each do |id, relationship|
          if relationship == :separate
            relationship_string = 'is separate from'
          elsif relationship == :inside
            relationship_string = 'is inside'
          else
            relationship_string = relationship.to_s
          end

          puts "#{polygon.id} #{relationship_string} #{id}"
        end
      end
    end
  end
end
