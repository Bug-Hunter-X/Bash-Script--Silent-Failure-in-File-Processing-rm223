#!/bin/bash

# This script attempts to process files in a directory, but has a subtle bug.

find . -type f -print0 | while IFS= read -r -d $'\0' file; do
  # Incorrect way to handle potential errors
  echo "Processing: $file"  >&2
  # Here's a scenario where the command might fail silently
  grep "pattern" "$file" > /dev/null 2>&1
  echo "Done" >&2
 done