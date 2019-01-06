## format

Write text in italic, bold, dim or reverse contrast.

![formated text](images/format.png)

### bold

Write in **bold**.

```bash
#!/usr/bin/env bash

echo `tput bold`bold text`tput sgr0`
```

### italic

Write in *italic*.

```bash
#!/usr/bin/env bash

echo `tput sitm`italic text`tput sgr0`
```

### dim

Write dim text.

```bash
#!/usr/bin/env bash

echo `tput dim`dimmed text`tput sgr0`
```

### reverse

Write text in reverse contrast.

```bash
#!/usr/bin/env bash

echo `tput rev`reversed text`tput sgr0`
```