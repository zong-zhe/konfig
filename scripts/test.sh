#!/bin/sh

# Stop on error.

# Note: Before you start tests, please install kcl
# kcl installation: https://kcl-lang.io/docs/user_docs/getting-started/install

set -e

find ./examples -name "kcl.mod" -exec dirname {} \; | while read -r dir; do
    if (cd "$dir" && kcl run); then
        echo "Test SUCCESSED - $dir"
    else
        echo "Test FAILED - $dir"
        exit 1
    fi
done
