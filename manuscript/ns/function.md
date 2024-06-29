## function {#function-snippets}

Contains `function` related operations. A function can return a number between 0 to 255 which can be retrieved through `$?` (available as `function return value` snippet).

### function | func

Define a function to be called later. Function definition must precede its usage.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo "$1"
  echo "$2"
}

# Usage:
myFunction "some argument" "another argument"
# some argument
# another argument
```

### function arguments | func args

Access to function arguments.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo "$@"
}

myFunction "some argument" "another argument"
# Usage:
# some argument another argument
```

### function arguments count | func args count

Number of function arguments.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo $#
}

# Usage:
myFunction "some argument" "another argument"
# 2
```

### function return | func ret val

Check the value of last function call has returned (0-255). By convention, zero is returned if no error occurs, otherwise a non-zero value is returned.

```bash
#!/usr/bin/env bash

function test () {
  echo "$1"
  return 25
}

test "return value"
echo "$?"
# return value
# 25 => an error occurred
```
