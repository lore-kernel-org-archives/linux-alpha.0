From: "IOS Group, Nottingham" <ios@eee.nottingham.ac.uk>
Subject: Mounting UFS disks under linux-alpha
Date: Thu, 15 Aug 2002 09:38:14 +0100 (BST)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.SOL.4.03.10208150929230.22467-100000@norton>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org


Dear List,

I want to mount some tru64 disks on alphas I have 
migrated from tru64 to linux-alpha but I find that 
it is not straight forward.

On one machine the format is ADFS which I don't think 
is supported under linux - is this correct?

On another the format is definitely UFS but I am still 
unable to mount the disk.  (I have got the ufs module
compiled and loaded into the system).

---under linux
>> lsmod
Module                  Size  Used by    Not tainted
ufs                    85600   0  (unused)
ide-cd                 38688   0  (autoclean)
cdrom                  39032   0  (autoclean) [ide-cd]
.......
---

--- under tru64
>> cat /etc/fstab

/dev/rz6a        /              ufs rw 1 1
/proc            /proc  procfs rw 0 0
/dev/rz6g        /usr   ufs rw 1 2
/dev/rz6h        /opt   ufs rw 1 2
etc etc
---

When I try to mount any of the ufs partitions I get

mount -v -t ufs /dev/sdb1 /tmp_mnt
mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
       or too many mounted file systems


Any hints? Is there any way to probe a disk to find out what 
partitions are on it, do I have to load anyhting apart from
the ufs.o module (do I have to compile it into the kernel
instead).

Sorry about the lameness of these questions but it is driving
me mad and I can't find a simple definitive working answer
in the docs.


Thanks SA




----------------------------------------------------
	   No Spam under any circumstances
----------------------------------------------------

