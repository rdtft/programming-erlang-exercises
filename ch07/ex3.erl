-module(ex3).
-export([
    test/0,
    packet_to_term/1
  ]).

% Write the inverse function packet_to_term(Packet) -> Term
% that is the inverse of the previous function.

test() ->
  foo = packet_to_term(<<1,1,1,1, 131,100,0,3,102,111,111>>),

  tests_worked.

packet_to_term(<<_Header:4/binary, Packet/binary>>) when is_binary(Packet) ->
  binary_to_term(Packet).
