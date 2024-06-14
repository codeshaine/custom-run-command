#!/bin/bash

# Function to get file extension
get_extension() {
  echo "${1##*.}"
}

# c++
compile_and_run_cpp() {
  local filename="$1"
  local basename="${filename%.*}" # Get the filename without extension

  g++ "$filename" -o "$basename"
  if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    "./$basename.exe"
  else
    echo "Compilation failed."
    exit 1
  fi
}

# java
compile_and_run_java() {
  local filename="$1"
  local basename="${filename%.*}" # Get the filename without extension
  javac "$filename"
  if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    java "$basename"
  else
    echo "Compilation failed."
    exit 1
  fi
}
# c
compile_and_run_c() {
  local filename="$1"
  local basename="${filename%.*}" # Get the filename without extension
  gcc "$filename" -o "$basename"
  if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    "./$basename.exe"
  else
    echo "Compilation failed."
    exit 1
  fi
}

# python
compile_and_run_python() {
  local filename="$1"
  python "$filename"
}

# go
compile_and_run_go() {
  local filename="$1"
  go run "$filename"
}

# rust
compile_and_run_rust() {
  local filename="$1"
  local basename="${filename%.*}" # Get the filename without extension

  rustc "$filename"

  if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    "./$basename.exe"
  else
    echo "Compilation failed."
    exit 1
  fi
}

# JavaScript
compile_and_run_js() {
  local filename="$1"
  local debug_mode="$2"

  if [ "$debug_mode" -eq 1 ]; then
    echo "Running in debug mode with nodemon..."
    nodemon "$filename"
  else
    echo "Running in normal mode with node..."
    node "$filename"
  fi
}

# typescript
compile_and_run_ts() {
  local filename="$1"
  local debug_mode="$2"

  if [ "$debug_mode" -eq 1 ]; then
    echo "Running in debug mode with nodemon..."
    nodemon "$filename"
  else
    echo "Running in normal mode with node..."
    ts-node "$filename"
  fi
}

# Parse command-line options
debug_mode=0
while getopts ":dh" opt; do
  case ${opt} in
  d)
    debug_mode=1
    ;;
  h)
    echo "Usage: $(basename $0) [-h] [-d] filename"
    echo "Options:"
    echo "  -h  Display this help message will update in future"
    echo "  -d  Run JavaScript files with nodemon"
    exit 0
    ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
    exit 1
    ;;
  esac
done
shift $((OPTIND - 1))

# Error handling function
handle_error() {
  echo "Error: $1"
  exit 1
}

# Check if the filename argument is provided
if [ -z "$1" ]; then
  handle_error "Please provide the filename"
fi

filename="$1"
extension=$(get_extension "$filename")

# Use a case statement to handle different file types
case "$extension" in
cpp)
  compile_and_run_cpp "$filename"
  ;;
c)
  compile_and_run_c "$filename"
  ;;
java)
  compile_and_run_java "$filename"
  ;;
py)
  compile_and_run_python "$filename"
  ;;
js)
  compile_and_run_js "$filename" "$debug_mode"
  ;;
ts)
  compile_and_run_js "$filename" "$debug_mode"
  ;;
go)
  compile_and_run_go "$filename" "$debug_mode"
  ;;
rs)
  compile_and_run_rust "$filename" "$debug_mode"
  ;;
txt)
  echo "This is a text file. No compilation needed."
  ;;
jpg | jpeg)
  echo "This is a JPEG image file. No compilation needed."
  ;;
*)
  handle_error "Unsupported file type: $extension"
  ;;
esac
