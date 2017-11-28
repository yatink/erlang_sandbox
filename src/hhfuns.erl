-module(hhfuns).
-compile(export_all).

% Simple Example
one() -> 1.
two() -> 2.

add(X,Y) ->
    X() + Y().

% Increment and Decrement Naive
n_incr([]) ->
    [];
n_incr([H|T]) ->
    [ H+1 |n_incr(T)].

n_decr([]) ->
    [];
n_decr([H|T]) ->
    [ H-1 | n_decr(T) ].

% Higher Order Increment and Decrement
map(_, []) ->
    [];
map(X, [H|T]) ->
    [X(H) | map(X, T)].

incr(A) ->
    A + 1.
decr(A) ->
    A - 1.

% Anonymous functions
base() ->
    A = 1,
    io:format("Hello"),
    fun() ->
            io:format("Hello" ++ [A]),
            A + 1
    end.

% Other Higher Order Abstractions
filter(F, List) ->
    filter(F, List, []).
filter(_, [], Acc) -> Acc;
filter(F, [H|T], Acc) -> 
    case F(H) of
          true -> filter(F, T, [H|Acc]);
          false -> filter(F, T, Acc)
    end.


foldL(_, Acc, []) ->
    Acc;
foldL(F,  Acc, [H|T]) ->
    foldL(F, F(Acc, H), T).


foldR(_, Acc, []) ->
    Acc;
foldR(F, Acc, [H|T]) ->
    F(H, foldR(F, Acc, T)).


%foldL(F, 0, [2,3]) -> foldL(F, F(0, 2), [3]) -> foldL(F, F(F(0, 2), 3), []) -> F(F(0, 2), 3)

%foldR(F, 0, [2,3]) -> F(2, foldR(F, 0, [3])) -> F(2, F(3, foldR(F, 0, []))) -> F(2, F(3, 0))
