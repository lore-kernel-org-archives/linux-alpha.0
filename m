From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT 02/13] alpha: Constify ioreadX() iomem argument (as in
 generic implementation)
Date: Wed, 8 Jan 2020 10:07:32 +0100
Message-ID: <20200108090732.GA10145@pi3>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-3-git-send-email-krzk@kernel.org>
 <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaMSGQVMylMxugpvPmeYTFZghEBSjPNh3u2svKC3Yeo=; b=rmbuUGbS/iBmlu
	wEV2rSRuhnlzizQ3tUm8rO0S7cqs7Pp57HEH2IoZFXfB7RlnCxtsshI/0CM7aaRoFCqr4M5sLnc15
	1mfwqHfufoyM6K5qDXg1s8uQO3gvEydme7nHSm6kHnAS+ZeRq6S+psrCUlRnkW8+hTpwOj3Ca1kQO
	Ae99sKXQYrPTpaoZiMv8kSbPgwqeH8JtZsY5fYvADYnWOiQnPtNXbW8RRUjMpGK/dTIyqNpSCW6RC
	hOb37fl2kP9pjXnFVDzCSJBDvs12//Ilre4e+YuYhE138UUL3VDX5u30lU5STi/lpRB6H3VXAzwE1
	R9roHBZOVqkVcfOLXn6Q==;
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
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

On Wed, Jan 08, 2020 at 09:10:06AM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > The ioreadX() helpers have inconsistent interface.  On some architectures
> > void *__iomem address argument is a pointer to const, on some not.
> >
> > Implementations of ioreadX() do not modify the memory under the address
> > so they can be converted to a "const" version for const-safety and
> > consistency among architectures.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> > --- a/arch/alpha/include/asm/io.h
> > +++ b/arch/alpha/include/asm/io.h
> > @@ -151,9 +151,9 @@ static inline void generic_##NAME(TYPE b, QUAL void __iomem *addr)  \
> >         alpha_mv.mv_##NAME(b, addr);                                    \
> >  }
> >
> > -REMAP1(unsigned int, ioread8, /**/)
> > -REMAP1(unsigned int, ioread16, /**/)
> > -REMAP1(unsigned int, ioread32, /**/)
> > +REMAP1(unsigned int, ioread8, const)
> > +REMAP1(unsigned int, ioread16, const)
> > +REMAP1(unsigned int, ioread32, const)
> 
> If these would become "const volatile", there would no longer be a need
> for the last parameter of the REMAP1() macro.
> 
> >  REMAP1(u8, readb, const volatile)
> >  REMAP1(u16, readw, const volatile)
> >  REMAP1(u32, readl, const volatile)
> 
> Same for REMAP2() macro below, for iowrite*().

Good point, thanks!

Best regards,
Krzysztof
