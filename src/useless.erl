-module(useless).
-export([hello/0, add/2, greet_and_add_two/1]).
-import(io, [format/1]).

hello() ->
    format("Hello, world!~n").

add(A,B) ->
    A + B.

greet_and_add_two(X) ->
    hello(),
    add(X,2).

-define(sub(X,Y), add(X, -Y)).
