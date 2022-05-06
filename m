From: Michael Cree <mcree@orcon.net.nz>
Subject: Alpha: rare random memory corruption/segfault in user space bisected
Date: Sat, 7 May 2022 09:21:25 +1200
Message-ID: <YnWRVd5slCy5H0fC@creeky>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>

Alpha kernel has been exhibiting rare and random memory
corruptions/segaults in user space since the 5.9.y kernel.  First seen
on the Debian Ports build daemon when running 5.10.y kernel resulting
in the occasional (one or two a day) build failures with gcc ICEs either
due to self detected corrupt memory structures or segfaults.  Have been
running 5.8.y kernel without such problems for over six months.

Tried bisecting last year but went off track with incorrect good/bad
determinations due to rare nature of bug.  After trying a 5.16.y kernel
early this year and seen the bug is still present retried the bisection
and have got to:

aae466b0052e1888edd1d7f473d4310d64936196 is the first bad commit
commit aae466b0052e1888edd1d7f473d4310d64936196
Author: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Date:   Tue Aug 11 18:30:50 2020 -0700

    mm/swap: implement workingset detection for anonymous LRU


Pretty confident this is the bad commit as the kernel built to the parent
commit (3852f6768ede54...) has not failed in four days running. Always have
seen the failure within one day of running in past.

Cheers,
Michael.
