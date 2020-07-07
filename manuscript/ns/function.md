## function {#function-snippets}

Contains `function` related operations available through **func** namespace. A function can return a number between 0 to 255 which can be retrieved through `$?` (available as `func ret val` snippet).

### func

Define a function to be called later. Function definition must precede its usage.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo "$1"
  echo "$2"
}

myFunction "some argument" "another argument"
# some argument
# another argument
```

### args

Access to function arguments.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo "$@"
}

myFunction "some argument" "another argument"
# some argument another argument
```

### args count

Number of function arguments.

```bash
#!/usr/bin/env bash

function myFunction () {
  echo $#
}

myFunction "some argument" "another argument"
# 2
```

### ret val

Check the value last function call has returned (0-255). By convention, zero is returned if no error occurs, otherwise a non-zero value is returned.

```bash
#!/usr/bin/env bash

function test () {
  echo "$1"
  return 25
}

test "return value"
echo "$?"
# return value
# 25
```
