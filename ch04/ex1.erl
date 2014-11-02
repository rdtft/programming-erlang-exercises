-module(ex1).
-export([test/0]).
-export([area/1]).

% 1. Extend geometry.erl. Add clauses to compute the areas of circles and right-
% angled triangles. Add clauses for computing the perimeters of different
% geometric objects.

test() ->
  12  = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  1257 = round(area({circle, 20})),
  150 = round(area({tringle, 30, 10})),

  done.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, R}) -> math:pi() * (R * R);
area({tringle, A, B})  -> area({rectangle, A, B}) / 2.0.
