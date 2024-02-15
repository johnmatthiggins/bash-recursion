#!/usr/bin/env bash

printf "0\n1\n" | cat - >> fib_out && seq $(expr $1 - 2) | xargs -n 1 sh -c 'echo $(expr $(tail -n 1 fib_out) + $(tail -n 2 fib_out | head -n 1)) >> fib_out' && cat fib_out && rm fib_out
