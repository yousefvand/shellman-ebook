{mainmatter}

# Shell Scripting Basics {#basics}

## Comments

In shell scripts anything after `#` in a line is considered a comment. The exception is [shebang](#shebang) which you see as the first line of scripts.

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

## Run a Bash Script

Bash script files by convention has **.sh** *file extension*[^fn1]. To run a bash script (`test.sh` for example) from terminal you have two options:

- Run it with bash command (pass file path to bash):
  1. `bash test.sh`

- Give it execute permission and run it directly (prefix file name with a `./` without space):
  1. `chmod +x test.sh`
  2. `./test.sh`

## Run a Command from Shell Script

To run a command from your script just write it as you do in terminal:

```bash
#!/usr/bin/env bash

rm some_file
```

If the command need **root**[^fn2] privileges (in *Windows* it is known as *Admin*), prefix the command with **sudo**:

```bash
#!/usr/bin/env bash

sudo rm some_file
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

You can write multiple commands in a single line and seperate them by semicolon (`;`).

```bash
#!/usr/bin/env bash

var1=2; var2=3; var3="hello"
```

## Variables

There is a simple difference between when you define a variable and when use its value. In latter case you need to prefix a `$` to the variable name.

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
```

T> ### Variable Access Rule
T>
T> To access a variable value prefix it with `$`

Here we face a serious problem which without well understanding it, *shell scripting* becomes *hell scripting*.

As you may guessed in assignment rule, *space* has a special meaning in *shell scripting* and we should take care of where a *space* may appear. For example our variable value may contains *space*:

```bash
fullName=Remisa Yousefvand
```

Now when we want to use `fullName` value we put a `$` before it and use `$fullName` instead. But it contains *space* and we need to take care of that. To do so, simply surround wherever whitespace may appear in `""`:

```bash
fullName="Remisa Yousefvand"
echo "$fullName"
```

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

If we want to assign a variable if and only if it has no value currently, then we can use `assign if empty` snippet:

```bash
#!/usr/bin/env bash

: "${variable:=default}"
```

In above example `variable` is set only if it is *empty*.

## Variable Types

The only **type** you have in shell is **`String`**. Even when working with numbers they are strings you pass to commands which take care of converting those strings to numbers, do calculations, and return `String` back to you.

## Commands

### Command substitution {#command-substitution}

It is common practice to store the output of commands inside variables for further processing in script. The process is known as *command substitution* and can be done in two syntaxes:

1. `` output=`command` ``
2. `output=$(command)`

In some references method two is recommended specially for nested command substitutions but for the sake of brevity and consistency, we will use method one (backtick) in this book.

To store results of `ls` command in a variable named `output`:

```bash
output=`ls` # store ls results in a variable named output

echo "$output" # print output value (ls result)
```

There is a more advance technique for using a command output as another command input, namely **piping (|)**, you can read about it in [advanced](#advanced) section.

### Command success/failure check

It happens when you are interested to know if a previous command succeeded or failed. In Linux every program returns a number to *operating system* on exit[^fn3]. By convention if the return value is *zero*, in means no error happened and other values indicates command **failure**.

T> ### Command success/failure
T>
T> Programs return `0` in case of **success** and non zero if **failure** happens.

To check that, you can check *last command return value* by reading `$?` value. There is a snippet at `func` [namespace](#namespaces) for retrieving last command return value as `func ret val`:

```bash
echo "$?"
```

 **Shellman** supports checking **failure** of last command via `cmd` [namespace](#namespaces) as `cmd failure check` snippet:

```bash
# following command will fail due to lack of permission
touch /not_enough_permission_to_create_file
```

`touch` command creates an empty file. Here we are trying to create the empty file `not_enough_permission_to_create_file` at the root of your file system. Without **sudo** this command will fail due to lack of enough permissions.

```bash
touch /not_enough_permission_to_create_file

# check last command (touch) success/failure
if [[ $? != 0 ]]; then
  echo "command failed"
fi
```

To check **success**, use `cmd success check` snippet from `cmd` namespace:

```bash
echo "Hello World!"

# check last command (echo) success/failure
if [[ $? == 0 ]]; then
  echo command succeed
fi
```

## Argument parsing

By convention most Linux commands/programs supports a long and short version for the same flag/switch. Short version is usually the first letter of the long version. Some examples:

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

In above code we are telling the script to save the output in `~/my_backups`[^fn4] directory.

T> ### Flag vs Switch
T>
T> **Flag** is used for boolean values and its presence means **True** while **Switch** accepts an argument.

**Shellman** has a `parse args` snippet. It looks like this:

```bash
POSITIONAL=()
while [[ $# > 0 ]]; do
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

This snippet will take care of **Flags** and **Switches** of your script. For implementing your own flag(s) replace `-f|--flag` with desired flag, i.e. `-v|--verbose` and on the next lines (before `shift`) do whatever you need. It is recommended to define a variable and set it here to keep track of the flag:

```bash
-v|--verbose)
verbose=true
```

Repeat above procedure for more flags.

To implement a **switch** like `-o`/`--output`:

```bash
-o|--output)
output_path=$2
```

In above example we are saving the switch value in `output_path` for using later.

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

For the answer refer to [Solutions](#solutions) section, [argument parsing](#argument_parsing).

As you have noticed, first argument can be accessed via `$1`, second argument via `$2`...

Same is true inside the body of a function to access passed arguments to the function.

## Organizing your Bash Script

Using **Shellman** snippets you can well organize your bash script, so it is easy to read by other users. Recommended structure of `script.sh` from top to bottom is:

1. shebang (`bash` snippet)
2. summary
3. functions region
4. command parsing

In *summary* you provide some information about `script`.

```bash
#!/usr/bin/env bash

# Title:         test
# Description:   a test script
# Author:        Remisa <remisa.yousefvand@gmail.com>
# Date:          2019-01-06
# Version:       1.0.0
```

Use `region` snippet to define a `functions` region and put all of your functions there. Remember you need to define functions before you can use them so it is a good idea to put them on the top of the script (after summary). If function `B` calls function `A`, then function `A` definition should precede definition of function `B`.

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
echo "$var1" # Hello World!
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

Use *backtick* for [command substitution](#command-substitution)

```bash
directoryList=`ls | xargs echo`
echo "$directoryList"
```

[^fn1]: In *Linux* unlike *Windows*, file extensions has no special meaning to *operating system* but still you can use them to remember which file type you are dealing with. **vscode** uses file extensions to recognize file types (`.sh` for *Shellscript*)

[^fn2]: In *Linux/Unix* systems, **root** is the most privileged user (same as *Administrator* in *Windows*).

[^fn3]: This number is between 0 and 255 (one byte). If you have ever programmed in `C/C++`, you may noticed a `return 0` as a default behavior, that is the code your program is returning to *OS*, here `0` as success.

[^fn4]: `~` is a shorthand for current user, *home directory*, which usually is `/home/username`.
