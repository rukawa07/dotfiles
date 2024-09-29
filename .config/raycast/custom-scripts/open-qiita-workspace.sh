#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Qiita Workspace
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📝

# Documentation:
# @raycast.description VSCodeでQiitaのリポジトリを開くスクリプト

if command -v code; then
    code ~/Documents/qiita
else
    echo "VSCode is not installed."
fi
