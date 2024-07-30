#!/bin/sh

# Stop on error.

# Note: Before you start tests, please install kcl
# kcl installation: https://kcl-lang.io/docs/user_docs/getting-started/install

set -e

# Define the output file
output_file="kcl_run_output.txt"

# Clear the output file if it exists
> "$output_file"

find ./examples -name "kcl.mod" -exec dirname {} \; | while read -r dir; do
    if (cd "$dir" && kcl run >> "../$output_file" 2>&1); then
        echo "\033[32mTest SUCCESSED - $dir\033[0m\n" >> "../$output_file"
    else
        echo "\033[31mTest FAILED - $dir\033[0m\n" >> "../$output_file"
        exit 1
    fi
done
