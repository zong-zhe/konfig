#!/bin/sh

# Stop on error.

# Note: Before you start tests, please install kcl
# kcl installation: https://kcl-lang.io/docs/user_docs/getting-started/install

set -e

# 定义输出文件
# OUTPUT_FILE="/Users/zongz/Workspace/kusionstack/konfig/test_results.txt"

# 清空输出文件
# > "$OUTPUT_FILE"

find ./examples -name "kcl.mod" -exec dirname {} \; | while read -r dir; do
    if (cd "$dir" && kcl run); then
        echo "\033[32mTest SUCCESSED - $dir\033[0m\n" | tee -a "$OUTPUT_FILE"
    else
        echo "\033[31mTest FAILED - $dir\033[0m\n" | tee -a "$OUTPUT_FILE"
        exit 1
    fi
done