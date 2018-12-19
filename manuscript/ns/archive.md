## archive

Contains `archive` related operations like compressing and decompressing files/directories.

### compress tar.gz

Compress file(s)/director(ies) into a compressed archive file (`.tar.gz`)

```bash
#!/usr/bin/env bash

tar -czvf ~/archive.tar.gz ~/some-directory
```

In above example we are compressing and archiving a directory (`some-directory`) from our *home* into `archive.tar.gz` file in our *home* directory. This is useful for example if we are interested to backup `some-directory`.

### decompress tar.gz

Decompress an archive file (`.tar.gz`) into a path.

```bash
#!/usr/bin/env bash

tar -C ~/ -xzvf ~/archive.tar.gz
```

In above example we are decompressing `archive.tar.gz` file from our *home* directory into our *home* directory.
