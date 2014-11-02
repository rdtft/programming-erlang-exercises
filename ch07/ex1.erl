-module(ex1).
-export([test/0]).

% Write a function that reverses the order of bytes in a binary.

test() ->
  <<1,1,0,0>> = reverse(<<0,0,1,1>>),
  <<1,1,2,2>> = reverse(<<2,2,1,1>>),
  <<0,0,0,0,1,1,1,1>> = reverse(<<1,1,1,1,0,0,0,0>>),

  done.

reverse(X) when is_binary(X) ->
  list_to_binary(lists:reverse(binary_to_list(X))).
