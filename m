From: Michael Cree <mcree@orcon.net.nz>
Subject: Alpha Kernel Regression [was Re: BRSGP relocation truncations in
 linking kernel for Alpha.]
Date: Thu, 9 Feb 2017 22:58:53 +1300
Message-ID: <20170209095853.yjjuaajbzxofx7xu@tower>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower>
 <580E7616.2020806@gmx.de>
 <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
 <20161025082638.u7c5kpi2q3kr3kld@tower>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161025082638.u7c5kpi2q3kr3kld@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, linux-alpha <linux-alpha@vger.kernel.org>, Chen Feng <puck.chen@hisilicon.com>
Cc: Helge Deller <deller@gmx.de>, LKML <linux-kernel@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

On Tue, Oct 25, 2016 at 09:26:38PM +1300, Michael Cree wrote:
> And while I mention libc I am seeing (rather rare) random segfaults
> in programs such as cp, tar, install and dpkg ever since the upgrade
> to glibc 2.23 (or maybe it was 2.24).  I am struggling to get a
> backtrace because it only happens very occassionally (but often enough
> that it is almost impossible for a build and install of large software
> packages such as libreoffice to complete without failure at some
> random point) and when I rerun the failing program manually it then
> always works.  I'll keep trying to narrow this one down.

It's not glibc.  Downgrading to previously known working versions does
not solve the random segfaults.  But downgrading the kernel does fix
the problem on Alpha.  Noted that 4.6 is good but 4.6.7 is bad so
bisected the 4.6.y stable kernel branch to get the first bad commit as
0784672d05684de901fc2aa56150d7ea9a475a2d, i.e.:

commit 0784672d05684de901fc2aa56150d7ea9a475a2d
Author: Chen Feng <puck.chen@hisilicon.com>
Date:   Fri May 20 16:59:02 2016 -0700

    mm/compaction.c: fix zoneindex in kcompactd()
    
    commit 6cd9dc3e75078ef646076fa63adfb9b85ced0b66 upstream.
    
    While testing the kcompactd in my platform 3G MEM only DMA ZONE.  I
    found the kcompactd never wakeup.  It seems the zoneindex has already
    minus 1 before.  So the traverse here should be <=.
    
    It fixes a regression where kswapd could previously compact, but
    kcompactd not.  Not a crash fix though.

Cheers
Michael.
