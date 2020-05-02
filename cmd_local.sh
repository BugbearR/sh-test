#!/bin/sh

test_local_sub_nest() {
    x='C'
    echo $x
}

test_local_sub() {
    local x
    x='B'
    echo $x
    test_local_sub_nest
    echo $x
}

x='A'
echo $x
test_local_sub
echo $x
