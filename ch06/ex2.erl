-module(ex2).
-export([test/0]).

% Rewrite the code in try_test.erl so that it produces two error messages: a
% polite message for the user and a detailed message for the developer.

test() ->
  {1, normal, a} = catcher(1),

  done.

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X  -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.

% erlang:get_stacktrace()

% FIXME: R13 can't find  error/1 function
error(E) -> erlang:error(E).
