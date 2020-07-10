## event {#event-snippets}

Contains `event` related operations available via **event** namespace. There are two events supported by `Shellman`. `EXIT` and `CTRL+C`. Be careful about registering events multiple times. The last one you register takes control of what happens when event happens. If you have multiple things to do, move them all to a single function and register that function once.

### event EXIT

If you need to run some commands before your script exits, you can put them in a function and call them everywhere your script may exits. But there is an easier way to do that. Register an `EXIT` handler function and it would be executed when your script execution is finished:

```bash
# Exit event handler
function on_exit() {
  tput cnorm # Show cursor. You need this if animation is used.
  # i.e. clean-up code here
  exit 0 # Exit gracefully.
}

# Put this line at the beginning of your script (after functions used by event handlers).
# Register exit event handler.
trap on_exit EXIT
```

The `trap on_exit EXIT` part registers `on_exit` function to `EXIT` event. You need to register events as soon as possible in your script. But since it needs `on_exit` function, you need to define that function before registering the event.

The `tput cnorm` part ensures we have a visible cursor when script exits. If you are using [animation](#animation-snippets) feature of `Shellman` don't remove it. Anyway it is harmless and you can leave it there even if no animation is used.

### event CTRL+C | event terminated

Available as `CTRL+C` | `terminated` under `event` namespace. If you need to do something in case your script gets interrupted (like when user presses <kbd>Ctrl</kbd> and <kbd>C</kbd> keys on keyboard) you can register a handler function for it:

```bash
# CTRL+C event handler
function on_ctrl_c() {
  echo # Set cursor to the next line of '^C'
  tput cnorm # show cursor. You need this if animation is used.
  # i.e. clean-up code here
  exit 1 # Don't remove. Use a number (1-255) for error code.
}

# Put this line at the beginning of your script (after functions used by event handlers).
# Register CTRL+C event handler
trap on_ctrl_c SIGINT
```

The `trap on_ctrl_c SIGINT` part registers `on_ctrl_c` function to `SIGINT` event. You need to register events as soon as possible in your script. But since it needs `on_ctrl_c` function, you need to define that function before registering the event.

The `tput cnorm` part ensures we have a visible cursor when script exits. If you are using [animation](#animation-snippets) feature of `Shellman` don't remove it. Anyway it is harmless and you can leave it there even if no animation is used.
