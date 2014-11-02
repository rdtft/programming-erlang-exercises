-module(ex2).
-export([
  test/0,
  max/1]).

% Measure the process spawning time on your machine, using the program
% in Section 12.3, Processes Are Cheap, on page 185. Plot a graph of the
% number of processes against the process creation time. What can you
% deduce from the graph?

test() ->
  ex2:max(10000),
  ex2:max(20000),
  ex2:max(30000),
  ex2:max(32000),

  done.

%% max(N)
%%   Create N processes then destroy them
%%   See how much time this takes

max(N) ->
  Max = erlang:system_info(process_limit),
  io:format("Maximum allowed processes:~p~n",[Max]),
  statistics(runtime),
  statistics(wall_clock),
  L = for(1, N, fun() -> spawn(fun() -> wait() end) end),
  {_, Time1} = statistics(runtime),
  {_, Time2} = statistics(wall_clock),
  lists:foreach(fun(Pid) -> Pid ! die end, L),
  U1 = Time1 * 1000 / N,
  U2 = Time2 * 1000 / N,
  io:format("Process spawn time=~p (~p) microseconds~n", [U1, U2]).

wait() ->
  receive die -> void end.

for(N, N, F) -> [F()];
for(I, N, F) -> [F()|for(I+1, N, F)].
