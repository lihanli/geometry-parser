require 'pry'
require 'minitest/autorun'
require 'turn'
require './lib/geometry_parser'
Turn.config.format = :pretty

module Factories
  module_function

  def point(x = 0, y = 0)
    GeometryParser::Point.new('x' => x, 'y' => y)
  end

  def points(arr)
    arr.map { |p| point(*p) }
  end

  def segment(x1, y1, x2, y2)
    GeometryParser::Segment.new(point(x1, y1), point(x2, y2))
  end
end

module GeometryParser
  class Test < MiniTest::Unit::TestCase
  end
end
