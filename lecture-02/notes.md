# Lecture 02: Shell Tools & Scripting

## Key Concepts
- Spaces are reserved something the shell treats 'foo bar' as a command foo with arguement bar sperated by space.
- In general in shell scripting spaces will split words into arguements.
- Single quotes allow you to have string literals with no substitutiion whereas double quotes will preserve some substitution.
- You can communicate with the shell using reversed keywords and certain variables that are set.
- `$_` - Last argument from the last command. If you are in an interactive shell, you can also quickly get this value by typing `Esc` followed by . or `Alt+.`.
- Return codes are a way for a program to report how execution went 0 usually means success or no errors to report >0 means some error occured.
- Scripts and data file can have shebang lines, when used as executables, the shebang tells the program loader that what follows is the path to the way to interpret the file.
- Non-native commands can come with man pages the same way native commands do.
- `find` - will allow you to find files matching some criteria.

## Examples
```bash
#!/bin/bash

echo "Starting programing at $(date)"

echo "Running program $0 with $# arguments on process $$"

for file in "$@"; do 
    grep foobar "$file" /dev/null &>2

    if [[ $? -ne 0 ]]; then

        echo "Found 'foobar': $file"
    fi 
done
```

## Questions/Confusions
[stuff that didn't click yet]

## Exercises

1. **Q: Read man ls and write an ls command that lists files in the following manner
    - Includes all files, including hidden files
    - Sizes are listed in human readable format (e.g. 454M instead of 454279954)
    - Files are ordered by recency
    - Output is colorized
    - A sample output would look like this**

    A: `ls -alth --color=auto`

    Output:
```
    total 32
    -rw-r--r--  1 nkululekojonas  staff    12K 18 Nov 13:09 .notes.md.swp
    drwxr-xr-x  5 nkululekojonas  staff   160B 18 Nov 13:09 .
    -rw-r--r--  1 nkululekojonas  staff   3.2K 18 Nov 13:01 notes.md
    drwxr-xr-x  6 nkululekojonas  staff   192B 18 Nov 10:21 ..
    drwxr-xr-x  2 nkululekojonas  staff    64B 18 Nov 10:19 exercises
```

2. **Q: Write bash functions marco and polo that do the following. Whenever you execute marco the current working directory should be saved in some manner, then when you execute polo, no matter what directory you are in, polo should cd you back to the directory where you executed marco. For ease of debugging you can write the code in a file marco.sh and (re)load the definitions to your shell by executing source marco.sh.**

    A: **See exercises**

3. **Q: Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.**

random.sh:
```bash 
    #!/usr/bin/env bash

    n=$(( RANDOM % 100 ))

    if [[ n -eq 42 ]]; then
        echo "Something went wrong" >&2 
        echo "The error was using magic numbers"
        exit 1
    fi

    echo "Everything went according to plan"
```

Solution:
debug.sh
```bash
    #!/bin/bash

    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 file"
        exit 1
    fi 

    error_file="${1}-error.log"
    output_file="${1}-output.log"

    count=0
    while true; do
    (( count++))

    if ! ./"$1" >> "$output_file" 2>> "$error_file"; then
        echo "Script failed after $count runs"
        echo ""
        echo "=== Standard Output ==="
        cat "$output_file"
        echo ""
        echo "=== Standard Error ==="
        cat "$error_file"
        break
    fi
    done
```

4. **Q: Your task is to write a command that recursively finds all HTML files in the folder and makes a zip with them. Note that your command should work even if the files have spaces (hint: check -d flag for xargs)**

    A: `fd -e html -X zip html_files.zip`

5. **Q: (Advanced) Write a command or script to recursively find the most recently modified file in a directory. More generally, can you list all files by recency?**

    A:
