## process

Contains `Process` related information and operations.

### process ID(s)

Get process ID(s) by its name. Many Linux commands need *process ids* (PIDs).

```bash
#!/usr/bin/env bash

readarray -t arr < <(pgrep code)
echo "${arr[@]}"
# 2005 2010 2011 2015 2098 2110 2168 2250 2251 2276 2316 3002 3708 3759 3771 3903 4412 5847 5863 6872 6901
```

### process Kill

Kill a process by its name. `kill` command needs a *PID* (process ID) which we can find by `pgrep` command via [command substitution](#command-substitution).

```bash
#!/usr/bin/env bash

sudo kill -9 `pgrep firefox`
```

In above example we find *firefox* `PID` and pass it to `kill` command. Here `-9` is a switch of `kill` command (kill signal). You can see a list of all signals by typing `kill -l` in terminal.
The easier solution is `killall firefox` or `pkill firefox`.


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

### process name by id

find process name by its id. If process has many ids each one do the job. Since the process may have only one id we use zero member of array. Open firefox.

```bash
#!/usr/bin/env bash

# let's get id of firefox
readarray -t arr < <(pgrep firefox)
id="${arr[0]}"

# now let's get name of above id
processName=$(ps -p "${id}" -o comm=)
echo "$processName"
```



