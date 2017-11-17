-module(tree).
-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert(InsKey, InsValue, {node, 'nil'}) ->
    {node, {InsKey, InsValue, empty(), empty()}};
insert(InsKey, InsValue, {node, {Key, Value, Smaller, Larger}}) when InsKey < Key -> 
    {node, {Key, Value, insert(InsKey, InsValue, Smaller), Larger}};
insert(InsKey, InsValue, {node, {Key, Value, Smaller, Larger}}) when InsKey > Key -> 
    {node, {Key, Value, Smaller, insert(InsKey, InsValue, Larger)}};
insert(Key, InsValue, {node, {Key, _, Smaller, Larger}}) -> 
    {node, {Key, InsValue, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
    'nil';
lookup(LookupKey, {node, {Key, _, Smaller, _}}) when LookupKey < Key ->
    lookup(LookupKey, Smaller);
lookup(LookupKey, {node, {Key, _, _, Larger}}) when LookupKey > Key ->
    lookup(LookupKey, Larger);
lookup(Key, {node, {Key, Value, _, _}}) ->
    Value.
