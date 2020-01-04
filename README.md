# keepalived for a highly available Kubernetes control plane

[![Build Status](https://cloud.drone.io/api/badges/curx/keepalived-k8scp/status.svg)](https://cloud.drone.io/curx/keepalived-k8scp)

This OCI container image is used for a StaticPod on Kubernetes Controlplane.

## Available environment variables

```
# Configure the IP Address, KEEPALIVED_VIP
# - mandatory
#
# e.g. 192.168.1.11
KEEPALIVED_VIP="192.168.1.11"

# Configure the network interface for keepalived, KEEPALIVED_INTERFACE
# - mandatory
#
# e.g. eth0
KEEPALIVED_INTERFACE="eth0"

# Configure the password for keepalived, AUTH_PASSWORD
# - optional, but if not set it will be generated
# Note: 8 Chars
#
# e.g. 12345678
AUTH_PASSWORD="12345678"
```


## Example

```bash
docker run \
  -e KEEPALIVED_VIP="192.168.1.1" \
  -e KEEPALIVED_INTERFACE="eth0" \
  -e AUTH_PASSWORD="12345678" \
  ...
```

## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thorsten Schifferdecker](https://github.com/curx)


## License

GPL-2


## Copyright

```
Copyright (c) 2018 Thorsten Schifferdecker
```
