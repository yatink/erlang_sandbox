-module(list_helpers).
-export([zip_unequal/2, sublist/3, reverse/1, tail_reverse/1, quick_sort/1]).

zip_unequal(X, Y) ->
    zip_unequal(X, Y, []).

zip_unequal(_, [], Acc) ->
    Acc;
zip_unequal([], _, Acc) ->
    Acc;
zip_unequal([X|Xs], [Y|Ys], Acc) ->
    zip_unequal(Xs, Ys, Acc ++ [{X,Y}]).


sublist(List, Start, Length) ->
    sublist(List, Start, Length, [], 0).

sublist([], _, _, Acc, _) -> Acc;
sublist(_, Start, Length, Acc, Index) when Index >= Start + Length -> Acc;
sublist([_|Tail], Start, Length, Acc, Index) when Index < Start -> 
    sublist(Tail, Start, Length, Acc, Index + 1);
sublist([H|Tail], Start, Length, Acc, Index) when Index < Start + Length -> 
    sublist(Tail, Start, Length, Acc ++ [H], Index +1).
    
% Reverse
reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T)++[H].

% Tail Recursive Reverse
tail_reverse(List) ->
    tail_reverse(List, []).
tail_reverse([], Acc) ->
    Acc;
tail_reverse([H|T], Acc) ->
    tail_reverse(T, [H|Acc]).

% Quick Sort
quick_sort([]) ->
    [];
quick_sort([X|[]]) ->
    [X];
quick_sort([H|T]) -> 
    quick_sort([L || L<-T, L =< H]) ++ [H] ++ quick_sort([R || R<-T, R > H]).


