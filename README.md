# Test-Code
Test someone's code if they expect input to their stdin (C programming language)

## Usage:
1. Make the students' program

```bash
make
```

2. Run the `bash` file

```bash
./run_test.sh ./<name_of_executable>
```

###### Note this assumes that you are on Linux; for Windows, you may need to add `bash ` before `run_test.sh`

Ensure that the file: `test.x86` exists or rename it in the `bash` file on line `8`.


## Common Errors:

```bash
./run_test.sh: line 38: <name_of_executable>: command not found
```

This happens when you run `./run_test.sh <name_of_executable>` without the `./` before the name of the exe. For bash files in Linux, the `./` is required.
