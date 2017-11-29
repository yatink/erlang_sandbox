-module(rpn_calc).
-export([rpn_agg/2, rpn/1, rpn_test/0]).

% rpn_agg (Token, AccIn) -> AccOut

rpn_agg("+", [Elem1|[Elem2|C]]) -> [Elem2 + Elem1 | C];
rpn_agg("-", [Elem1|[Elem2|C]]) -> [Elem2 - Elem1 | C];
rpn_agg("*", [Elem1|[Elem2|C]]) -> [Elem2 * Elem1 | C];
rpn_agg("/", [Elem1|[Elem2|C]]) -> [Elem2 div Elem1 | C];
rpn_agg(Token, Acc) -> [list_to_integer(Token)|Acc].
    

rpn(Expression) ->
    [Res] = lists:foldl(fun rpn_agg/2, [], string:tokens(Expression, " ")),
    erlang:display(Res),
    Res.

rpn_test() ->
    5 = rpn("2 3 +"),
    1 = rpn("3 2 -"),
    -2 = rpn("10 4 3 + 2 * - 2 /"),
    ok = try 
             rpn("90 34 12 33 55 66 + * - +") 
         catch
             error:{badmatch, [_|_]} -> ok
         end.
        
