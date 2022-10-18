#!/usr/bin/env bash
printf "1\n2\n" | cat - >> out && seq 3 $1 | xargs -I "{}" sh -c 'echo $(expr "{}" \* $(tail -n 1 out)) >> out' && cat out && rm out
