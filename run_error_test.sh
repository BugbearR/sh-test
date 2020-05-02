#!/bin/sh

if [ $# -ne 1 ]; then
    echo usage: $0 "<script>"
    exit 1
fi

CMD=$1

export LANG=C LC_ALL=C

$CMD >$CMD.out.txt 2>$CMD.err.txt
RC=$?
if [ $RC -eq 0 ]; then
    echo $CMD: Expected error did not occur.
    exit 1
fi
echo $CMD: OK RC=$RC
