## crypto

Contains `Cryptography` related operations like encryption, decryption and hashing.

### base64 encode

Encode variable content into *base64*.

T> ### Base64
T>
T> This encoding is used to transform *binary* data into *string* usually to save in a file or transfer over network.

```bash
#!/usr/bin/env bash

base64Encoded=`echo -n "$variableToEncode" | base64`
```

### base64 decode

Decode `String` from *base64* into `Binary`.

```bash
#!/usr/bin/env bash

base64Decoded=`echo -n "$variableToDecode" | base64 -d`
```

### hash

Hash variable content with desired algorithm.

```bash
#!/usr/bin/env bash

hash=`echo -n "$variableToHash" | md5sum | cut -f1 -d ' '`
echo "$hash"
```

Supported algorithms:

- md5
- sha
- sha1
- sha224
- sha256
- sha384
- sha512
