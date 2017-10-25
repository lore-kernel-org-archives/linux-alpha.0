From: Meelis Roos <mroos@linux.ee>
Subject: Re: alpha boot hang - 4.14-rc* regression
Date: Wed, 25 Oct 2017 11:12:21 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1710251109150.7098@math.ut.ee>
References: <alpine.LRH.2.21.1710251043170.7098@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.21.1710251043170.7098@math.ut.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-alpha@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

> I run Gentoo Linux on my alphas, with latest git kernels for test. 
> 4.13.0 worked well on 3 alphas but 4.13.0-09217-g5969d1bb3082 hangs on 
> boot on all 3 of them. Tried bisecting on PC164, got into unrelated 
> stuff, so probably it does not trigger always. Retried bisecting on 
> DS10L. On the first try I got that the same keel where I first saw bad 
> was the culprit, another bisect led me to 
> 0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b which looks more related.
> 
> This is how the crash looks on console:
> 
>  * Starting udev ...
> starting version 225
>  [ ok ]
>  * Generating a rule to create a /dev/root symlink ...
>  [ ok ]
>  * Populating /dev with existing devices through uevents ...
>  [ ok ]
> 
> halted CPU 0
> 
> halt code = 5
> HALT instruction executed
> PC = fffffc00009bf914
> boot failure
> >>>
> 
> What else can I do to debug this?

Booting with debug ignore_loglevel I get also this:

seq 421 queued, 'add' 'platform'
seq 417 running
passed device to netlink monitor 0x200010c7820
seq 417 processed
seq 418 running
IMPORT builtin 'hwdb' /lib/udev/rules.d/50-udev-default.rules:15
IMPORT builtin 'hwdb' returned non-zero
RUN 'kmod load $env{MODALIAS}' /lib/udev/rules.d/80-drivers.rules:5
Execute 'load' 'platform:alarmtimer'
seq 419 running
IMPORT builtin 'hwdb' /lib/udev/rules.d/50-udev-default.rules:15
IMPORT builtin 'hwdb' returned non-zero
RUN 'kmod load $env{MODALIAS}' /lib/udev/rules.d/80-drivers.rules:5
Execute 'load' 'platform:floppy'
No module matches 'platform:floppy'
passed device to netlink monitor 0x200010ca0c0
seq 419 processed
seq 421 forked new worker [453]
seq 422 queued, 'add' 'serio'
seq 420 running
GROUP 11 /lib/udev/rules.d/40-gentoo.rules:2
GROUP 6 /lib/udev/rules.d/50-udev-default.rules:55
handling device node '/dev/fd0', devnum=b2:0, mode=0660, uid=0, gid=6
set permissions /dev/fd0, 060660, uid=0, gid=6
creating symlink '/dev/block/2:0' to '../fd0'
created empty file '/run/udev/data/b2:0' for '/devices/platform/floppy.0/block/fd0'
passed device to netlink monitor 0x200010c7820
seq 420 processed
No module matches 'platform:alarmtimer'
passed device to netlink monitor 0x200010c8c50
seq 418 processed
passed 208 byte device to netlink monitor 0x2000109ffa0
seq 423 queued, 'add' 'serio'
seq 424 queued, 'add' 'platform'
passed 178 byte device to netlink monitor 0x2000109ffa0
seq 425 queued, 'add' 'platform'
seq 425 running
IMPORT builtin 'hwdb' /lib/udev/rules.d/50-udev-default.rules:15
IMPORT builtin 'hwdb' returned non-zero
RUN 'kmod load $env{MODALIAS}' /lib/udev/rules.d/80-drivers.rules:5
Execute 'load' 'platform:rtc-alpha'
No module matches 'platform:rtc-alpha'
passed device to netlink monitor 0x200010c7820
seq 425 processed
seq 424 running
IMPORT builtin 'hwdb' /lib/udev/rules.d/50-udev-default.rules:15
IMPORT builtin 'hwdb' returned non-zero
RUN 'kmod load $env{MODALIAS}' /lib/udev/rules.d/80-drivers.rules:5
Execute 'load' 'platform:pcspkr'
[   29.890609] libata version 3.00 loaded.

passed device to netlink monitor 0x200010c8c50
halted CPU 0

halt code = 5
HALT instruction executed
PC = fffffc00009bf914
boot failure


So maybe it is related pcspkr loading, or the just loaded libata or 
floppy...

-- 
Meelis Roos (mroos@linux.ee)
