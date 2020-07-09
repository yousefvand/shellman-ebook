## array

Contains `Array` related operations.

### array declare

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

### array add | array push

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

### array all

All items of array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]} # Alice Bob Eve
```

### array at index

Returns item Nth from array (N = index).

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve" "Shellman")
echo ${myArray[2]} # Eve
```

### array concat

Returns an array made of concatenation of two given arrays.

```bash
#!/usr/bin/env bash

array1=("Alice" "Bob" "Eve")
array2=("1" "2" "3")
newArray=("${array1[@]}" "${array2[@]}")
echo ${newArray[@]} # Alice Bob Eve 1 2 3
```

### array delete

Delete entire array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
unset myArray
echo ${myArray[@]}
#
```

### array delete at

Delete Nth item in array (N = index)

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
unset myArray[1]
echo ${myArray[@]} # Alice Eve
```

### array filter

Filter elements of an array based on given pattern.

```bash
#!/usr/bin/env bash

myArray=('Alice' '22' 'Bob' '16' 'Eve')
filtered=(`for i in ${myArray[@]} ; do echo $i; done | grep [0-9]`)
echo ${filtered[@]} # 22 16
```

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]/e/} # Alice Eve
```

### array iterate | array forEach

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

### array length

Returns length of array.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${#myArray[@]} # 3
```

### array replace

Find and replace items in array based on regex.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
echo ${myArray[@]//e/9} # Alic9 Bob Ev9
```

### array slice | array range

Return items from *index* up to the *count*.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve" "Shellman" "Remisa")
echo ${myArray[@]:1:3} # Bob Eve Shellman
```

In above example we are interested in 3 items of array starting at index 1 (arrays are zero base indexed)

### array set element

Set element given value as Nth element.

```bash
#!/usr/bin/env bash

myArray=("Alice" "Bob" "Eve")
myArray[1]="Shellman"
echo ${myArray[@]} # Alice Shellman Eve
```
