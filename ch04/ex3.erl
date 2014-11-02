-module(ex3).
-export([test/0]).

% Look up the definitions of erlang:now/0, erlang:date/0, and erlang:time/0. Write a
% function called my_time_func(F), which evaluates the fun F and times how
% long it takes. Write a function called my_date_string() that neatly formats the
% current date and time of day.

test() ->
  T1 = my_time_func(fun() -> timer:sleep(1000) end),
  T1 = 1,

  my_date_string(),
  done.

my_time_func(F) when is_function(F) ->
  {_, Sec1,_} = now(),
  F(),
  {_, Sec2,_} = now(),
  Sec2 - Sec1.

my_date_string() ->
  {Year, Month, Day} = date(),
  {Hours, Min, _} = time(),
  io:format("~2..0B.~2..0B.~B ~2..0B:~2..0B~n", [Day, Month, Year, Hours, Min]).
