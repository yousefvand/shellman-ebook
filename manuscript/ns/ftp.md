## ftp

Contains `FTP` related operations.

### list

Get the list of files on the ftp server at specific path.

```bash
#!/usr/bin/env bash

curl ftp://remisa:1234@mydomain/backup/
```

### download

Download specified file from ftp server.

```bash
#!/usr/bin/env bash

curl ftp://remisa:1234@mydomain/backup/latest.zip
```

### upload

Upload specified file to ftp server at desired path.

```bash
#!/usr/bin/env bash

curl -T test.zip ftp://remisa:1234@mydomain/backup/
```

### delete file

Delete specified file from ftp server.

```bash
#!/usr/bin/env bash

curl ftp://remisa:1234@mydomain/backup/test.zip -Q "DELE test.zip"
```

### rename

Rename specified file/directory on ftp server.

```bash
#!/usr/bin/env bash

curl ftp://remisa:1234@mydomain/backup/ -Q "-RNFR backup/test.zip" -Q "-RNTO backup/renamed.zip"
```
