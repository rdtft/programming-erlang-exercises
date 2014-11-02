-module(ex7).
-export([test/0]).

% TODO:
%
% erlc ex6.erl
%
% Add a function split(L) to math_functions.erl, which returns {Evens, Odds} where Evens is a
% list of all the even numbers in L and Odds is a list of all the odd numbers in L.
% Write this function in two different ways using accumulators and using the function filter you wrote in the previous exercise.

test() ->
  {[2, 4], [1, 3, 5]} = split1(lists:seq(1, 5)),
  {[2, 4], [1, 3, 5]} = split2(lists:seq(1, 5)),

  done.

split1(L) ->
  Evens = ex6:filter(fun(X) -> X rem 2 =:= 0 end, L),
  Odds  = ex6:filter(fun(X) -> X rem 2 =/= 0 end, L),
  {Evens, Odds}.

split2(L) ->
  split2(L, [], []).

split2([], Evens, Odds) -> {lists:reverse(Evens), lists:reverse(Odds)};

split2([H|T], Evens, Odds) ->
  case H rem 2 =:= 0 of
    true  -> split2(T, [H|Evens], Odds);
    false -> split2(T, Evens, [H|Odds])
  end.
