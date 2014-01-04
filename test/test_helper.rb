require 'pry'
require 'minitest/autorun'
require 'turn'
require './lib/geometry_parser'
Turn.config.format = :pretty

module Factories
  class << self
    attr_accessor :sequences
    Factories.sequences = {}
  end

  module_function

  def get_sequence(type)
    if sequences[type]
      val = sequences[type]
      sequences[type] += 1

      val
    else
      sequences[type] = 0
    end
  end

  def point(x = 0, y = 0)
    GeometryParser::Point.new('x' => x, 'y' => y)
  end

  def points(arr)
    arr.map { |p| point(*p) }
  end

  def segment(x1, y1, x2, y2)
    GeometryParser::Segment.new(point(x1, y1), point(x2, y2))
  end

  def polygon(points: [[0, 0], [1, 1], [2, 0]], type: :polygon, id: "shape#{get_sequence(:polygon)}")
    formatted_points = []
    points.each do |point|
      formatted_points << { 'x' => point[0], 'y' => point[1] }
    end

    "GeometryParser::#{type.to_s.camelize}".constantize.new('id' => id, 'point' => formatted_points)
  end
end

module GeometryParser
  class Test < MiniTest::Unit::TestCase
    def teardown
      GeometryParser.polygons = []
      super
    end
  end
end
