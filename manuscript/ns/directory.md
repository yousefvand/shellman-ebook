## directory

Contains `directory` related operations. For logical operations about `directory` like if a given directory exists see [logic](#logic) section.

### directory create

Creates a directory.

```bash
mkdir "test dir"
```

Creates `test` directory at the current path.

### directory create nested

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

### directory delete nested | directory remove nested

Delete directory and all contents. **Use with caution**.

```bash
#!/usr/bin/env bash

rm -rf /home/remisa/backups
```

In above example `backups` directory and all contents (files and directories) will be deleted from */home/remisa* path (home directory for user `remisa`).

### directory find | file find

Find files or directories based on *criteria* in the given path up to N level depth.

```bash
#!/usr/bin/env bash

result=`find . -maxdepth 3 -type d -name "backup*"`
echo "$result"
```

Above example finds all directories (`-type d`) up to `3` level depth (`-maxdepth 3`) in the current directory (`.`) where their names start with `backup` (`-name "backup*"`).  To search for files use `-type f`.
