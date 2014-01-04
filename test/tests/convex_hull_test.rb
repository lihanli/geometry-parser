require 'test_helper'

class ConvexHullTest < GeometryParser::Test
  def test_convert
    points = Factories.points([[0, 3], [2, 2], [1, 1], [2, 1], [3, 0], [0, 0], [3, 3]])
    assert_equal('(0, 3) (3, 0) (0, 0) (3, 3)', GeometryParser::ConvexHull.convert(points).map(&:to_s).join(' '))
  end
end