From: Rich Felker <dalias@libc.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 27 Mar 2018 20:00:25 -0400
Message-ID: <20180328000025.GM1436@brightrain.aerifal.cx>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
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
	List-Owner; bh=hLgVbEqPsYGuzov6I4gqqTQaVyNH65wk99KvSBMlrA8=; b=AkrtgCMY2ScLjB
	xDn4RNYEGFLXKQLSQGk4Jxf/bbYelCjMUGfzA+VwlRODJHB/BXBNW77wD65/qrCQzQhcjlfCpK6vN
	i52JYm74AlxTLLVyNh9fvmq7Bw3gBN5JPBJXfFuXOqy2sBLfvYcFI6UcLJ4uCM8Br4SVaCHadDH+/
	s7rubFKMdeB5q3n07+oQS7CRt8n/+NVe7pcvgQUTI8jGUrcz05zNt4kBUy1GhbdRbRl2Qrt5w5bAL
	d5ZNkAb8S6VJ3qzt3LTnIBDBBBqGFvud8dHtGNJpkmrppl/+64uUcPeD34mnWgJyeFOemzf6ExxAv
	X8RI21OMHLAyUmraoFsw==;
Content-Disposition: inline
In-Reply-To: <20180327234904.GA27734@bombadil.infradead.org>
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
To: Matthew Wilcox <willy@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Jan Kara <jack@suse.cz>, linux-sh <linux-sh@vger.kernel.org>, Ilya Smith <blackzert@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, linux-ia64@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <li>

On Tue, Mar 27, 2018 at 04:49:04PM -0700, Matthew Wilcox wrote:
> On Tue, Mar 27, 2018 at 03:53:53PM -0700, Kees Cook wrote:
> > I agree: pushing this off to libc leaves a lot of things unprotected.
> > I think this should live in the kernel. The question I have is about
> > making it maintainable/readable/etc.
> > 
> > The state-of-the-art for ASLR is moving to finer granularity (over
> > just base-address offset), so I'd really like to see this supported in
> > the kernel. We'll be getting there for other things in the future, and
> > I'd like to have a working production example for researchers to
> > study, etc.
> 
> One thing we need is to limit the fragmentation of this approach.
> Even on 64-bit systems, we can easily get into a situation where there isn't
> space to map a contiguous terabyte.

The default limit of only 65536 VMAs will also quickly come into play
if consecutive anon mmaps don't get merged. Of course this can be
raised, but it has significant resource and performance (fork) costs.

Rich
