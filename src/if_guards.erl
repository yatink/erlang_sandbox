-module(if_guards).
-export([weird_ifs/0, heh_fine/0]).

weird_ifs() ->
    if 1=:=1 ->
        works
    end,
    if 1=:=2 ->
        may_work
    end,
    if 1=:=2; 1=:=1 ->
        works
    end,
    if 1=:=2, 1=:=1 ->
        fails
    end.

heh_fine() ->
    if 1 =:= 1 ->
        works
    end,
    if 1 =:= 2; 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 ->
        fails
    end.
