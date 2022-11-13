#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Apple Dictionary Search
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📕
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description 標準辞書で検索

open "dict://${1}"

