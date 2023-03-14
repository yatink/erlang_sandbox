-module(monotonic_stack).
-export([buildStack/1, buildStack/3]).

buildStack([], _, Acc) ->
    Acc;
buildStack([H|T], [], Acc) -> buildStack(T, [H], Acc);
buildStack([H|T], [S|TK], Acc) when S > H -> 
    io:format("When S > H"),
    erlang:display(Acc),
    buildStack(T, [H|[S|TK]], Acc); 
buildStack([H|T], [S|TK], Acc) when S =< H ->
    io:format("When S <= H"),
    erlang:display(Acc),
    buildStack([H|T], TK, maps:put(S, [H|maps:get(H,Acc,[])], Acc)).
buildStack(L) -> buildStack(L, [], #{}).
    


    
