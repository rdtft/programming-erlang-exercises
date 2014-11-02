-module(ex4).
-export([test/0]).

%
% TODO:
%
% $erlc ex2.erl
% $erlc ex3.erl
%
% Write some tests in the style of Adding Tests to Your Code, on page 44,
% to test that the previous two functions can correctly encode terms into packets
% and recover the original terms by decoding the packets.

test() ->
  {quux, 42} = ex3:packet_to_term(ex2:term_to_packet({quux, 42})),
  [foo, bar] = ex3:packet_to_term(ex2:term_to_packet([foo, bar])),

  done.
