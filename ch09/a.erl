-module(a).
-export([make_figure/2]).

-export_type([point/0]).
-opaque point() :: {number(), number()}.

-spec make_figure(P1, P2) -> {P1, P2} when
  P1 :: point(),
  P2 :: point().

make_figure(P1, P2) -> {P1, P2}.
