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

### find

Find files or directories based on *criteria* in the given path up to N level depth.

```bash
#!/usr/bin/env bash

result=`find . -maxdepth 3 -type f -name "*.txt"`
echo "$result"
```

Above example finds all files (`-type f`) up to `3` level depth (`-maxdepth 3`) in the current directory (`.`).
