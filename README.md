Geometry Parser
===============

Processes a list of points that form shapes and outputs the relationships between all the shapes that are convex polygons. A shape can be either separate from, intersecting, inside, or containing another shape. 

#### Example:

Given <a href='https://github.com/lihanli/geometry-parser/blob/master/test/tests/integration/data/data.json' target='_blank'>this input</a>, the output is
```
odd is not a convex polygon
square surrounds triangle
square intersects rectangle
square is separate from pentagon
triangle is inside square
triangle intersects rectangle
triangle is separate from pentagon
rectangle intersects square
rectangle intersects triangle
rectangle is separate from pentagon
pentagon is separate from square
pentagon is separate from triangle
pentagon is separate from rectangle
```
