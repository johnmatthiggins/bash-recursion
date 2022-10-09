#!/usr/bin/env bash

# initialize with 4096 bytes of memory
export MEM_SIZE=0x1000
export F=mem
INDEX=0

# make sure our memory is empty
rm mem

# Load memory
seq $MEM_SIZE | xargs -I '{}' sh -c 'echo 0 >> $F'

function evaluate {
    case $1 in
        .)
            perl -e "printf ('%c', $(tail -n $INDEX $F | head -n 1))"
            ;;
        >)
            POSITION=$(expr $POSITION + 1)
            ;;
        <)
            POSITION=$(expr $POSITION - 1)
            ;;
        +)
            ;;
        -)
            ;;
        ,)
            ;;
        \])
            ;;
        \[)
            ;;
        *)
            # do nothing if it isn't one of our operators
            ;;
    esac
}
