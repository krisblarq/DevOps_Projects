#!/bin/bash

# Display current working directory
echo "Current working directory: $PWD"

# Create new directory
echo "Creating new directory....."
mkdir my_directory
echo "New directory created"

# Change to the new directory
echo "Changing to the new directory"
cd my_directory
echo "Current directory: $PWD"

# Create some files.
echo "Creating some files...."
touch file1.txt file2.txt file3.txt
echo "Files Created"

# List files in current working directory
echo " Files in the current working directory are.."
ls

# Move one level up
echo "Moving one level up.."
cd ..
echo "Current working directory: $PWD"

# Remove the new directory and it's content
echo "Removing the new directory.."
rm -rf my_directory
echo "Directory removed"

# List all the files in the current directory again.
echo "Listing all files in current directory:"
ls