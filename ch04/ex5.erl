-module(ex5).
-export([test/0]).

% TODO:
% $ erlc math_functions.erl
%
% Write a module called math_functions.erl, exporting the functions even/1 and odd/1.
% The function even(X) should return true if X is an even integer and otherwise false.
% odd(X) should return true if X is an odd integer.

test() ->
  true = math_functions:even(2),
  true = math_functions:even(0),
  true = math_functions:even(100),
  false = math_functions:even(101),
  true = math_functions:odd(101),
  false = math_functions:odd(0),
  false = math_functions:odd(42),

  done.
