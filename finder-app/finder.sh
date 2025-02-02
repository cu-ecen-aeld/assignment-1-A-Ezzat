#!/bin/sh

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Count the number of files in the directory and subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines in the files
line_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the result
echo "The number of files are $file_count and the number of matching lines are $line_count"
