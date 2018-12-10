{mainmatter}

# Shell Scripting Basics

## Comments

In shell scripts anything after `#` is considered a comment. The exception is *shebang* which you see as the first line of scripts.

```bash
# This is a comment
```

## shebang

This is the first line of any bash script. You may see different versions of it:

- `#!/usr/bin/sh`
- `#!/usr/bin/bash`
- `#!/usr/bin/env bash`
- ...

This line tells the *operating system* which script engine should be used to run the script. Usually you don't need to change the default value **Shellman** provides:

`#!/usr/bin/env bash`

## Run a Bash Script

Bash script files by convention has **.sh** *extension*. To run a bash script (test.sh for example) you have two options:

- Run it with bash command:
  1. `bash test.sh`

- Give it execute permission and run it directly:
  1. `chmod +x test.sh`
  2. `./test.sh`

## Variables

There is a simple difference between when you define a variable and when use its value. In latter case you need to prefix a `$` to variable name.

T> ### Variable Access Rule
T>
T> To access a variable value prefix it with `$`

Define a variable named `firstName` and set its value to `Remisa`:

```bash
firstName=Remisa
```

Now if we want to read our variable value and print in on screen with `echo` command we can write:

```bash
firstName=Remisa
echo $firstName
```

T> ### Variable Assignment Rule
T>
T> Spaces are not allowed over equal sign `=` in variable assignment.

Here we face a serious problem which without well understanding it *shell scripting* becomes *hell scripting*.

As you see in assignment rule, *space* has a special meaning in *shell scripting* and we should take care of where a *space* may appear. For example or variable value may contains *space*:

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

## Command substitution

It is common practice to store the output of commands inside variables for further processing in script. The process is known as *command substitution* and can be done in two syntax:

1. `` output=`command` ``
2. `output=$(command)`

WE will use method one (using backtick) in the rest of this book.

To store results of `ls` command in a variable named `output`:

```bash
output=`ls` # store ls results in output variable

echo "$output" # print output
```

There is a more advance technique for using a command output as another command input, namely **piping**, you can read about in **advance** section.
