-module(tree).
-export([empty/0, insert/3, lookup/2, has_value_bidirectional/2]).

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

has_value_bidirectional(_, {node, 'nil'}) ->
    false;
has_value_bidirectional(Key, {node, {Key, _, _, _}}) ->
    true;
has_value_bidirectional(LookupKey, {node, {_, _, Left, Right}}) ->
    case has_value_bidirectional(LookupKey, Left) of
        true ->
            true;
        false -> has_value_bidirectional(LookupKey, Right)
    end.
