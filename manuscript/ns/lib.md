## lib

Contains a set ol library functions and calling them under `fn / fx` namespaces. Functions can be accessed through `fn...` and their usage through `fx...`

### banner simple

A function to print simple banners. To define the function use `fn banner simple` at the top of script so later it can be called via `fx banner simple`:

```bash
#!/usr/bin/env bash

function banner_simple() {
  # function body...
}

# call function
banner_simple "sample banner"
```

![simple banner](images/banner-simple.png)

### banner color

A function to print colorful banners. To define the function use `fn banner color` at the top of script so later it can be called via `fx banner color`:

```bash
#!/usr/bin/env bash

function banner_color() {
  # function body...
}

# call function
banner_color yellow "sample banner"
```

![simple banner](images/banner-color.png)

### import

Use functions defined in other bash script files inside your script. To define the function use `fn import` at the top of script so later it can be called via `fx import`. Default folder for library files is `lib` relative to calling script.

```bash
#!/usr/bin/env bash

function import() {
  # function body...
}

import "mylib"

# Call some function from mylib.sh
```

In above example with `import "mylib"` we are importing functions defined in `lib/mylib.sh`.

### options

A function to print multi choice questions. To define the function use `fn options` at the top of script so later it can be called via `fx options` with question and choices. Default choice is zero based so 0 means first option, 1 means second...

```bash
#!/usr/bin/env bash

function chooseOption() {
  # function body...
}

options=("one" "two" "three") # array of options
chooseOption "Choose:" 1 "${options[@]}"; choice=$? # call function
echo "${options[$choice]}" selected # print selected item by user
```

![options 1](images/choice1.png)

![options 2](images/choice2.png)

![options 3](images/choice3.png)

### progress

A dummy progress bar. You can use it as real progress bar with a little change.

```bash
#!/usr/bin/env bash

function progressBar() {
  # function body...
}

progressBar .2 "Installing foo..."
```

![progress](images/progress.png)

### scan

Scan a host port range (tcp/udp).

```bash
#!/usr/bin/env bash

function scan () {
  # function body...
}

# scan tcp ports 5000-10000 of localhost
scan tcp localhost 5000 10000

# tcp 8081 => open
# tcp 9000 => open
```
