-module(ex3).
-export([
  test/0,
  ring/1]).

% Write a ring benchmark. Create N processes in a ring. Send a message
% round the ring M times so that a total of N * M messages get sent. Time
% how long this takes for different values of N and M.
%
% Write a similar program in some other programming language you are
% familiar with. Compare the results. Write a blog, and publish the results
% on the Internet!

test() ->
  N = 5,
  M = 16,
  Ring = ring(N),

  io:format("ring = ~p~nring length = ~p~n", [Ring, length(Ring)]),
  send(Ring, M),

  done.

ring(N) when N > 0 -> ring(N, 0).
ring(N, N) -> [];
ring(M, I) -> [spawn(fun() -> wait() end) | ring(M, I + 1)].

send(Ring, M) -> send(Ring, M, length(Ring)).
send(Ring, M, L) -> send(Ring, 1, M, L).
send(Ring, I, 0, L) -> done;
send(Ring, I, M, L) when I > L -> send(Ring, 1, M, L);

send(Ring, I, M, L) ->
  lists:nth(I, Ring) ! {ping, M},
  send(Ring, I + 1, M - 1, L).

wait() ->
  receive
    {ping, N} -> io:format("~p receive ~3w ping~n", [self(), N]), wait()
  end.
