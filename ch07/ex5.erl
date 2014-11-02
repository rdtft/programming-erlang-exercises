-module(ex5).
-export([test/0]).

% Write a function to reverse the bits in a binary.

test() ->
  <<2#1000:4>> = reverse(<<2#0001:4>>),

  tests_worked.

reverse(Bin) ->
  list_to_binary(lists:reverse([X || <<X:1>> <= Bin])).
