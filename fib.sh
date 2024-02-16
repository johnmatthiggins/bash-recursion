#!/usr/bin/env bash
printf "1\n1\n" | tee -a fib_out && seq $(expr $1 - 2) | xargs -n 1 sh -c 'echo $(expr $(tail -n 1 fib_out) + $(tail -n 2 fib_out | head -n 1)) | tee -a fib_out' && rm fib_out
