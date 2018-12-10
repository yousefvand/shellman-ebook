# Shell Scripting Basics

## Variables

There is a simple difference between when you define a variable and when use its value. In latter case you need to prefix a `$` to variable name.

T> ### Variable Rule
T>
T> To access a variable value prefix it with `$`

Define a variable named `firstName` and set its value to `Remisa`:

```bash
firstName=Remisa
```

Now if we want to read our variable value annd print in on screen with `echo` command we can write:

```bash
firstName=Remisa
echo $firstName
```

T> ### Assignment Rule
T>
T> Spaces are not allowed over equal sign `=` in variable assignment.

Here we face a serious problem which without well understanding it *shell scripting* becomes *hell scripting*.

As you see in assignment rule, *space* has a special meaning in *shell scripting* and we should take care of where a *space* may appear. For example or variable value may contains *space*:

```bash
fullName=Remisa Yousefvand
```

Now when we want to use `fullName` value we put a `$` before it and use `$fullName` instead. But it contains *space* and we need to take care of that. To do so, simply surround whereever whitespace may appear in `"`:

```bash
fullName="Remisa Yousefvand"
echo "$fullName"
```

T> ### Handling white space in variables
T>
T> Always surround variables in `"` when accessing their values if they may contain white space(s).

