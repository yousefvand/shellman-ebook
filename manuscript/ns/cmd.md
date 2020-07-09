## cmd

Contains `command` execution related operations.

### cmd

To run a command and use the returned value is named [command substitution](#command-substitution).

```bash
#!/usr/bin/env bash

response=`curl -s http://example.com`
echo "$response"
```

In above example using `curl` we retrieve the content of `http://example.com` and store it in `response` variable (`-s` flag tells `curl` to work in silent mode).

### cmd success check

Check if last command has succeeded.

```bash
#!/usr/bin/env bash

ls # this command will succeed

if [[ $? == 0 ]]; then
  echo "command succeeded"
else
  echo "command failed"
fi
# command succeeded
```

### cmd failure check

Check if last command has failed.

```bash
#!/usr/bin/env bash

touch /file.txt # this command will fail without sudo

if [[ $? == 0 ]]; then
  echo "command succeeded"
else
  echo "command failed"
fi
# command failed
```

### cmd nice

Run a command with modified scheduling priority. Niceness  values range  from  `-20` (highest priority) to `19` (lowest priority) and default value is `0`.

```bash
#!/usr/bin/env bash

sudo nice -n 19 cp ~/file ~/tmp
```

In above example we are copying a file from *home* to *tmp* folder, and schedule minimum CPU time to `cp`.

### cmd renice

Change a running process priority. Niceness  values range  from  `-20` (highest priority) to `19` (lowest priority) and default value is `0`.

```bash
#!/usr/bin/env bash

for p in $(pidof "chrome"); do sudo renice -n -5 -p "$p"; done
```

In above example we are changing priority of `chrome` process and its child processes to higher than normal.

### if cmd exists {#cmd-exist}

Check if a desired command exists (program is installed).

```bash
#!/usr/bin/env bash

if [ `command -v docker` ]; then
  echo "docker is installed"
else
  echo "docker is NOT installed"
fi
```

In above example we are checking if `docker` program is available on the system.
