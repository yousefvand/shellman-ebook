## animation {#animation-snippets}

Why on earth one may need `ASCII` animation in a shell script (you can use unicode as well but it may not work the same on all systems). If you are a girl you understand that!

There are simple steps to make a beautiful animation with `Shellman`. You define `frames` and call `animate` function passing it the `frames` array and the interval between frames in seconds. Normally you need an animation at the end of your script, so `animate` function uses an infinite `while` loop of course with enough `sleep`s.

Your frames need to have the exact same width and height. If they are different in size, fill the unused space with `space`s (no `TAB`s).

Define animation frames at the top of your script. Here we make a simple spinner. We need frames `|`, `/`, `-`, `\`. Use `animation frame` snippet:

```bash
IFS='' read -r -d '' frames[1] <<"EOF"
|
EOF

IFS='' read -r -d '' frames[2] <<"EOF"
/
EOF

IFS='' read -r -d '' frames[3] <<"EOF"
-
EOF

IFS='' read -r -d '' frames[4] <<"EOF"
\
EOF
```

Now add `animate` function to your script using `fn animation animate` snippet and call it with frames array and desired delay between frames in seconds:

```bash
#!/usr/bin/env bash

IFS='' read -r -d '' frames[1] <<"EOF"
|
EOF

IFS='' read -r -d '' frames[2] <<"EOF"
/
EOF

IFS='' read -r -d '' frames[3] <<"EOF"
-
EOF

IFS='' read -r -d '' frames[4] <<"EOF"
\
EOF

function animate () {
  local frames=("$@")
  ((last_index=${#frames[@]} - 1))
  local interval=${frames[last_index]}
  unset frames[last_index]

  # Comment out next two lines if you are using CTRL+C event handler.
  trap 'tput cnorm; echo' EXIT
  trap 'exit 127' HUP INT TERM

  tput civis # hide cursor
  tput sc # save cursor position

  while true; do
    for frame in "${frames[@]}"; do
      tput rc # restore cursor position
      echo "$frame"
      sleep "$interval"
    done
  done
}

animate "${frames[@]}" 0.2
```

You can find base frames for  your animations by searching the web for `ascii art`. For more examples visit [project repository page](https://github.com/yousefvand/shellman/tree/master/samples/animation).

### pacman

Using frames is not the best way to make animations but it is simple and straightforward. I have made another ready to use animation function for you which gets an string and eats it up.

Use `fn animation pacman` snippet to insert the function into your script and use `fx animation pacman` to call it:

```bash
function pac_man () {
  # Function body here...
}

pac_man "Hello World"
```
