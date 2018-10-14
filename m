From: Meelis Roos <mroos@linux.ee>
Subject: Relocation (type 4) overflow on alpha for big module
Date: Sun, 14 Oct 2018 10:07:13 +0300
Message-ID: <5bc11e00-258d-a6ea-fe63-ddcfdb847071@linux.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: et-EE
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

I decided to try btrfs on one of my alphas and got a surprise - btrfs module does not load:

modprobe: ERROR: could not insert 'btrfs': Exec format error

dmesg has

module btrfs: Relocation (type 4) overflow vs btrfs_attach_transaction_barrier

Happens both natively on alpha:
binutils 2.30.0 (Gentoo 2.30 p2) and gcc version 7.3.0 (Gentoo 7.3.0-r3 p1.4)
or in cross-compiling:
binutils (GNU Binutils for Debian) 2.31.1 and gcc version 8.1.0 (Debian 8.1.0-12)

btrfs.ko has size 2939856. Build-in btrfs initializes and tests itself just fine.

This seems to have happened in the distant past:
https://www.redhat.com/archives/axp-list/2005-March/msg00060.html

Do we have a similar binutils problem again with big modules?

-- 
Meelis Roos <mroos@linux.ee>
