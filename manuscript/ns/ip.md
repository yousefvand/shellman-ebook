## IP

Contains `ip` related operations.

### ip local IPs

Array of local IPs.

```bash
#!/usr/bin/env bash

IPS=`hostname -I`
echo "$IPS"
```

### ip info

public ip information (ip, city, region, country, location, postal code, organization).

```bash
#!/usr/bin/env bash

echo `curl -s ipinfo.io/country`
# U.K
```

### ip public

Find public ip address via different services.

- bot.whatismyipaddress.com
- ident.me
- ipecho.net/plain
- icanhazip.com
- ifconfig.me
- api.ipify.org
- ipinfo.io/ip

```bash
#!/usr/bin/env bash

PUBLIC_IP=`curl -s api.ipify.org`
echo "$PUBLIC_IP"
```
