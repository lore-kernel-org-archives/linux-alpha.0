From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Fri, 7 Mar 2008 08:23:05 +0100
Message-ID: <20080307072304.GA25351@elte.hu>
References: <20080307034155.A8C6EDBA2@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080307034155.A8C6EDBA2@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>


[Cc:-ed FUJITA Tomonori who did the Alpha IOMMU changes - full report 
from Bob quoted below.]

Bob, does latest -git boot if you revert these 4 commits:

commit d5a4630a0daad241c761064295958554472ed491
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Tue Mar 4 14:28:58 2008 -0800

    alpha: remove unused DEBUG_FORCEDAC define in IOMMU

commit cf5401454863df8e6dc3ebe8faad09141cbec187
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Tue Mar 4 14:28:57 2008 -0800

    alpha: make IOMMU respect the segment boundary limits

commit 23d7e0390ab57cf15a5cfe8d6806192f0997e5a8
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Tue Mar 4 14:28:57 2008 -0800

    alpha: IOMMU had better access to the free space bitmap at only one place

commit 3c5f1def7dd50b792f56dcf7378c2684c06947f3
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Tue Mar 4 14:28:54 2008 -0800

    alpha: convert IOMMU to use ALIGN()

	Ingo

* Bob Tracy <rct@frus.com> wrote:

> The regression is relative to 2.6.25-rc1 + timer fixes (added when
> I reported the problems with 2.6.25-rc1 relative to 2.6.24).  I haven't
> tried -rc2 or -rc3.
> 
> Might be related to similar reports I've seen, but wanted to add the
> Alpha platform to the list.  The -rc4 kernel boots, but at some point
> following initialization of the SCSI layer, there's a panic with enough
> diagnostic output that a 50-line screen can't hold it all.  Unfortunately,
> the system logging isn't active, so nothing gets captured.
> 
> The panic is completely reproducible.  The "Code" line at the bottom
> of the panic output is
> 
> 44220001 4821f621 4821b681 4821f62b f420004f 00000081 <0000009b> 0066c012
> 
> The first line of the "Trace" section is
> 
>  [<fffffc000031a41f>] iommu_arena_alloc+0x64/0xe0
> 
> Platform is an Alpha PWS 433au.  gcc is version 4.1.2 (Debian 4.1.1-21).
> 
> -- 
> ------------------------------------------------------------------------
> Bob Tracy          |  "I was a beta tester for dirt.  They never did
> rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
> ------------------------------------------------------------------------
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
