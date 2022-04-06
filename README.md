# apkfile
Search files inside various version of alpine linux packages

Just copy `apkfile` in `/usr/bin` and run it with the file you are looking for.

This is a stupid script that parses the output of https://pkgs.alpinelinux.org
So, only the version and arches in that web page are supported.

Since (again) this script is stupid, it does not pickup automatically the new alpine versions :)

## Requirements

`apkfile` depends on two packages: `curl` and `html2text`.

You sohuld add these in advance with:

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
Usage: ./apkfile <pattern> [arch] [branch]

        <pattern>: Mandatory. Is the file you are searching. Supports wildcards (e.g. wge*) 
        [arch]: Optional (default:  x86_64). Architecture. Valid values: armv7 s390x ppc64le armhf aarch64 x86 x86_64 all
        [branch]: Optional (default: edge). Alpine releases. Valid values: v3.3 v3.4 v3.5 v3.6 v3.7 v3.8 v3.9 v3.10 v3.11 v3.12 v3.13 v3.14 v3.15 edge all
```

## Examples

Find `grep` file:

```
$ /usr/bin/apkfile grep
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
$ ./apkfile telnet all
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
$ ./apkfile telnet all v3.12
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
