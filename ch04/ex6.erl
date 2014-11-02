-module(ex6).
-export([
    test/0,
    filter/2
  ]).

% Add a higher-order function to math_functions.erl
% called filter(F, L), which returns all the elements X in L for which F(X) is true.

test() ->
  [2, 4]    = filter(fun(X) -> X rem 2 =:= 0 end, lists:seq(1, 5)),
  [1, 3, 5] = filter(fun(X) -> X rem 2 =/= 0 end, lists:seq(1, 5)),
  done.

filter(F, L) ->
  [X || X <- L, F(X)].
