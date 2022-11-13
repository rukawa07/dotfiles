#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Longman Search
# @raycast.mode silent

# Optional parameters:
# @raycast.icon img/longman.png
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Looking up words in Longman

open "https://www.ldoceonline.com/dictionary/${1/ /-}"


