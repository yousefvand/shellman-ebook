## logic

You can find logical related commands here under `if` namespace.

### if

`if`, `else` condition.

For arithmetic comparison use `(( ))`.

```bash
#!/usr/bin/env bash

var1=32
var2=33

if (( $var1 == $var2 )); then
   echo "equal"
elif (( $var1 >= $var2 )); then
   echo "bigger"
else
   echo "smaller"
fi
# smaller
```

For string comparison use `[ ]`.

```bash
#!/usr/bin/env bash

str1="bye"
str2="hello"
str3="bye"

if [ "$str1" = "$str2" ]; then
    echo "1"
elif [ "$str1" = "$str3" ]; then
    echo "2"
else
    echo "3"
fi
# 2
```

### iff

If condition is true then run command (short circuit).

For arithmetic comparison use `(( ))`.

```bash
#!/usr/bin/env bash

var=5
(( var > 3 )) && echo "greater than 3"
# greater than 3
```

For string comparison use `[ ]`.

```bash
#!/usr/bin/env bash

var="hi"
[ "$var" = "hi" ] && echo "hi"
# hi
```

### iff not

If condition is false then run command (short circuit).

For arithmetic comparison use `(( ))`.

```bash
#!/usr/bin/env bash

var=5
(( var > 8 )) || echo "less than 8"
# less than 8
```

For string comparison use `[ ]`.

```bash
#!/usr/bin/env bash

var="hi"
[ "$var" = "bye" ] || echo "hi"
# hi
```

### if directory exists

Check if given *path* is a *directory*.

```bash
#!/usr/bin/env bash

if [ -d ~/backup ]; then
  echo "backup exists"
fi
```

### if cmd exists

Read [cmd](#cmd-exist)

### if exists

If *path* is a *file* or *directory*

```bash
#!/usr/bin/env bash

path=~/.bashrc
if [ -e "$path" ]; then
  echo exists
fi
```

### if file =

Check if two files are equal.

```bash
#!/usr/bin/env bash

file1=~/some_file
file2=~/another_file

if [ "$file1" -ef "$file2" ]; then
  echo files are equal
fi
```

### if file executable

Check if file is executable.

```bash
#!/usr/bin/env bash

if [ -x /bin/ls ]; then
  echo file is executable
fi
```

### if file link

If given *path* is a *symbolic link*.

```bash
#!/usr/bin/env bash

if [ -h /vmlinuz ]; then
  echo symbolic link
fi
```

### if file newer

Check if first file is newer than the second.

```bash
#!/usr/bin/env bash

file1=~/.bashrc
file2=~/.profile

if [ "$file1" -nt "$file2" ]; then
  echo file1 is newer than file2
fi
```

### if file not empty

Check if file is not empty.

```bash
#!/usr/bin/env bash

if [ -s ~/.profile ]; then
  echo file not empty
fi
```

### if file older

Check if first file is older than the second.

```bash
#!/usr/bin/env bash

file1=~/.bashrc
file2=~/.profile

if [ "$file1" -ot "$file2" ]; then
  echo file1 is older than file2
fi
```

### if file readable

Check if file is readable.

```bash
#!/usr/bin/env bash

if [ -r ~/.profile ]; then
  echo file is readable
fi
```

### if file writable

Check if file is writable.

```bash
#!/usr/bin/env bash

if [ -w ~/.profile ]; then
  echo file is writable
fi
```

### if int =

Check if two integers are equal.

```bash
#!/usr/bin/env bash

int1=67
int2=67

if (( int1 == int2 )); then
  echo equal
fi
```

### if int !=

Check if two integers are not equal.

```bash
#!/usr/bin/env bash

int1=12
int2=13

if (( int1 != int2 )); then
  echo not equal
fi
```

### if int <

Check if the first integer is smaller than the second.

```bash
#!/usr/bin/env bash

int1=12
int2=13

if (( int1 < int2 )); then
  echo lesser
fi
```

### if int <=

Check if the first integer is smaller or equal to the second one.

```bash
#!/usr/bin/env bash

int1=12
int2=13

if (( int1 <= int2 )); then
  echo less or equal
fi
```

### if int >

Check if the first integer is greater than the second.

```bash
#!/usr/bin/env bash

int1=15
int2=13

if (( int1 > int2 )); then
  echo greater
fi
```

### if int >=

Check if the first integer is greater or equal to the second one.

```bash
#!/usr/bin/env bash

int1=12
int2=13

if (( int1 >= int2 )); then
  echo greater or equal
fi
```

### if string empty

Check if string is empty.

```bash
#!/usr/bin/env bash

str=""
if [ -z "$str" ]; then
  echo "Empty string"
fi
# Empty string
```

### if string not empty

Check if string is not empty.

```bash
#!/usr/bin/env bash

str="a"
if [ -n "$str" ]; then
  echo "String is not empty"
fi
# String is not empty
```

### string equal | if string =

Check if strings are equal.

```bash
#!/usr/bin/env bash

str1="hello"
str2="hello"
if [ "$str1" = "$str2" ]; then
  echo "equal"
fi
# equal
```

### string not equal | if string !=

Check if strings are not equal.

```bash
#!/usr/bin/env bash

str1="hi"
str2="hello"
if [ "$str1" != "$str2" ]; then
  echo "not equal"
fi
# not equal
```

### if string contains

Check if string contains given substring.

```bash
#!/usr/bin/env bash

str="hello world!"

if [[ "$str" = *world* ]]; then
  echo contains world
fi
# contains world
```
