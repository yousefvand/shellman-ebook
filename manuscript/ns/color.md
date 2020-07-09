## color

Write text in color. `color` *namespace* contains commands to write in different foreground colors. To write in color we use `tput setaf` command followed by *color code*. Here is color code table:

{width="narrow"}
| Color   | Code |  Snippet  
|---------|:----:|-----------
| Black   |0     | `color black`
| Red     |1     | `color red`
| Green   |2     | `color green`
| Yellow  |3     | `color yellow`
| Blue    |4     | `color blue`
| Magenta |5     | `color magenta`
| Cyan    |6     | `color cyan`
| White   |7     | `color white`

To set *foreground color* to red we use `tput setaf 1` command and after some output we use `tput sgr0` command to set everything to default. You don't need to memorize codes, there is a snippet for every color. So for writing *hello world* in red, use `color red` snippet:

```bash
#!/usr/bin/env bash

echo `tput setaf 1`hello world`tput sgr0`
```

X> ## Colorful Text
X>
X> Write a shell script that prints *Hello World!* in all 8 colors using a `for` *loop*.

For the answer refer to [Solutions](#solutions) section, [colorful text](#colorful_text).
