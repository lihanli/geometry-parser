require 'test_helper'

class IntegrationTest < MiniTest::Unit::TestCase
  def test
    assert_equal("odd is not a convex polygon\nsquare surrounds triangle\nsquare intersects rectangle\nsquare is separate from pentagon\ntriangle is inside square\ntriangle intersects rectangle\ntriangle is separate from pentagon\nrectangle intersects square\nrectangle intersects triangle\nrectangle is separate from pentagon\npentagon is separate from square\npentagon is separate from triangle\npentagon is separate from rectangle\n", `bundle exec ruby bin/geometry_parser test/tests/integration/data/data.json`)
  end
end