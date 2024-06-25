## file and directories

Contains `File` and `directory` related operations.

### directory create

Create an empty directory.

```bash
#!/usr/bin/env bash

mkdir "directory name"
```

### if file exists

Check if the file exists.

```bash
#!/usr/bin/env bash

if [ -f "/path/to/file" ]; then
    echo "File \"/path/to/file\" exists"
fi
```

### if file not empty

Check if file size is greater than zero.

```bash
#!/usr/bin/env bash

if [ -s "/path/to/file" ]; then
    echo "File \"/path/to/file\" is not empty"
fi
```

### if file =

Check if files are equal.

```bash
#!/usr/bin/env bash

if cmp -s "/path/to/file1" "/path/to/file2"; then
    echo "File \"/path/to/file1\" is equal to file \"/path/to/file2\""
fi
```

### if file readable

Check if file can be read.

```bash
#!/usr/bin/env bash

if [ -r "/path/to/file" ]; then
    echo "File \"/path/to/file\" is readable"
fi
```

### if file writeable

if file is writeable.

```bash
#!/usr/bin/env bash

if [ -w "/path/to/file" ]; then
    echo "File \"/path/to/file\" is writeable"
fi
```

### if directory exists

Check if a directory exists.

```bash
#!/usr/bin/env bash

if [ -d "/path/to/directory" ]; then
    echo "directory \"/path/to/directory\" exists"
fi
```

### iterate files

Iterate files in a directory for a certain file (files).

```bash
#!/usr/bin/env bash

# Searching in the current directory
for file in *.{jpg,png}; do
    echo "${file}"
done
```

In this example we are looking for pictures with `jpg` and `png` pictures.

### iterate directories

Iterate around visible directories inside another directory.

```bash
#!/usr/bin/env bash

# Make sure path ends with /
for directory in /*; do
    if [[ -d "${directory}" && ! -L "${directory}" ]]; then
        echo "${directory}"
    fi
done
```

### directory create nested

Create directories even they don't exist.

```bash
#!/usr/bin/env bash

mkdir -p a/b/c
```

### file delete | file remove

Delete given file.

```bash
#!/usr/bin/env bash

rm -f ~/test.txt
```

In above example `test.txt` will be deleted from *home*. Home is denoted by `~`.

### directory delete nested | directory remove nested

Delete a directory and all subdirectory and files (use with caution).

```bash
rm -rf /path/to/directory
```

### if path exists

If path exists (file, directory, link...)

```bash
#!/usr/bin/env bash

if [ -e "/path/to/something" ]; then
    echo "Path \"/path/to/something\" exists"
fi
```

### find file | find directory

Find files or directories based on criteria in given path.

```bash
#!/usr/bin/env bash

result=`find ~ -maxdepth 5 -type f -name "*.txt"`
echo "$result"
```

In above example all files (`-type f`) with `txt` extension in *home* (`~`) path up to `5` level of depth will be found. To search for directories use `-type d`.

### file search | search in files | find in files

Find files which contain the search criteria.

```bash
#!/usr/bin/env bash

result=`find ~ -maxdepth 1 -type f -exec grep "ls" {} +`
echo "$result"
```

In above example we will search all files in *home* (`~`) directory up to 1 depth level, and find the ones which contain text `ls`.

### file read

Read contents of a file line by line.

```bash
#!/usr/bin/env bash

cat ~/test.txt | while read line; do
  echo "$line"
done
```

In above example we read contents of `test.txt` which is in user *home* directory, and print it line by line.

### file write

Write to a file.

```bash
#!/usr/bin/env bash

lines=`docker images`
echo "sample header" > ~/test.txt
for line in ${lines}; do
  echo "$line" >> ~/test.txt
done
```

In above example we store result of `docker images` command in `lines` variable then send `sample header` text to `test.txt` file in *home* (`~`) directory. Inside `for` loop we send each line of lines to `test.txt`.

Operator `>` redirects output to a file and overwrite its content while operator `>>` will append to the end of the file (previous contents remain there).

### file write multiline

Write multiple lines into file.

```bash
#!/usr/bin/env bash

cat >~/test.txt <<EOL
Header

first line
second line
EOL
```

### file write multiline sudo

Write multiple lines into a file which needs root permission.

```bash
#!/usr/bin/env bash

cat << EOL | sudo tee /test.txt
Header

first line
second line
EOL
```

### if file executable

Check if file is executable.

```bash
#!/usr/bin/env bash

if [ -x "/path/to/file" ]; then
    echo "file \"/path/to/file\" is executable"
fi
```

### remove files older than

Remove files older than x days.

```bash
#!/usr/bin/env bash

find ~/backup -mtime +14 | xargs rm -f
```

Above example removes files from `~/backup` directory which are older than two weeks.

### if file link

If given path is a symbolic link.

```bash
#!/usr/bin/env bash

if [ -h "/path/to/file" ]; then
    echo "Path \"/path/to/file\" is a symbolic link"
fi
```

### if file newer

Check if file1 is newer than file2.

```bash
#!/usr/bin/env bash

if [ "/path/to/file1" -nt "/path/to/file2" ]; then
    echo "Path \"/path/to/file1\" is newer than path \"/path/to/file2\""
fi
```

### if file older

Check if file1 is older than file2.

```bash
#!/usr/bin/env bash

if [ "/path/to/file1" -ot "/path/to/file2" ]; then
    echo "Path \"/path/to/file1\" is older than path \"/path/to/file2\""
fi
```

### remove old/new files/directories

Find and remove files(f)/directories(d) older(+)/newer(-) than x days.

```bash
#!/usr/bin/env bash

find "/path/to/directory/" -type f -mtime +days -delete
```

