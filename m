From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 08/12] parisc: use pgtable-nopXd instead of 4level-fixup
Date: Thu, 24 Oct 2019 12:50:54 +0300
Message-ID: <20191024095053.GC12281@rapoport-lnx>
References: <1571822941-29776-9-git-send-email-rppt@kernel.org>
 <20191024093451.15161-1-peda@axentia.se>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571910666;
        bh=/+Ql7TLHSuqRBTRatle/8UuavLp8M4wg90FkQYvX1ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fHWraPApPelpUnhz80IdJ6qZ3Jw5R++RrLd4l7PfuOCafzao2ErCM/1ApQ91lUK7E
         0uYS2e9f/H3CF0FLyqr+11wZLk0ellanlE4rDMkvpBd62/g9WmtWFtWw6GDYvxb0sb
         DxnPSUgn8n7OenmDPbNDDb0vZF9lfVpAL0VLc18U=
Content-Disposition: inline
In-Reply-To: <20191024093451.15161-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@axentia.se>
Cc: "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>, "arnd@arndb.de" <arnd@arndb.de>, "davem@davemloft.net" <davem@davemloft.net>, "deanbo422@gmail.com" <deanbo422@gmail.com>, "deller@gmx.de" <deller@gmx.de>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "gerg@linux-m68k.org" <gerg@linux-m68k.org>, "green.hu@gmail.com" <green.hu@gmail.com>, "jdike@addtoit.com" <jdike@addtoit.com>, "kirill@shutemov.name" <kirill@shutemov.name>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, l

On Thu, Oct 24, 2019 at 09:35:12AM +0000, Peter Rosin wrote:
> On 2019-10-23 12:28, Mike Rapoport <rppt@kernel.org> wrote:
> > parisc has two or three levels of page tables and can use appropriate
> > pgtable-nopXd and folding of the upper layers.
> >
> > Replace usage of include/asm-generic/4level-fixup.h and explicit
> > definitions of __PAGETABLE_PxD_FOLDED in parisc with
> > include/asm-generic/pgtable-nopmd.h for two-level configurations and with
> > include/asm-generic/pgtable-nopmd.h for three-lelve configurations and
> 
> I think you mean .../pgtable-nopud.h in the latter case.

Right, thanks!
 
> Cheers,
> Peter

-- 
Sincerely yours,
Mike.
