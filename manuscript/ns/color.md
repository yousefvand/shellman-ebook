## color

Write text in color. TO write in color we use `tput setaf` command followed by *color code*. Here is color code table:

Color   | Code|
--------|:----:
Black   |0    |
Red     |1    |
Green   |2    |
Yellow  |3    |
Blue    |4    |
Magenta |5    |
Cyan    |6    |
White   |7    |

To set *foreground color* to red we use `tput setaf 1` command and after some output we use `tput sgr0` command to set everything to default. So for writing *hello world* in red:

```bash
#!/usr/bin/env bash

echo `tput setaf 1`hello world`tput sgr0`
```
