{mainmatter}

# Shell Scripting Basics {#basics}

## Comments

In shell scripts, comments start with  `#`. The exception is [shebang](#shebang) which you see as the first line of scripts.

```bash
# This is a comment
```

## shebang {#shebang}

This is the first line of any bash script. You may see different versions of it:

- `#!/usr/bin/sh`
- `#!/usr/bin/bash`
- `#!/usr/bin/env bash`
- ...

This line tells the *operating system* which script engine should be used to run the script. Usually you don't need to change the default value **Shellman** provides:

```bash
#!/usr/bin/env bash
```

This is available via `shebang` | `bash` snippet.

If a shell script doesn't contain `shebang` then whoever gonna execute such an script needs to specify the script engine manually and pass the script as an argument to it:

```bash
bash test.sh
```

## Run a Bash Script

Bash script files by convention has **.sh** *file extension*[^file-extension]. To run a bash script (`test.sh` for example) from terminal you have two options:

- Run it with bash command (pass file path to bash):
  1. `bash test.sh`

- Give it execute permission and run it directly (prefix file name with a `./` without space):
  1. `chmod +x test.sh`
  2. `./test.sh`

## Run a Command from Shell Script

To run a command from your script just write it in your script as you do in terminal:

```bash
#!/usr/bin/env bash

rm some-file
```

If the command needs **root**[^administrator] privileges (in *Windows* it is known as *Admin*), prefix the command with **sudo**:

```bash
#!/usr/bin/env bash

sudo rm some-file
```

If you need the result of the executed command refer to [command substitution](#command-substitution).

## Multiline Command

A single command can be written in multiple lines if each line ends in a `backslash`.

```bash
#!/usr/bin/env bash

curl --request GET -sL \
  --user-agent 'Shellman' \
  --cookie 'key=value' \
  --url 'http://example.com'
```

Above script is the same as:

```bash
#!/usr/bin/env bash

curl --request GET -sL --user-agent 'Shellman' --cookie 'key=value' --url 'http://example.com'
```

You can write multiple commands in a single line and separate them by semicolon (`;`).

```bash
#!/usr/bin/env bash

var1=2; var2=3; var3="hello"
```

## Variables

There is a simple difference between when you define a variable and when use its value. In latter case you need to prefix a `$` to the variable name (also you can write `${variable}`).

Define a variable named `firstName` and set its value to `Remisa`:

```bash
firstName=Remisa
```

T> ### Variable Assignment Rule
T>
T> Spaces are not allowed over equal sign `=` in variable assignment.

Now if we want to read our variable value and print in on screen with `echo` command we can write:

```bash
firstName=Remisa
echo $firstName
# or
echo ${firstName}
```

T> ### Variable Access Rule
T>
T> To access a variable value prefix it with `$`

Variables are case sensitive (like Linux filesystem):

```bash
#!/usr/bin/env bash

var=1
Var=2

echo "$var" # 1
echo "$Var" # 2
```

As you may guessed in assignment rule, *space* has a special meaning in *shell scripting*. With *space* over `=` shell assumes variable is a command and `=` and variable value are parameters to that command.

```bash
firstName = Remisa
# firstName: command not found
```

We should take care of where a *space* may appear. For example our variable value may contains *space*:

```bash
fullName=Remisa Yousefvand
```

Now when we want to use `fullName` value we put a `$` before it and use `$fullName` instead. But it contains *space* and we need to take care of that. To do so, simply surround wherever whitespace may appear in `""`:

```bash
fullName="Remisa Yousefvand"
echo "$fullName"
```

Consider you want to delete a file named `some file.txt` and you have save its name in a variable like:

```bash
fileName="some file.txt"
rm $fileName
```

With above script instead of deleting `some file.txt` you are telling `rm` to delete two files named `some` and `file.txt` and you will get an error (No such file or directory).

T> ### Handling whitespace in variables
T>
T> Always surround variables in `""` when accessing their values if they may contain white space(s).

To concat multiple variables put them in `""` in desired order:

```bash
a="Hello"
b="world"
c="!"
echo "$a $b$c"
# Hello world!
```

The whitespace between `$a` and `$b` is the whitespace between `Hello` and `world` in the output.

If you need adding more characters between variables then use `"${variable}"` syntax (this syntax is recommended by many sources as the default syntax):

```bash
a="abc"
b="def"
c="ghi"
echo "${a}a ${b}b ${c}c"
# abca defb ghic
```

If we want to assign a variable if and only if it has no value currently, then we can use [default value](#default-value) snippet:

```bash
#!/usr/bin/env bash

: "${variable:=default}"
```

In above example `variable` is set only if it is *empty*. We will use this snippet later after [argument parsing](#argument-parsing) to assign default values to variables when they are not passed (optional parameters) to script.

## Variable Types

Bash supports **`String`**, **`Integer`** and **`Array`**. Most of the time you only need **`String`**. Even when working with numbers they are strings you pass to commands which take care of converting those strings to numbers, do calculations, and return `String` back to you. Although you can define variables using `declare` keyword, in this book we define variables literally.

```bash
# Number or Sting:
var1=1234
var2=12.56
var3="some text" # use double quote when there is a space in string

# Array:
myArray=("one" "two" "three")
# or
myArray2=(
  "four"
  "five"
  "six"
)

echo "$var1"          # 1234
echo "$var2"          # 12.56
echo "$var3"          # some text
echo "${myArray[@]}"  # one two three
echo "${myArray2[@]}" # four five six
```

## Function

Function in shell script is not what you expect from a function in other languages. They are like commands defined in your script just like `echo` and `ls`. To define a function named `myfunc` simply (there is a `func` snippet for that):

```bash
#!/usr/bin/env bash
function myfunc () {
  echo "$1"
}
```

Function definition should precedes its usage. `function` keyword is optional and can be omitted:

```bash
#!/usr/bin/env bash
myfunc () {
  echo "$1"
}
```

To access function arguments we use `$1`, `$2`, `$3`... or access all of them at once through an array:

```bash
#!/usr/bin/env bash
function myfunc () {
  arguments=("$@")
  # arguments is the array variable containing all function parameters
}
```

If you need to return some value from a function use `echo`. There is a `return` keyword in bash but you cannot use it for returning values from functions most of the time (unless your function return an integer between 0 and 255) also it has its own meaning (0 for success and 1-255 for error codes). If you want to terminate a function execution at some point use `return` (for example inside an `if` statement).

```bash
#!/usr/bin/env bash
function myfunc () {
  echo "this is the result"
  # we don't need "return" here because function already reaches its end
}
```

On the caller side we capture this result with [command substitution](#command-substitution).

```bash
function myfunc () {
  echo "this is the result"
}

result=`myfunc`
echo "$result"
```

For more function related operations see [function](#function-snippets) snippets.

## Commands

### Command substitution {#command-substitution}

It is common practice to store the output of commands inside variables for further processing in script. The process is known as *command substitution* and can be done in two syntaxes:

1. `` output=`command` ``
2. `output=$(command)`

In most references method two is recommended because it is the only one that works with nested command substitutions. For the sake of brevity and consistency, we will use method one (backtick) in this book unless we need nested command substitutions (Also to be able to read and understand shell scripts written by others).

To store results of `ls` command in a variable named `output`:

```bash
output=`ls` # store ls results in a variable named output
# same as: output=$(ls)

echo "$output" # print output value (ls result)
```

There is a more advance technique for using a command output as another command input, namely **piping (|)**, which is beyond the scope of this book (if you have `functional programming` background you are already familiar with the idea).

### Command success/failure check

It happens when you are interested to know if a previous command succeeded or failed. In Linux every program returns a number to *operating system* on exit[^exit-code]. If the return value is *zero*, in means no error happened and other values indicates command **failure** (1-255).

T> ### Command success/failure
T>
T> Programs return `0` in case of **success** and non zero if **failure** occurs.

To check that, you can read *last command return value* via `$?`. There is a snippet at `func` [namespace](#namespaces) for retrieving last command return value as `func ret val`:

```bash
echo "$?"
```

 **Shellman** supports checking **failure** of last command via [cmd namespace](#cmd-snippets) as `cmd failure check` snippet:

```bash
# following command will fail due to lack of permission
touch /not-enough-permission-to-create-file
```

`touch` command creates an empty file.

We are trying to create the empty file `not-enough-permission-to-create-file` at the root of your file system (`/`). Without **sudo** normally (unless user is `root`) this command will fail due to lack of enough permissions.

```bash
touch /not-enough-permission-to-create-file

# check last command (touch) success/failure
if [[ $? != 0 ]]; then
  echo "command failed"
fi
```

To check **success**, use `cmd success check` snippet from [cmd namespace](#cmd-snippets):

```bash
echo "Hello World!"

# check last command (echo) success/failure
if [[ $? == 0 ]]; then
  echo command succeed
fi
```

Check *command exit code* **immediately** after that command or you may get wrong result:

```bash
#!/usr/bin/env bash

touch /not-enough-permission-to-create-file

echo "checking operation..."

# check last command (echo) success/failure
if [[ $? != 0 ]]; then
  echo "command failed"
fi
```

In above example your `if` statement won't print the `command failed` message since last command is `echo` and not `touch`.

## Exit

It is a good practice to inform script caller (in case other scripts use yours) about success or failure of your script. To indicate success:

```bash
exit 0
```

And if an error happens use an exit code. Document exit codes at the top of of your script:

```bash
exit 5 # documented as "no internet connection"
```

## Argument parsing {#argument-parsing}

By convention most Linux commands/programs supports a long and short version for the same flag/switch. Short version is usually the first letter of the long version (unless it is taken, like adding `version` to following list). Some examples:

{width="narrow"}
| short |    long   |
|-------|-----------|
|  -v   | --verbose |
|  -s   | --silent  |
|  -f   | --force   |
|  -o   | --output  |

You may want to support different *switches/flags* by your script and act differently based on them. Suppose your script name is `backup.sh`. With supporting flags someone can run it as:

```bash
./backup.sh -v
```

So your script works different with `-v`. For example you print verbose information. We need to know if user has run our script with or without `-v` flag. **Shellman** makes it easy for you, keep reading.

If your script supports *switches*, it means user is passing some information to your script via that switch. For example where to save the backup in our example:

```bash
./backup.sh -o ~/my_backups
```

In above code we are telling the script to save the output in `~/my_backups`[^home-directory] directory. Here `-o` is a *switch* which takes one parameter (a path).

T> ### Flag vs Switch
T>
T> **Flag** is used for boolean values and its presence means **True** while **Switch** accepts argument(s).

**Shellman** has a `parse args` snippet. It looks like this:

```bash
POSITIONAL=()
while [[ $# > 0 ]]; do # while arguments count > 0
  case "$1" in
    -f|--flag)
    echo flag: $1
    shift # shift once since flags have no values
    ;;
    -s|--switch)
    echo switch $1 with value: $2
    shift 2 # shift twice to bypass switch and its value
    ;;
    *) # unknown flag/switch
    POSITIONAL+=("$1")
    shift
    ;;
  esac # end of case. "case" word in reverse!
done

set -- "${POSITIONAL[@]}" # restore positional params
```

The *while loop* keeps looping until there is no more arguments to process. Although the passed arguments to your script would not disappear themselves, we trim them from left using `shift` command. So if your script is executed like:

```bash
./greet.sh -m --name Remisa
```

Input arguments are `-m --name Remisa`. After a `shift` they become `--name Remisa` and so on. So if you need to process a switch with two arguments `shift 3`.

This snippet will take care of **Flags** and **Switches** of your script. For implementing your own flag(s) replace `-f|--flag` with desired flag, i.e. `-v|--verbose` and on the next lines (before `shift`) do whatever you need. It is recommended to define a variable and set it here to keep track of the flag or store the value of switch parameter(s):

```bash
-v|--verbose)
verbose=true
```

Repeat above procedure for more flags.

To implement a **switch** like `-o`/`--output`:

```bash
-o|--output)
outputPath=$2
```

In above example we are saving the switch value in `outputPath` for using later. We refer to first switch parameter with `$2` and the second with `$3` and so on because the `$1` refers to the switch itself. Then `shift` properly.

Repeat above procedure for more switches.

X> ## Argument Parsing Exercise
X>
X> Write a shell script to greet. Script receives the name via `--name` or `-n` switch to print `good night name` and if `-m` flag is set, it should print `good morning name`. `name` is what value passed to script via `--name` flag. If `--name` or `-n` is not passed default value would be `everyone`. Example outputs:

```bash
./greet.sh
# good night everyone

./greet.sh -m
# good morning everyone

./greet.sh --name Remisa
# good night Remisa

./greet.sh -n Remisa
# good night Remisa

./greet.sh -m --name Remisa
# good morning Remisa

./greet.sh -m -n Remisa
# good morning Remisa
```

For the answer check [solutions](#argument_parsing) section.

As you have noticed, first argument can be accessed via `$1`, second argument via `$2`...

And yes, `$0` refers to script name itself at the time of execution.

Same is true inside the body of a function to access passed arguments to the function.

## Organizing your Bash Script

An organized script is easy to understand and maintain. Recommended structure of `script.sh` from top to bottom is:

1. shebang (`shebang` | `bash` snippet)
2. summary (`summary` snippet)
3. handler functions `region` (if any, see `event` namespace)
4. event handlers `region` (if any, see `event` namespace)
5. animation frames `region` (if any, see `animation` namespace)
6. functions `region`
7. command parsing
8. setting default variable values
9. rest of code (minimize it to function calls)

Usually you only need *1, 2, 6, 9* from above list. *command parsing* and *setting default variable values* can be done in reverse order. In that case create a `variables` [region](#region) after [summary](#summary) and set default values. Later if argument parsing overrides some of your variables (passed as flag/switch) the rest of variables contain default values.

In *summary* you provide some information about `script`.

```bash
#!/usr/bin/env bash

# Title:         test
# Description:   a test script
# Author:        Remisa <remisa.yousefvand@gmail.com>
# Date:          2019-01-06
# Version:       1.0.0

# Exit codes
# ==========
# 0   no error
# 1   script interrupted
# 2   error description
```

## Event handling

If you need to run a set of specific tasks before your script exits or in case user terminates your script (pressing <kbd>Ctrl</kbd> + <kbd>C</kbd>) you need to assign a `handler` function to appropriate event. The problem with event handlers is we use functions to run if a certain event happens so before assigning an event to a function we need to write the function. To capture events as soon as possible we need to assign event handlers early in our script. Thats why I have separated functions into two parts, event handlers, at the top of the script just before binding events to them and the rest of functions which are not needed so early. See [event](#event-snippets) namespace for more information.

Use [region](#region) snippet to define a `functions` region and put all of your functions there. Remember you need to define functions before you can use them. If function `B` calls function `A`, then function `A` definition should precede definition of function `B`.

```bash
#!/usr/bin/env bash

# summary here

# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

function greet() {
  # access the argument via $1
  echo "Hello $1"
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<

greet "Shellman" # call the function and pass an argument
```

## Double Quote vs Single Quote vs Backtick

Use *double quotation* where you have a variable that contains *whitespace*. Any variable inside a double quotation will be replaced by its value:

```bash
var1="Hello World!"
echo "$var1"   # Hello World!
# OR
echo "${var1}" # Hello World!
```

T> ### Double Quote
T>
T> By default use Double Quote `"` when defining variable or trying to access a variable value.

Use *single quotation* where you need to define a variable that contains special characters. Anything inside a single quotation will remain exact the same:

```bash
var1="Hello World!"
echo "$var1" # Hello World!

var2='$var1'
echo "$var2" # $var1

var3='"&$*'
echo "$var3" # "&$*
```

*backtick* is used for [command substitution](#command-substitution)

```bash
directoryList=`ls | xargs echo`
echo "$directoryList"
```

## Sample scripts

Apart from some examples in this book there is a [samples directory](https://github.com/yousefvand/shellman/tree/master/samples) in project repository which contains the steps and reasoning behind writing some shell scripts using `Shellman`.

[^file-extension]: In *Linux* unlike *Windows*, file extensions has no special meaning to *operating system* but still you can use them to remember which file type you are dealing with. **vscode** uses file extensions to recognize file types (`.sh` for *Shellscript*)

[^administrator]: In *Linux/Unix* systems, **root** is the most privileged user (same as *Administrator* in *Windows*).

[^exit-code]: This number is between 0 and 255 (one byte). If you have ever programmed in `C/C++`, you may noticed a `return 0` as a default behavior, that is the code your program is returning to *OS*, here `0` as success.

[^home-directory]: `~` is a shorthand for current user, *home directory*, which usually is `/home/username`. This path is also accessible via `$HOME` global variable.
