## time

Contains `Time` related operations.

### time seconds epoch

Seconds from 01-01-1970 00:00.

```bash
#!/usr/bin/env bash

timeNowSecondsEpoch=$(date +%s)
echo "${timeNowSecondsEpoch}"
#1719942046 
```

### time now local

Current local time.

```bash
#!/usr/bin/env bash

timeNowLocal=`date +%R` # %R for 24 hrs
echo "$timeNowLocal" # 13:23

timeNowLocal=`date +%r` # %r for 12 hrs
echo "$timeNowLocal" # 01:23:45
```

### time now UTC

Current UTC time.

```bash
#!/usr/bin/env bash

timeNowUTC=$(date -u +%R)
echo "${timeNowUTC}"
# 17:45
```
