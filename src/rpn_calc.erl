-module(rpn_calc).
-export([rpn_agg/2, rpn/1]).

% rpn (Token, Accumulator stack) -> new accumulator stack 
rpn_agg(Acc, Token) -> 
    try {list_to_integer(Token), Acc} of
        {Val, Acc} -> [Val|Acc]
     catch
         error:badarg ->
             case {Token, Acc} of
                 {"+", [Elem1|[Elem2|C]]} -> [Elem1 + Elem2 | C];
                 {"-", [Elem1|[Elem2|C]]} -> [Elem1 - Elem2 | C];
                 {"*", [Elem1|[Elem2|C]]} -> [Elem1 * Elem2 | C];
                 {"/", [Elem1|[Elem2|C]]} -> [Elem1 div Elem2 | C]
             end
     end.
                     
rpn(Expression) ->
    lists:foldl(fun rpn_agg/2, [], string:tokens(Expression, " ")).
