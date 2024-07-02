## system

Contains `System` related information and operations.

### system distro codename

Operating System codename (i.e. xenial).

```bash
#!/usr/bin/env bash

distroCodeName=$(lsb_release -c | awk '{print $2}')
echo "${distroCodeName}" # n/a
```

### system distro name

Operating System ID (i.e. Ubuntu).

```bash
#!/usr/bin/env bash

distroName=$(lsb_release -i | awk '{print $3}')
echo "${distroName}" # Arch     
```

### system distro version

Operating System release version (i.e. 16.04).

```bash
#!/usr/bin/env bash

distroVersion=$(lsb_release -r | awk '{print $2}')
echo "${distroVersion}" # rolling
```

### system kernel name

Operating System kernel name (i.e. Linux).

```bash
#!/usr/bin/env bash

kernelName=$(uname -s)
echo "${kernelName}" # Linux
```

### system kernel release

Operating System kernel release (i.e. 4.4.0-140-generic).

```bash
#!/usr/bin/env bash

kernelRelease=$(uname -r)
echo "${kernelRelease}" # 6.9.7-arch1-1
```

### system memory info

System memory information in kilobytes (KB). Available memory information:

- MemTotal
- MemFree
- MemAvailable
- Cached
- Buffers
- Active
- Inactive
- SwapTotal
- SwapFree
- SwapCached

```bash
#!/usr/bin/env bash

sysMemoryMemTotal=`cat /proc/meminfo | grep 'MemTotal' | awk '{print $2}' | head -n 1`
echo "$sysMemoryMemTotal" # total system memory in KB
```     

### system processor architecture

Processor architecture (i.e. x86_64).

```bash
#!/usr/bin/env bash

arch=$(lscpu | grep 'Architecture' |awk '{print $2}' | head -n 1)
echo "${arch}" # x86_64
```

### system processor count

Number of processors (cores).

```bash
#!/usr/bin/env bash

cores=$(lscpu | grep 'CPU(s)' |awk '{print $2}' | head -n 1)
echo "${cores}" # 4
```

### system processor model

Processor model name (i.e. Intel(R) Core(TM) i5-5200U CPU @ 2.20GHz).

```bash
#!/usr/bin/env bash

cpuModel=$(lscpu | grep 'Model name' |cut -d ' ' -f 3- | sed -e 's/^[[:space:]]*//')
echo "${cpuModel}" # Intel(R) Core(TM) i5-5200U CPU @ 2.20GHz
```

### system processor type

Operating System processor type (i.e. x86_64).

```bash
#!/usr/bin/env bash

cpuType=$(uname -p)
echo "${cpuType}" # unknown
```

### system service manage

Manage service (daemon) operations.

- enable
- disable
- start
- stop
- reload
- restart
- status

```bash
sudo systemctl status network-manager
```

### system uptime seconds

system uptime in seconds.

```bash
#!/usr/bin/env bash

# Use 'fn time format seconds' snippet for formatting
systemUptime=$(awk '{print $1}' /proc/uptime)
echo "${systemUptime}" # 4432.54
```

### system uptime

System uptime (hh:mm:ss).

```bash
#!/usr/bin/env bash

Uptime=$(uptime -p)
echo "${Uptime}" # up 18 minutes
```

