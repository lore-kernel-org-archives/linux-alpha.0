From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Date: Wed, 8 Jan 2020 09:15:50 +0100
Message-ID: <CAJKOXPffZDPz6nAf8fGc-k76KiNWc2KXKJxkWuWjeDtEm1tTHA@mail.gmail.com>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
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
	List-Owner; bh=Bcb0Pw16igSi49IR3MkAM5s7VAyAG+1FyRSn/L5lsXk=; b=LNgeu3Re3JUuAL
	o4sZIg2JekWikybB+hcuKHCPm2Cp0WUn7dGGa1cJMxxBGd0umcWaTYQOrVGYEdbjJvwKePyX8Uc79
	9wVtYHhoEjOAS4jo1mBm8MBPKyeWgkrZMabYMRwqdOg83QUUvEPaPRWM3j7RrUmwwOMGeusSU+wKF
	DVpyvu68+3FxICo128drMwrxBAVIxtzmhy6CCrjpe5YBOh44q8wfg3YFXlzuaMhFvCRQXv/ZV4vcZ
	LwLTRzI6ycZovBrGcUFiPAssT9I187sMkQQxo/QCTily4NLRMggaMSpTn6/VbbFGjrjKaideuFYu5
	cKxbg4/9/Lj3vwV8fo2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578471367;
 bh=rJ6JYIGpzKdoDYXHO08q9UAkcS9JLwVuqyxgj7z6uFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MkwH+3HkDf6s4f9UKMt0j3Yl68sYcovyitDwcZpCHeRNjfXvyP43W0pQEzIL5IC+w
 aBar8tImI2nbpit8mmPjPSR8+0RwgOJ9/SVVIDrK7xO2Eu6wG+pemFk9N++KW5kzE4
 p5mT60k4jBuix/ZvOoWmnjiIgd4PWx8KCVGOrzro=
In-Reply-To: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jason Wang <jasowang@redhat.com>, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.in>

On Wed, 8 Jan 2020 at 09:08, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > The ioread8/16/32() and others have inconsistent interface among the
> > architectures: some taking address as const, some not.
> >
> > It seems there is nothing really stopping all of them to take
> > pointer to const.
>
> Shouldn't all of them take const volatile __iomem pointers?
> It seems the "volatile" is missing from all but the implementations in
> include/asm-generic/io.h.

It's kind of separate issue although I could squash it to limit
redundant changes.

> > Patchset was really tested on all affected architectures.

I just spot an error in my first message. I wanted to say:
"Patchset was NOT really tested on all affected architectures."

Obviously.


> > Build testing is in progress - I hope auto-builders will point any issues.
> >
> >
> > Todo
> > ====
> > Convert also string versions (ioread16_rep() etc) if this aproach looks OK.
> >
> >
> > Merging
> > =======
> > The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
> > via one tree, or even squashed into one.
>
> Yes, they should be squashed, cfr. Arnd's comment.
> I also wouldn't bother doing the updates in patches 6-10.

Indeed, thanks for comments.

Best regards,
Krzysztof
