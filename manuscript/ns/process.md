## process

Contains `Process` related information and operations.

### process list

List all system processes.

```bash
#!/usr/bin/env bash

ps -A
#   PID TTY       TIME       CMD
#    1   ?        00:00:03 systemd
#    2   ?        00:00:00 kthreadd
#    3   ?        00:00:01 ksoftirqd/0
#    5   ?        00:00:00 kworker/0:0H
#    7   ?        00:01:46 rcu_sched
# ...
```

### process ID

Get process ID by its name. Many Linux commands need *process id* (PID).

```bash
#!/usr/bin/env bash

firefoxPID=`pgrep firefox`
echo $firefoxPID
```

### process Kill

Kill a process by its name. `kill` command needs a *PID* (process ID) which we can find by `pgrep` command via [command substitution](#command-substitution).

```bash
#!/usr/bin/env bash

sudo kill -9 `pgrep firefox`
```

In above example we find *firefox* `PID` and pass it to `kill` command. Here `-9` is a switch of `kill` command (kill signal). You can see a list of all signals by typing `kill -l` in terminal.
