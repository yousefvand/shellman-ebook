## date

Contains `Date` related operations.

### now short

Short version of current system *date*.

```bash
#!/usr/bin/env bash

dateShort=`date -I`
echo "$dateShort" # 2019-01-06
```

### now UTC

Returns current system time in *Coordinated Universal Time* format.

```bash
#!/usr/bin/env bash

dateUTC=`date -u`
echo "$dateUTC" # Sunday, January 06, 2019
```

### now year

Current year.

```bash
#!/usr/bin/env bash

year=`date +%Y`
echo "$year" # 2019
```

### now monthNumber

Current month number.

```bash
#!/usr/bin/env bash

monthNumber=`date +%m`
echo "$monthNumber" # 01
```

### now monthName

Current month name.

```bash
#!/usr/bin/env bash

monthName=`date +%B` # %B for full month name, %b for abbreviated month name
echo "$monthName" # January
```

### now dayOfMonth

Current day of month.

```bash
#!/usr/bin/env bash

dayOfMonth=`date +%d`
echo "$dayOfMonth" # 06
```

### now dayOfWeek

Current weekday name.

```bash
#!/usr/bin/env bash

dayOfWeek=`date +%A` # %A for full weekday name, %a for abbreviated weekday name
echo "$dayOfWeek" # Sunday
```

### now dayOfYear

Current day of year (1-366).

```bash
#!/usr/bin/env bash

dayOfYear=`date +%j`
echo "$dayOfYear" # 006
```
