-module(ex1).
-export([
  test/0,
  loop/0,
  start/2]).

% Write a function start(AnAtom, Fun) to register AnAtom as spawn(Fun). Make sure
% your program works correctly in the case when two parallel processes
% simultaneously evaluate start/2. In this case, you must guarantee that one
% of these processes succeeds and the other fails

test() ->
  quux   = ex1:start(quux, fun loop/0),
  failed = ex1:start(quux, fun loop/0),

  done.

loop() ->
  receive
    ping -> pong;
    foo -> bar
  end.

start(AtomName, Fun) ->
  case whereis(AtomName) of
    undefined -> register(AtomName, spawn(Fun)), AtomName;
    _Pid -> failed
  end.

