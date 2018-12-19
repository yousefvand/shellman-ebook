## http

Contains `HTTP` related operations.

### GET

Send a *GET* request to specified *URL*.

```bash
#!/usr/bin/env bash

curl --request GET -sL \
  --user-agent 'Shellman' \
  --url 'http://example.com'
```

Above example sends a *HTTP GET* request to <http://example.com> with desire [User Agent](https://en.wikipedia.org/wiki/User_agent).

### DELETE

Send a *DELETE* request to specified *URL*.

```bash
#!/usr/bin/env bash

curl --request DELETE -sL \
  --user-agent 'Shellman' \
  --url 'http://example.com'
```

### POST

Send a *POST* request to specified *URL*.

```bash
#!/usr/bin/env bash

curl --request POST -sL \
  --user-agent 'Shellman' \
  --url 'http://example.com' \
  --data 'key1=value1' \
  --data 'key2=value2'
```

### POST file

Send file with *http POST*.

```bash
#!/usr/bin/env bash

curl --request POST -sL \
  --user-agent 'Shellman' \
  --url 'http://example.com' \
  --form 'key=value' \
  --form 'file=@~/image.jpg'
```

Above example sends `image.jpg` to <http://example.com> via *POST* method.

### header

Send http request with custom header(s).

```bash
#!/usr/bin/env bash

curl --request GET -sL \
  --user-agent 'Shellman' \
  --header 'key: value' \
  --url 'http://example.com'
```

### cookie

Send http request with desired cookies.

```bash
#!/usr/bin/env bash

curl --request GET -sL \
  --user-agent 'Shellman' \
  --cookie 'key=value' \
  --url 'http://example.com'
```

### download

Download from url and save to desired *path*.

```bash
#!/usr/bin/env bash

curl --request GET -sL \
  --user-agent 'Shellman' \
  --output '~/downloaded-file.zip' \
  --url 'http://example.com/file.zip'
```
