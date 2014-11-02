-module(ex2).
-export([test/0]).

% The BIF tuple_to_list(T) converts the elements of the tuple T to a list. Write a
% function called my_tuple_to_list(T) that does the same thing only not using
% the BIF that does this.

test() ->
  [a, b, c] = tuple_to_list({a, b, c}),
  [a, b, c] = my_tuple_to_list({a, b, c}),
  [] = my_tuple_to_list({}),
  [a] = my_tuple_to_list({a}),
  done.

my_tuple_to_list(T) -> my_tuple_to_list(T, 1, tuple_size(T)).
my_tuple_to_list(_T, _N, 0)  -> [];
my_tuple_to_list(T, N, Size) -> [element(N, T) | my_tuple_to_list(T, N+1, Size-1)].
