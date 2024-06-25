## date

Contains `Date` related operations.

### date now short

Short version of current system *date*.

```bash
#!/usr/bin/env bash

dateShort=$(date -I)
echo "$dateShort" # 2024-06-25
```

### date now UTC

Returns current system time in *Coordinated Universal Time* format.

```bash
#!/usr/bin/env bash

dateUTC=$(date -u)
echo "$dateUTC" # Tue Jun 25 11:32:55 AM UTC 2024
```

### date now year

Current year.

```bash
#!/usr/bin/env bash

year=$(date +%Y)
echo "$year" # 2024
```

### date now monthNumber

Current month number.

```bash
#!/usr/bin/env bash

monthNumber=$(date +%m)
echo "${monthNumber}" # 6
```

### date now monthName

Current month name.

```bash
#!/usr/bin/env bash

monthName=$(date +%B)
echo "${monthName}" # June
# %B for full month name, %b for abbreviated month name
```

### date now dayOfMonth

Current day of month.

```bash
#!/usr/bin/env bash

dayOfMonth=$(date +%d)
echo "$dayOfMonth" # 25
```

### date now dayOfWeek

Current weekday name.

```bash
#!/usr/bin/env bash

dayOfWeek=$(date +%A) # %A for full weekday name, %a for abbreviated weekday name
echo "$dayOfWeek" # Sunday
```

### date now dayOfYear

Current day of year (1-366).

```bash
#!/usr/bin/env bash

dayOfYear=$(date +%j)
echo "$dayOfYear" # 177
```
