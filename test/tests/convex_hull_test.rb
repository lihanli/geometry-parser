require 'test_helper'

class ConvexHullTest < GeometryParser::Test
  def setup
    super
    @Point = GeometryParser::Point
  end

  def test_convert
    # 8 7 7 7 -7 -7 -7 -7 7 9 0 -9 0 0 9 0 -9
  end
end