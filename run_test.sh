#!/bin/sh

if [ $# -ne 1 ]; then
    echo usage: $0 "<script>"
    exit 2
fi

CMD=$1

export LANG=C LC_ALL=C

$CMD >$CMD.out.txt 2>$CMD.err.txt
RC=$?
if [ $RC -ne 0 ]; then
    echo $CMD: Error. RC=$RC
    exit 1
fi
if [ ! -e $CMD.out.expect.txt ]; then
    echo $CMD: Create expect file.
    cp $CMD.out.txt $CMD.out.expect.txt 
    exit 0
fi
if ! diff -q $CMD.out.expect.txt $CMD.out.txt; then
    echo $CMD: Unmatched. 
    exit 1
fi
echo $CMD: OK
