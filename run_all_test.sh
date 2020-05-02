#!/bin/sh

./run_test.sh ./hello.sh
./run_error_test.sh ./error.sh
./run_error_test.sh ./shebang_cmd_not_exist.sh
./run_test.sh ./no_shebang.sh
./run_test.sh ./cmd_local.sh
