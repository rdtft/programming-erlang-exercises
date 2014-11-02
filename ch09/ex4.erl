-module(ex4).
-export([test/0]).

% Experiment with opaque types. Create two modules; the first should export
% an opaque type. The second module should use the internal data struc-
% tures of the opaque type exported by the first module in such a way as
% to cause an abstraction violation. Run the dialyzer on the two modules
% and make sure you understand the error messages.

test() ->
  Figure = a:make_figure({1, 1}, {2,3}),
  {P1, _P2} = Figure,
  {X, Y} = P1,

  done.
