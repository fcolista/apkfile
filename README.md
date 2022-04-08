# apkfile
Search files inside various versions of Alpine Linux packages

This is a stupid script that parses the output of https://pkgs.alpinelinux.org

So, only the versions and arches in that web page are supported.

Since (again) this script is stupid, it does not pickup automatically the new Alpine versions :)

## Requirements

`apkfile` depends on two packages: `curl` and `html2text`.

You should add these in advance with:

```
apk add curl html2text
```

## Install

```
$ sudo make install
```

## Usage

```
$ apkfile
usage: ./apkfile [-hc] [PATTERN] [ARCH] [BRANCH]

Search a file inside all the alpine packages.

PATTERN is the file you are looking for. Supports wildcards (e.g. wge*).

ARCH is optional. Default x86_64

BRANCH is optional. Default: edge

options:
 -h  Show this help
 -c  Check if new versions and/or arches are available
```

## Examples

Find `grep` file:

```
$ apkfile grep
File                            Package         Branch Repository Architecture
/usr/share/quilt/grep           quilt           edge   testing    x86_64
/bin/grep                       grep            edge   main       x86_64
/usr/share/yash/completion/grep yash-completion edge   community  x86_64
/usr/lib/plan9/bin/grep         plan9port       edge   community  x86_64
/usr/lib/9base/bin/grep         9base           edge   testing    x86_64
```

Find `telnet` within s390x arch only:

```
$ apkfile telnet s390x
File                           Package          Branch Repository Architecture
/usr/share/webapps/RackTables/ racktables       edge   community  s390x
gateways/telnet
/usr/bin/telnet                inetutils-telnet edge   community  s390x
```

Find `telnet` within all archs supported by alpine:

```
$ apkfile telnet all
File                           Package          Branch Repository Architecture
/usr/share/webapps/RackTables/ racktables       edge   community  x86_64
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  x86
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  aarch64
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  armhf
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  ppc64le
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  s390x
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  armv7
gateways/telnet
/usr/share/webapps/RackTables/ racktables       edge   community  riscv64
gateways/telnet
/usr/bin/telnet                inetutils-telnet edge   community  x86_64
/usr/bin/telnet                inetutils-telnet edge   community  x86
/usr/bin/telnet                inetutils-telnet edge   community  aarch64
/usr/bin/telnet                inetutils-telnet edge   community  armhf
/usr/bin/telnet                inetutils-telnet edge   community  ppc64le
/usr/bin/telnet                inetutils-telnet edge   community  s390x
/usr/bin/telnet                inetutils-telnet edge   community  armv7
/usr/bin/telnet                inetutils-telnet edge   community  riscv64
```

Find `telnet` in all arches but only within v3.12:

```
$ apkfile telnet all v3.12
File                           Package    Branch Repository Architecture
/usr/share/webapps/RackTables/ racktables v3.12  community  x86_64
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  x86
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  aarch64
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  armhf
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  ppc64le
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  s390x
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  armv7
gateways/telnet
/usr/share/webapps/RackTables/ racktables v3.12  community  mips64
gateways/telnet
```

# Containers

## Docker

Build the image:

```
$ docker image build -t fcolista/apkfile .
```

Run the container:

```
$ docker container run --rm --name apkfile fcolista/apkfile telnet
```

## Podman

Build the image:

```
$ doas podman build -t fcolista/apkfile .
```

Run the container:

```
$ doas podman run localhost/fcolista/apkfile telnet
```
