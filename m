From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 05/13] m68k: mm: use pgtable-nopXd instead of
 4level-fixup
Date: Sun, 10 Nov 2019 10:41:26 +0200
Message-ID: <20191110084125.GA9494@rapoport-lnx>
References: <1572938135-31886-1-git-send-email-rppt@kernel.org>
 <1572938135-31886-6-git-send-email-rppt@kernel.org>
 <20191108113917.a9c6ebb8373cc95fd684b734@linux-foundation.org>
 <CAMuHMdXdoFSVno4WT=F6Q1UwEaZ6AQJmhNUqPpYHJm6uh165iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0Q2US6T+brczHyasr9kHvsBS6Rvx9fcjLBkQKJmN+s=; b=f3THFDOk3sCyDd
	SF08/pO1aL+ndG6moOKPq+CnijloI9ZfQwywoIdbXdgyMVDE7FgtBJryNSAAfWXCMWe+7bre/vJBK
	xrBViev5jg58LG1SQ7/ogUp46iAkcSzwsjiPPM6PoI+6Y5hvvjCC/xwYefS5j0+CnXw26Fk62QyHR
	OhLinV8eKLs9N5An3oKIb9QLTLub8ihpvJMP08NNqAyLJd1jIKoJF9pBKWqMxIEM0Oc5mxAeiohzC
	Fdw/NjEcvnYtFGSklKZelYY3JC35l1yCg8CPqzmf2KZzrJhJbgShBPH0TBGyN3JmYH2YqZZINpSKB
	GhLrk6X14lPtzHtGT/Zg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573375299;
 bh=VivvRZF7S/gADzD3po2D0GMBa+a0TZ5FLEfZj0Cja2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MhQPa5FrV+cprfH5LgO2ngz5WqWHYxNnhtlF8+EWWiR3YG5Vr0xkKzXyZ33AQdepy
 Y53SeeHSS15YwGONO0eTs1D0QPsAGRYcPqxFn365q39QPKS3BXz4WP3RSRENNf6l8i
 sUwJM9yFWuX0jXXhjx2/CnlEYW9BRJ1kjfyDrNEs=
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdoFSVno4WT=F6Q1UwEaZ6AQJmhNUqPpYHJm6uh165iw@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Vincent Chen <deanbo422@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, Greentime Hu <green.hu@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linux ARM <linux-arm>

Hi Andrew,

On Sat, Nov 09, 2019 at 03:26:29PM +0100, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Fri, Nov 8, 2019 at 8:39 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Tue,  5 Nov 2019 09:15:27 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> > > m68k has two or three levels of page tables and can use appropriate
> > > pgtable-nopXd and folding of the upper layers.
> > >
> > > Replace usage of include/asm-generic/4level-fixup.h and explicit
> > > definitions of __PAGETABLE_PxD_FOLDED in m68k with
> > > include/asm-generic/pgtable-nopmd.h for two-level configurations and with
> > > include/asm-generic/pgtable-nopud.h for three-lelve configurations and
> > > adjust page table manipulation macros and functions accordingly.
> >
> > This one was messed up by linux-next changes in arch/m68k/mm/kmap.c.
> > Can you please take a look?

Can you please elaborate what was the problem?

The patch applies cleanly to v5.4-rc6-mmots-2019-11-08-16-23 (from
github.com/hnaz/linux-mm) and all the page table traversals in
arch/m68k/mm/kmap.c look Ok.

I've build atari_defconfig and it boots fine on aranym.
 
> You mean due to the rename and move of __iounmap() to __free_io_area()
> in commit aa3a1664285d0bec ("m68k: rename __iounmap and mark it static")?
> 
> Commit 42d6c83d6180f800 ("m68k: mm: use pgtable-nopXd instead of
> 4level-fixup") in next-20191108 looks good to me.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.
