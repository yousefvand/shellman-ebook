## array

Contains `Array` related operations.

### declare

Declare a literal array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")

for item in ${myArray[@]}; do
  echo "$item"
done

# Alice
# Bob
# Eve
```

### add | push

Add a new item to the array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
myArray+=("Shellman")

for item in ${myArray[@]}; do
  echo "$item"
done

# Alice
# Bob
# Eve
# Shellman
```

### all

All items of array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]} # Alice Bob Eve
```

### at index

Returns item Nth from array (N = index).

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve" "Shellman")
echo ${myArray[2]} # Eve
```

### concat

Returns an array made of concatenation of two given arrays.

```bash
#!/usr/bin/env bash

array1=("Alice" "Bob" "Eve")
array2=("1" "2" "3")
newArray=("${array1[@]}" "${array2[@]}")
echo ${newArray[@]} # Alice Bob Eve 1 2 3
```

### delete

Delete entire array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
unset myArray
echo ${myArray[@]}
#
```

### delete at

Delete Nth item in array (N = index)

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
unset myArray[1]
echo ${myArray[@]} # Alice Eve
```

### find

Find elements in array which match to regex.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]/e/} # Alice Eve
```

### iterate | for each

Iterate over array items.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")

for item in ${myArray[@]}; do
  echo "$item"
done

# Alice
# Bob
# Eve
```

### length

Returns length of array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${#myArray[@]} # 3
```

### range

Return items from *index* up to the *count*.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve" "Shellman" "Remisa")
echo ${myArray[@]:1:3} # Bob Eve Shellman
```

In above example we are interested in 3 items of array starting at index 1 (arrays are zero base indexed)

### replace

Find and replace items in array based on regex.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]//e/9} # Alic9 Bob Ev9
```

### set elements

Set element given value as Nth element.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
myArray[1]="Shellman"
echo ${myArray[@]} # Alice Shellman Eve
```

### slice

Returns a subarray starting at *index* and containing *count* items of the original array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve" "Shellman")
echo ${myArray[@]:1:2} # Bob Eve
```
