# apkfile
Search files inside various versions of Alpine Linux packages

This script parses the output of https://pkgs.alpinelinux.org to help you find files within Alpine Linux packages across different versions and architectures.

## Features

- Search for files using wildcards (e.g., wge*)
- Support for multiple Alpine versions and architectures
- Caching mechanism for faster repeated searches
- Optional logging to file
- Version checking

## Requirements

`apkfile` depends on two packages: `curl` and `html2text`.

You should add these in advance with:

```
apk add curl html2text
```

The script will automatically check for these dependencies and provide installation instructions if they're missing.

## Install

```
$ sudo make install
```

## Usage

$ apkfile
usage: apkfile [-hclv] PATTERN [ARCH] [BRANCH]

Search a file inside all the Alpine packages.

PATTERN is the file you are looking for. Supports wildcards (e.g., wge*).

ARCH is optional. Default: x86_64

BRANCH is optional. Default: edge

options:
 -h  Show this help
 -c  Check if new versions and/or architectures are available
 -l  Log output to /tmp/apkfile.log
 -v  Show version
```

## Examples

Find `grep` file:

```
$ apkfile grep
File                                                 Package         Branch Repository Architecture
---------------------------------------------------------------------------------------------------
/usr/share/quilt/grep                                quilt           edge   testing    x86_64
/bin/grep                                            grep            edge   main       x86_64
/usr/share/yash/completion/grep                      yash-completion edge   community  x86_64
/usr/lib/plan9/bin/grep                              plan9port       edge   community  x86_64
/usr/lib/9base/bin/grep                              9base           edge   testing    x86_64

Found 5 matches.
--------------------------------------------------------
```

Find `telnet` within s390x arch only:

```
$ apkfile telnet s390x
File                                                 Package          Branch Repository Architecture
---------------------------------------------------------------------------------------------------
/usr/share/webapps/RackTables/gateways/telnet        racktables       edge   community  s390x
/usr/bin/telnet                                      inetutils-telnet edge   community  s390x

Found 2 matches.
```

Check available versions and architectures:

```
$ apkfile -c
https://pkgs.alpinelinux.org/packages supports the following Alpine versions and architectures:
    => Versions: edge v3.20 v3.19 v3.18 v3.17 v3.16 v3.15 v3.14 v3.13 v3.12 v3.11 v3.10 v3.9 v3.8 v3.7 v3.6 v3.5 v3.4 v3.3 v3.2
    => Architectures: x86_64 x86 aarch64 armhf ppc64le s390x armv7 riscv64
```

Enable logging to file:
```
$ apkfile -l grep
# Output will be logged to /tmp/apkfile.log
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

# Notes

The script automatically creates a cache directory at /tmp/apkfile_cache to speed up repeated searches.

Use the `-l` option to log all output to `/tmp/apkfile.log`.

Version numbers can be specified with or without the `'v'` prefix (e.g., both 3.12 and v3.12 work).

The script will automatically check for required dependencies when run.
