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
end

module GeometryParser
  class Test < MiniTest::Unit::TestCase
  end
end
