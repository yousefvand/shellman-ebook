## Working with variables

### variable assign | variable set

Setting a variable.

```bash
#!/usr/bin/env bash

variable='value'
```

### variable default value | assign if empty

Set default value for a variable if it never set by programmer.

```bash
: "${variable:=defaultValue}"
```

### variable read | variable expand

Standard variable format.

```bash
"${result}"
"${variable}"
```
