## lib {#lib-fn-fx}

Contains a set of library functions under `fn / fx` namespaces. Functions can be accessed through `fn...` and their usage through `fx...`

### Math

Math related functions.

#### math sum

Calculates sum of given integers. Available as `fn math sum` snippet.

Example usage:

```bash
#!/usr/bin/env bash

function sum () {
  local result=0
  for item in $@; do
    ((result += item))
  done
  echo $result
}

var1=2; var2=5; var3=4
result=`sum $var1 $var2 $var3`
echo $result
```

#### math product

Calculates product of given integers. Available as `fn math product` snippet.

Example usage:

```bash
#!/usr/bin/env bash

function product () {
  local result=1
  for item in $@; do
    ((result *= item))
  done
  echo $result
}

var1=2; var2=3; var3=5
result=`product $var1 $var2 $var3`
echo $result
```

#### math average

Calculates average of given integers. Available as `fn math average` snippet.

Example usage:

```bash
#!/usr/bin/env bash

function average () {
  local result=0
  for item in $@; do
    ((result += item))
  done
  echo $((result / $#))
}

var1=2; var2=3; var3=4
result=`average $var1 $var2 $var3`
echo $result
```

### Animation

There are three related snippets in `animation` namespace:

- `animation frame`: Use to define a frame of your animation.
- `fn animation animate`: A function used to animate frames.
- `fx animation animate`: Calling `animate` function.

See [animation](#animation-snippets) for more information.

### Misc

Other useful functions.

#### banner simple

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

#### banner color

A function to print colorful banners. To define the function use `fn banner color` at the top of script so later it can be called via `fx banner color`:

```bash
#!/usr/bin/env bash

function banner_color() {
  # function body...
}

# call function
banner_color yellow "sample banner"
```

![color banner](images/banner-color.png)

#### import

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

#### options

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

![choice](images/choice3.png)

#### progress

A dummy progress bar. You can use it as real progress bar with a little change.

```bash
#!/usr/bin/env bash

function progressBar() {
  # function body...
}

progressBar .2 "Installing foo..."
```

![progress](images/progress.png)

#### scan

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

### version compare | semver compare

There are different versioning standards out there but they are converging to a specific one called [semver](https://semver.org) over the last years. If you need to compare two different version strings which comply with `semver` semantic standard, then there is a ready to use function for it as `fn version compare` | `fn semver compare`. Insert the function into your function [region](#region):

```bash
#!/usr/bin/env bash

# Usage: version_compare "1.2.3" "1.1.7"

function version_compare () {
  # function body omitted...
}
```

Later call the function according to usage or use `fx version compare` | `fx semver compare` snippet:

```bash
version_compare "major.minor.patch" "major.minor.patch"
```

`version_compare` function returns `>`, `<` or `=` as result. Here are some real example usage and the outputs:

```bash
version_compare "1.2.3" "1.1.7" # >
version_compare "1.1.1" "2.1.0" # <
version_compare "5.0.2" "5.0.2" # =
```

If the two version strings are not standard `semver`, `version_compare` function will compare each part (separated by `.`) until the shorter one reaches its end. If until that point both versions look like same it returns `=` as result:

```bash
version_compare "3.2.2.7" "3.2.2" # =
```
