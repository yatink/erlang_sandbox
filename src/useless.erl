-module(useless).
-export([hello/0, add/2, greet_and_add_two/1, same/2, valid_time/1, correct_age/1, wrong_age/1]).
-import(io, [format/1]).

hello() ->
    format("Hello, world!~n").

add(A,B) ->
    A + B.

greet_and_add_two(X) ->
    hello(),
    add(X,2).

-define(sub(X,Y), add(X, -Y)).

% Pattern Matching
same(A,A) ->
    true;
same(_,_) ->
    false.

valid_time({Date = {_,_,_}, Time = {_,_,_}}) ->
    io:format("The Date is (~p) and the time is ~p ~n", [Date, Time]);
valid_time(_) ->
    io:format("Give me some good data yo!~n").

correct_age(X) when X >= 16, X =< 104 ->
    true;
correct_age(_) ->
    false.

wrong_age(X) when X < 16; X > 104 ->
    true;
wrong_age(_) ->
    false.
