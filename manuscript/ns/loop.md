## loop

Contains `while`, `until`, `for`.

### while

`while` condition.

For arithmetic comparison use `(( ))`.

```bash
#!/usr/bin/env bash

a=3
while (( a > 0 )); do
  echo "$a"
  ((a--))
done
# 3
# 2
# 1
```

For string comparison use `[ ]`.

```bash
#!/usr/bin/env bash

str="s"
while [ "$str" != "end" ]; do
  echo "start"
  str="end"
done
# start
```

### until

`until` condition (opposite of `while`).

For arithmetic comparison use `(( ))`.

```bash
#!/usr/bin/env bash

a=3
until (( a <= 0 )); do
  echo "$a"
  ((a--))
done
# 3
# 2
# 1
```

For string comparison use `[ ]`.

```bash
#!/usr/bin/env bash

str="s"
until [ "$str" == "end" ]; do
  echo "start"
  str="end"
done
# start
```

### for i

`for` loop.

```bash
#!/usr/bin/env bash

for((i=0;i<5;i++)); do
  echo "$i"
done
# 0
# 1
# 2
# 3
# 4
```

### for i j

Nested `for` loop.

```bash
#!/usr/bin/env bash

for((i=0;i<3;i++)); do
  for((j=0;j<2;j++)); do
    echo "$i, $j"
  done
done
# 0, 0
# 0, 1
# 1, 0
# 1, 1
# 2, 0
# 2, 1
```

### for in

Iterate over ranges. Range can be numerical or alphabetical and can be defined as `{start..end}`.

Numerical range:

```bash
#!/usr/bin/env bash

for item in {1..5}; do
  echo "$item"
done
# 1
# 2
# 3
# 4
# 5
```

alphabetical range:

```bash
#!/usr/bin/env bash

for item in {A..D}; do
  echo "$item"
done
# A
# B
# C
# D
```

### for in column

Sometimes output is arranged in multiple columns while we are interested in one or few of them. For example output of `docker images` command:

|    REPOSITORY    |     TAG    |     IMAGE ID      |       CREATED      |    SIZE    |
|:-----------------|:-----------|:-----------------:|:------------------:|:-----------|
| sonatype/nexus3  |   3.13.0   |   777b20c20405    |    3 months ago    |    505MB   |
| sonatype/nexus3  |   latest   |   777b20c20405    |    3 months ago    |    505MB   |
| busybox          |   glibc    |   c041448940c8    |    4 months ago    |    4.42MB  |
| busybox          |   latest   |   c041448940c8    |    4 months ago    |    4.42MB  |

What if we are just interested in column one?

```bash
#!/usr/bin/env bash

for col in `docker images | awk '{ print $1}'`; do
  echo "$col"
done
```

Output of above script is:

```bash
REPOSITORY
sonatype/nexus3
sonatype/nexus3
busybox
busybox
```

If you need column two you can *pipe (|)* output of `docker images` to `awk '{ print $2}'`:

```bash
#!/usr/bin/env bash

for col in `docker images | awk '{ print $2}'`; do
  echo "$col"
done
```

Output would be:

```bash
TAG
3.13.0
latest
glibc
latest
```
