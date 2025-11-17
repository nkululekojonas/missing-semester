# Lecture 01: Course Overview + The Shell

## Key Concepts
- Shells are programs your computer has that allow you to interact to interact via CLI.

### MacOS Shells

MacOS like most Unix like systems ships with a list of POSIX compliant shells found in /etc/shells.
You can use `chsh` command to change to any of these shells. 

## Commands I learned
- Covered commands I was already familiar with, these included:
    - cd - filesystem navigation
    - ls - list directory contents

## Questions/Confusions
[stuff that didn't click yet]

## Exercises

1.  **Q: Test current shell** 
    A: `echo "$SHELL"`

2. **Q: Create a new directory called missing under /tmp.**
   A: mkdir -p tmp/missing    

3. **Q: Look up the touch program.**
   A: touch - change access and modification times for a file, this also creates the file with the current access/modification time if it doesnt exist.

4. **Q: Use touch to create a new file called semester in missing.**
   A: touch tmp/missing/semester

5. **Q: Write the following into that file, one line at a time:**

    ```bash
    #!/bin/sh
    curl --head --silent https://missing.csail.mit.edu
    ```
    A: echo '#!/bin/sh\ncurl --head --silent https://missing.csail.mit.edu' > semester

6. **Q: Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter.**
    A: Executing ./semester fails because the execute permission isn't set on the file for the current user.

7. **Q: Run the command by explicitly starting the sh interpreter, and giving it the file semester as the first argument, i.e. sh semester. Why does this work, while ./semester didn’t?**

    A: Running `sh ./semster` works because the exectuable program sh reads and runs all the commands listed in the script, the first line is ignored because it is read a comment.
    Running `./semester` would requires execute perimission on the file.

8. **Q: Look up the chmod program (e.g. use man chmod).**
    
    A: chmod - allows you to change the perimssions of the listed files.

9. **Q: Use chmod to make it possible to run the command ./semester rather than having to type sh semester**
    
    A: `chmod +x ./semester`
    
    **Q:  How does your shell know that the file is supposed to be interpreted using sh**

    A: The shebang line allows the file to give instructions on how it should be exectued.

10. **Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory**

    A: `./semester | grep "last-modified:" > last-modified.txt`

11. Skip for macOS.
