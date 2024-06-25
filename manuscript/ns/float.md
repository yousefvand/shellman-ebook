## Mathematical operations on integers and non-integers in bash is different. But don't worry Shellman handles both. In this section we do non-integer math operations. It is suffice to add `float` or `double` in your snippet.

### if float = | if double =

if two non-integers are equal:

```bash
#!/usr/bin/env bash

i=7.6
j=7.6

if (( $(echo "${i} == ${j}" | bc -l) )); then
    echo "equal"
fi # equal
```

### if float >= | if double >=

```bash
#!/usr/bin/env bash

i=7.8
j=5.6

if (( $(echo "${i} >= ${j}" | bc -l) )); then
    echo "greater or equal"
fi # greater or equal
```

### if float > | if double >

```bash
#!/usr/bin/env bash

i=7.8
j=5.6

if (( $(echo "${i} > ${j}" | bc -l) )); then
    echo "greater"
fi # greater
```

### if float <= | if double <=

```bash
#!/usr/bin/env bash

i=4.8
j=5.6

if (( $(echo "${i} <= ${j}" | bc -l) )); then
    echo "lesser or equal"
fi # lesser or equal
```

### if float < | if double <

```bash
#!/usr/bin/env bash

i=4.8
j=5.6

if (( $(echo "${i} < ${j}" | bc -l) )); then
    echo "lesser"
fi # lesser
```

### if float != | if double !=

```bash
#!/usr/bin/env bash

i=4.8
j=5.6

if (( $(echo "${i} != ${j}" | bc -l) )); then
    echo "not equal"
fi # not equal
```