## directory

Contains `String` related operations.

### create

Creates a directory.

```bash
mkdir "test dir"
```

Creates `test` directory at the current path.

### create nested

Create directories as required.

```bash
#!/usr/bin/env bash

mkdir -p "parent dir"/"child dir"
```

X> ## Nested Directories
X>
X> Write a shell script to create a test directory containing 26 directories named from `a` to `z` each containing 100 directories from `1` to `100` with a single command.

Directory structure should look like:

```bash
── test
│   ├── a
│   │   ├── 1
│   │   ├── 2
│   .   .   .
│   .   .   .
│   │   └── 100
│   ├── b
│   │   ├── 1
│   │   ├── 2
│   .   .   .
│   .   .   .
│   │   └── 100
│   ├── c
│   .   .
│   .   .
```

For the answer refer to [Solutions](#solutions) section, [nested directories](#nested_directories).

### find

Find files or directories based on *criteria* in the given path up to N level depth.

```bash
#!/usr/bin/env bash

result=`find . -maxdepth 3 -type f -name "*.txt"`
echo "$result"
```

Above example finds all files (`-type f`) up to `3` level depth (`-maxdepth 3`) in the current directory (`.`).
