## archive

Contains `archive` related operations like compressing and decompressing files/directories. In Linux, `tar` combines files/folders into a single file without compression and mixing it with some compression utilities gives us for example `archive.tar.gz`.

### compress tar.gz

Compress file(s)/director(ies) into a compressed archive file (`.tar.gz`)

```bash
#!/usr/bin/env bash

tar -czvf ~/archive.tar.gz ~/some-directory
```

In above example we are compressing and archiving a directory (`some-directory`) from our *home* directory (denoted by `~`) into `archive.tar.gz` file in our *home* directory. This is useful for example if we are interested to backup `some-directory`.

### decompress tar.gz

Decompress an archive file (`.tar.gz`) into a path.

```bash
#!/usr/bin/env bash

tar -C ~/ -xzvf ~/archive.tar.gz
```

In above example we are decompressing `archive.tar.gz` file from our *home* directory into our *home* directory.

### compress tar.xz

If you need more compression than previous method, use `tar.xz`:

Compress file(s)/director(ies) into a compressed archive file (`.tar.gz`)

```bash
#!/usr/bin/env bash

tar -cJf ~/archive.tar.xz ~/some-directory
```

In above example we are compressing and archiving a directory (`some-directory`) from our *home* directory (denoted by `~`) into `archive.tar.xz` file in our *home* directory. This file usually is smaller than its equivalent `archive.tar.gz` and the compression process is slower.

### decompress tar.xz

Decompress an archive file (`.tar.xz`) into a path.

```bash
#!/usr/bin/env bash

tar -C ~/Documents -xf ~/archive.tar.xz
```

In above example we are decompressing `archive.tar.xz` file from our *home* directory into `Documents` directory inside our *home* directory.
