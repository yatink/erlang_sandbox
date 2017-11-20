-module(prime_numbers).
-export([factors/1, list_primes/1, is_divisible/2]).

% List out factors of a number
factors(N) ->
    ordsets:to_list(factors(N, 2, ordsets:new())).

% tail recursive helper for factors
factors(N, Idx, Acc) when (Idx*Idx =< N) and (N rem Idx =:= 0) -> factors(N div Idx, Idx, ordsets:add_element(Idx, Acc));
factors(N, Idx, Acc) when (Idx*Idx =< N) and (N rem Idx /= 0) -> factors(N, Idx + 1, Acc);
factors(N, Idx, Acc) when (Idx*Idx > N) -> ordsets:add_element(N, Acc).

% Checks if the first parameter is divisible by any of the entries in the list
is_divisible(_, []) -> false;
is_divisible(N, [H|T]) -> 
    case {(N rem H =:= 0), (H > round(math:sqrt(N)))}  of
        {true, _} -> true;
        {false, false} -> is_divisible(N, T);
        {false, true} -> false
    end.


% Tail recursive helper for list_primes
list_primes(Max, Current, Primes) when Current > Max -> 
    Primes;
list_primes(Max, Current, Primes) when Current =< Max ->
    case is_divisible(Current, Primes) of
        true -> list_primes(Max, Current + 1, Primes);
        false -> list_primes(Max, Current+1, Primes ++ [Current])
    end.

% List out prime numbers up to a certain Max value
list_primes(Max) when Max < 2 -> [];
list_primes(Max) when Max =:= 2-> [2]; 
list_primes(Max) when Max > 2 -> list_primes(Max, 3, [2]).
