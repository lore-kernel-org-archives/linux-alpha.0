From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Date: Tue, 1 Oct 2019 19:14:13 -0500
Message-ID: <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlnSBDMd8WtF3b0zpILBBk1xZJoouGj9ZB7hcMW4gcE=; b=XFRiLZPdOjrwtx
	BnOKoDUneWEjoUfdw72yf94QMDDWlOJ7R7+St2rTaq2U5Dm7m+j95vbewCuvsDi2UYbGWzYcc4Ts1
	nA3pNLI05WFSQvBE5zUrnPZ4KFACOsbIYykX5RACVGv8e+QxKQ3pUqjY0SrI38eMNSTUm+rdnwBOv
	L9wm2GPtARwNB4sBmKV+gZKbHZBtJQ9FxZ7we+5DWbU/NRrJxYecTSdslRMakNDzCxh8PMywvvAvY
	Kzd5avZ0QkG+ybbqMuXZtQqlXpVIaoRuWULi764MjS8p0cxg5SOiiGaeigyEUhJElXHfudMF1lGO6
	EygkjvhVB6BMwbkQIm5g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qp6mpPjoJw8IpL230TwztYNGcdXtc2wRumjJPrYIsQE=;
 b=nJtPZChLaez2QyIvdw5xpQM+gY+4nNfutZP/DX1GosRihN1p8Y/jzvzU5+zZVVXLDq
 DNW5rNxAEWMfY4DML2WBa4k8L6N9BKjZt+S1WhSwJylMRWekm8bQGBEDcBvcSstJLeH7
 osBNQPoC6vhf9EY6DvGZUS8bjPCLVbggq0vpLSG6o0qgZ68mHanhcK7N3A/k0zMXrBbT
 Myz3NcGtILKbjxYen8N4nInaRBIm801lXbpfCzyfiuoGv9mi3cSKUjp9iAirGweypF7I
 T5mChO7ltGRoxOnD6pn9vRPircx8cSspNsbQ9S+cDzRYkEkb4WMfK2l7wEZANDZnvpgU
 4hTA==
In-Reply-To: <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.j

On Sun, Sep 29, 2019 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
>
> I am attaching two logs.  I now the mailing lists will be unhappy, but
>  don't want to try and spam a bunch of log through the mailing liast.
> The two logs show the differences between the working and non-working
> imx6q 3D accelerator when trying to run a simple glmark2-es2-drm demo.
>
> The only change between them is the 2 line code change you suggested.
>
> In both cases, I have cma=128M set in my bootargs.  Historically this
> has been sufficient, but cma=256M has not made a difference.
>

Mike any suggestions on how to move forward?
I was hoping to get the fixes tested and pushed before 5.4 is released
if at all possible

> adam
>
> On Sat, Sep 28, 2019 at 2:33 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Thu, Sep 26, 2019 at 02:35:53PM -0500, Adam Ford wrote:
> > > On Thu, Sep 26, 2019 at 11:04 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Sep 26, 2019 at 08:09:52AM -0500, Adam Ford wrote:
> > > > > On Wed, Sep 25, 2019 at 10:17 AM Fabio Estevam <festevam@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Sep 25, 2019 at 9:17 AM Adam Ford <aford173@gmail.com> wrote:
> > > > > >
> > > > > > > I tried cma=256M and noticed the cma dump at the beginning didn't
> > > > > > > change.  Do we need to setup a reserved-memory node like
> > > > > > > imx6ul-ccimx6ulsom.dtsi did?
> > > > > >
> > > > > > I don't think so.
> > > > > >
> > > > > > Were you able to identify what was the exact commit that caused such regression?
> > > > >
> > > > > I was able to narrow it down the 92d12f9544b7 ("memblock: refactor
> > > > > internal allocation functions") that caused the regression with
> > > > > Etnaviv.
> > > >
> > > >
> > > > Can you please test with this change:
> > > >
> > >
> > > That appears to have fixed my issue.  I am not sure what the impact
> > > is, but is this a safe option?
> >
> > It's not really a fix, I just wanted to see how exactly 92d12f9544b7 ("memblock:
> > refactor internal allocation functions") broke your setup.
> >
> > Can you share the dts you are using and the full kernel log?
> >
> > > adam
> > >
> > > > diff --git a/mm/memblock.c b/mm/memblock.c
> > > > index 7d4f61a..1f5a0eb 100644
> > > > --- a/mm/memblock.c
> > > > +++ b/mm/memblock.c
> > > > @@ -1356,9 +1356,6 @@ static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
> > > >                 align = SMP_CACHE_BYTES;
> > > >         }
> > > >
> > > > -       if (end > memblock.current_limit)
> > > > -               end = memblock.current_limit;
> > > > -
> > > >  again:
> > > >         found = memblock_find_in_range_node(size, align, start, end, nid,
> > > >                                             flags);
> > > >
> > > > > I also noticed that if I create a reserved memory node as was done one
> > > > > imx6ul-ccimx6ulsom.dtsi the 3D seems to work again, but without it, I
> > > > > was getting errors regardless of the 'cma=256M' or not.
> > > > > I don't have a problem using the reserved memory, but I guess I am not
> > > > > sure what the amount should be.  I know for the video decoding 1080p,
> > > > > I have historically used cma=128M, but with the 3D also needing some
> > > > > memory allocation, is that enough or should I use 256M?
> > > > >
> > > > > adam
> > > >
> > > > --
> > > > Sincerely yours,
> > > > Mike.
> > > >
> >
> > --
> > Sincerely yours,
> > Mike.
> >
