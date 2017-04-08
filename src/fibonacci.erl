-module(fibonacci).
-export([fib/1, tail_fib/1, tail_fib/4]).

% Fibonacci number generator
fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

% tail recursive helper for fibonacci number generator
tail_fib(N) -> tail_fib(N, 0, 0, 1).
tail_fib(N, N, _, Y) -> Y;
tail_fib(N, 0, _, _) -> tail_fib(N, 1, 0, 1);
tail_fib(N, 1, _, _) -> tail_fib(N, 2, 1, 1);
tail_fib(N, Current, X, Y) -> tail_fib(N, Current + 1, Y, X+Y).
