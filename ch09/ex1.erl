-module(ex1).
-export([
  test/0,
  foo/1,
  quux/2,
  bar/1]).

-spec test() -> atom().
-spec foo(N:: number()) -> number().
-spec quux(X:: integer(), Y:: number()) -> string().
-spec bar(A:: any()) -> any().

% Write some very small modules that export a single function. Write type
% specifications for the exported functions. In the functions make some type
% errors; then run the dialyzer on these programs and try to understand
% the error messages. Sometimes you’ll make an error but the dialyzer will
% not find the error; stare hard at the program to try to work out why you
% did not get the error you expected.

test() ->
  42   = foo(40),
  "42" = quux(4, 2),
  42.0 = bar(42.0),

  done.

foo(N) ->
  N + 42.

quux(X, Y) when is_integer(X) ->
  integer_to_list(X) ++ integer_to_list(Y).

bar(A) -> A.
