-module(ex2).
-export([test/0]).

% Look at the type annotations in the code in the standard libraries. Find
% the source code for the module lists.erl and read all the type annotations.
%
%
%
% Example:
%
% -spec sum(List) -> number() when
%       List :: [number()].
%
% sum(L)          -> sum(L, 0).
% sum([H|T], Sum) -> sum(T, Sum + H);
% sum([], Sum)    -> Sum.
%
% -spec min(List) -> Min when
%       List :: [T,...],
%       Min :: T,
%       T :: term().
%
% min([H|T]) -> min(T, H).
% min([H|T], Min) when H < Min -> min(T, H);
% min([_|T], Min)              -> min(T, Min);
% min([],    Min)              -> Min. 

test() ->
  done.
