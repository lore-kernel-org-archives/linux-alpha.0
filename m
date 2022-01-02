From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Booting newer kernels on the Jensen...update
Date: Sun, 2 Jan 2022 20:48:12 +0100 (CET)
Message-ID: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Alpha <linux-alpha@vger.kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, John Paul Adrian Glaubitz <glaubitz@debian.org>

Hi,

I've made some progress to get modern kernels booting on the Jensen, but
not in a positive way. I got aboot compiled with a gcc cross compiler
after a lot of hackery, installed it on a second disk, attached that to
my Jensen and booted it:

>>> boot dka300 -fl i
INIT-S-CPU...
AUDIT_BOOT_STARTS ... 
AUDIT_CHECKSUM_GOOD
AUDIT_LOAD_BEGINS
AUDIT_LOAD_DONE

aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.35
aboot: booting from device 'SCSI 1 6 0 0 300 0 JENS-IO'
aboot: valid disklabel found: 4 partitions.
aboot: loading uncompressed ...
aboot: loading compressed ...

unzip: unknown compression method
Welcome to aboot 1.0_pre20040408
Commands:
 h, ?                   Display this message
 q                      Halt the system and return to SRM
 p 1-8                  Look in partition <num> for configuration/kernel
 l                      List preconfigured kernels
 d <dir>                List directory <dir> in current filesystem
 b <file> <args>        Boot kernel in <file> (- for raw boot)
 i <file>               Use <file> as initial ramdisk
                        with arguments <args>
 0-9                    Boot preconfiguration 0-9 (list with 'l')
aboot> l
#
# aboot default configurations
#
0:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS0
1:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS0
3:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS1
#1:2/vmlinux.old.gz ro root=/dev/sda2
#2:2/vmlinux.new.gz ro root=/dev/sda2
#3:2/vmlinux ro root=/dev/sda2
#8:- ro root=/dev/sda2          # fs less boot of raw kernel
#9:0/- ro root=/dev/sda2                # fs less boot of (compressed) ECOFF kernel
-
aboot> 0
aboot: loading compressed vmlinux.gz...
ext2_bread: read error

unzip: attempted to read past eof
ext2_bread: read error
vmlinux.gz: file not found
aboot>

I suppose something went awfully wrong during the cross compile of aboot,
but I simply fail to understand why it tries to unzip a gzipped kernel.
I tried an uncompressed kernel as well, that one failed with:

"ext2_bread: read error"

as well. As ext2_bread of aboot uses the SRM console API in the end,
I assume this is prone to break when cross compiling...

Has anyone tried to cross compile aboot before and got it working?
There certainly is no support for cross compiling built in, maybe for
a reason.

Anyway, I have not given up, but now I have to go for a full native build,
which means I have to build a newer gcc, as all my existing Alpha installs
are too old to carry a usable gcc for modern kernel builds and all my attempts
on a fresh install have failed. My fastest machine is a PWS 600au, so this
will take a while.

I hope I'm not too annoying,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, Nightwatchers: On a Mission
