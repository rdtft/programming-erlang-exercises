-module(ex1).
-export([test/0]).

%
% TODO:
% $ erlc myfile.erl
%
% file:read_file(File) returns {ok, Bin} or {error, Why}, where File is the filename and
% Bin contains the contents of the file. Write a function myfile:read(File) that
% returns Bin if the file can be read and raises an exception if the file cannot
% be read.

test() ->
  _Bin1 = myfile:read("ex1.erl"),
  _Bin2 = myfile:read("Makefile"),

  catch myfile:read("quux42"),

  try myfile:read("quux42")
  catch
    throw:_Why -> _Why
  end,

  done.
