#!/bin/bash

# Improved script with error handling

find . -type f -print0 | while IFS= read -r -d $'\0' file; do
  echo "Processing: $file" >&2
  # Check the exit code of grep to detect errors 
  if grep "pattern" "$file" > /dev/null 2>&1; then
    echo "Done" >&2
  else
    echo "Error processing $file" >&2
    # Handle the error appropriately (e.g., logging, exiting, retrying)
    exit 1 
  fi
 done