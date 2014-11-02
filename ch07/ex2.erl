-module(ex2).
-export([
    test/0,
    term_to_packet/1
  ]).

% Write a function term_to_packet(Term) -> Packet that returns a binary consisting
% of a 4-byte length header N followed by N bytes of data produced by calling
% term_to_binary(Term).


test() ->
  <<N,N,N,N, 131,100,0,3,102,111,111>> = term_to_packet(foo),

  done.

term_to_packet(Term) ->
  Bin = term_to_binary(Term),
  <<1,1,1,1, Bin/binary>>.
