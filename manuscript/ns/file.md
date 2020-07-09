## file

Contains `File` related operations. For logical operations about `file` like if a given file is writable see [logic](#logic) section.

### file delete | file remove

Delete given file.

```bash
#!/usr/bin/env bash

rm -f ~/test.txt
```

In above example `test.txt` will be deleted from *home*.

### file find

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

### remove files older than

Remove files older than x days.

```bash
#!/usr/bin/env bash

find ~/backup -mtime +14 | xargs rm -f
```

Above example removes files from `~/backup` directory which are older than two weeks.
