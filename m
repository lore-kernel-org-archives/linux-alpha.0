From: Frank Scheiner <frank.scheiner@web.de>
Subject: Re: Linux 6.1.27, cgroup: Instruction fault 4 with systemd
Date: Mon, 19 Jun 2023 14:01:36 +0200
Message-ID: <d5316df3-bc5e-cc0d-e673-7859e01047c2@web.de>
References: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
 <b9e52b7a6f68782707ca809a746823c0c752de5c.camel@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687176099; x=1687780899; i=frank.scheiner@web.de;
 bh=OX3j8RfUr3GzVFHYjbMtQfXmLaaft2okW3ldrHgZSSM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dv9mfNF24pzDUCTbYDlWowGhUAGkoSrlej+lirD+za3cce4zc72faS8yQB+2ziniGXZpwKp
 k7B1+nzDX5ZqrfDfWCqLBr+vCTggLThmsqze//cgPQyi/OtGtIUS8PJ/pQkixG8PYXCLElEu6
 Dbbq0NEa52+i+G988w6ysmQpL7g6GSzaKcJTL49o+K3cXjA/ml9jOM/Pwd0tCa0UkaBF9SL/m
 gWtdyN8bv1kIzQRIlPlDQVoRxmdsIcS2ku/H9kLvsj//wjIwA5uOZ6ImXOxc+FEBvo10ZDE0W
 LhUhXMATFBnfzJi9F0vql7rdgtqEjfs2m8nf8zVF6fnHvrCWS/UA==
Content-Language: en-US
In-Reply-To: <b9e52b7a6f68782707ca809a746823c0c752de5c.camel@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-alpha@vger.kernel.org
Cc: "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>

Hi,

let me add some additional data point(s):

After some testing on different machines and with different kernel types
it looks like this problem is exclusive to MP kernels. This also when
running a MP kernel on a single processor machine actually (tested on an
AlphaServer 800 5/400 w/EV56).

Running an SP kernel does not trigger that problem.

I posted a diff between the -alpha-generic and -alpha-smp kernel
configurations on [1].

[1]: https://pastebin.com/AwZQjHD9

On 22.05.23 11:37, John Paul Adrian Glaubitz wrote:
> Hello Frank!
>
> On Mon, 2023-05-22 at 11:34 +0200, Frank Scheiner wrote:
>> Maybe someone on linux-alpha has an idea what could be the reason?
>
> Try reproducing it with libcgroup to see if it's a systemd or a kernel b=
ug:
>
>> https://wiki.archlinux.org/title/cgroups#Examples

Took me a while to get back to this and actually get it working...

Following misc. examples and manpages (e.g. [2] and [3]) I did the
following to test cgroup functionality with System V init installed and
running instead of systemd:

```
root@ds25:~# uname -a
Linux ds25 6.3.0-1-alpha-smp #1 SMP Debian 6.3.7-1 (2023-06-12) alpha
GNU/Linux

root@ds25:~# mount
[...]
cgroup on /sys/fs/cgroup type tmpfs (rw,relatime,mode=3D755,inode64)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,relatime,cpuset)
cgroup on /sys/fs/cgroup/cpu type cgroup (rw,relatime,cpu)
[...]
cgroup on /sys/fs/cgroup/rdma type cgroup (rw,relatime,rdma)
cgroup on /sys/fs/cgroup/misc type cgroup (rw,relatime,misc)

root@ds25:~# CGROUP=3D/sys/fs/cgroup

root@ds25:~# mkdir $CGROUP/red
root@ds25:~# mount -t cgroup -o cpuset red $CGROUP/red
root@ds25:~# mkdir -p $CGROUP/red/shells/bash
root@ds25:~# chown root:root $CGROUP/red/shells/bash/*
root@ds25:~# id johndoe
uid=3D1001(johndoe) gid=3D1001(johndoe) groups=3D1001(johndoe),100(users)
root@ds25:~# chown root:johndoe $CGROUP/red/shells/bash/tasks
root@ds25:~# echo $(cgget -n -v -r cpuset.mems /) >
$CGROUP/red/shells/cpuset.mems
root@ds25:~# echo $(cgget -n -v -r cpuset.cpus /) >
$CGROUP/red/shells/cpuset.cpus
root@ds25:~# echo 0 > $CGROUP/red/shells/bash/cpuset.mems
root@ds25:~# echo 0 > $CGROUP/red/shells/bash/cpuset.cpus

root@ds25:~# cat /proc/self/cgroup
13:misc:/
12:rdma:/
11:pids:/
10:net_prio:/
9:perf_event:/
8:net_cls:/
7:freezer:/
6:devices:/
5:memory:/
4:blkio:/
3:cpuacct:/
2:cpu:/
1:cpuset:/

root@ds25:~# echo $$
1496

root@ds25:~# cgexec -g cpuset:shells/bash bash

root@ds25:~# echo $$
1695

root@ds25:~# cat /proc/self/cgroup
13:misc:/
[...]
2:cpu:/
1:cpuset:/shells/bash
```

[2]:
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/h=
tml/resource_management_guide/ch-using_control_groups

[3]: https://wiki.archlinux.org/title/cgroups#Examples

I then ran `7za b` in that shell and though `7za` executes two threads
assuming it has access to both CPUs, `htop` showed both of them running
on the first processor only. So it looks like at least this part of the
cgroup functionality is working with Linux 6.3.0-1 from Debian when
using System V init.

So it could be that this problem is only triggered with one or multiple
specific controller(s). But I don't exactly know how to determine the
used controller(s) for target "graphical.target" - where this seems to
happen according to (see more details on [4]):

```
[...]
[   11.864251] systemd[1]: Queued start job for default target
graphical.target.
[   11.958978] CPU 1
[   11.958978] systemd(1): Instruction fault 4
[...]
```

[4]: https://lists.debian.org/debian-alpha/2023/05/msg00012.html

Cheers,
Frank
