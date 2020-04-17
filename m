From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 00/11] Make PageWriteback use the PageLocked
 optimisation
Date: Fri, 17 Apr 2020 04:12:33 -0700
Message-ID: <20200417111233.GL5820@bombadil.infradead.org>
References: <20200416220130.13343-1-willy@infradead.org>
 <CAMuHMdWxhVoPCZ5+=Pf1LFpdE9vPv9GGTqTYMQP9oFz7eCxDaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8sFIV+/8fWUY1Zbo7nie6mENpkyN/bnZv7/UFlj2FCU=; b=C/Z9a88LlnGCozziEPuVbatdy
	jvCSNxmUmkeQci7evoAK3SOlgaFfNkJiqaH2PADh7chTv25L9RAgyJHx+/qidDV4AVKpUJU3OBznO
	3MeAjzCXG2+JYaNwvi7CXgj49rIPHDh1Rdqwcij6xMBB74Tchu5iftXdPrEL9kxZXc5JM/sfFHghb
	nTQlDiP5Z6/gRNVuJ55BeuXHh7PDJIIpsfELE+M6Ql/niURTDqqYD01SjiCiZ262e/s0OC8naAFZj
	rfzd3vDEo2frvluIMsECVcnoTJsd2nOzLJhid8d6GWmsvHPK5qN13ddqppVJ7ViyC4wUM0T0ZMuBb
	hTFoNQy6g==;
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxhVoPCZ5+=Pf1LFpdE9vPv9GGTqTYMQP9oFz7eCxDaQ@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-s390 <linux-s390@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, alpha <linux-alpha@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-riscv@lists.infradead.org

On Fri, Apr 17, 2020 at 09:28:14AM +0200, Geert Uytterhoeven wrote:
> On Fri, Apr 17, 2020 at 12:01 AM Matthew Wilcox <willy@infradead.org> wrote:
> > v3:
> >  - Added implementations of clear_bit_unlock_is_negative_byte()
> >    to architectures which need it
> 
> I have two questions here?
>   1. Why not implement arch_clear_bit_unlock_is_negative_byte()
>      instead, so the kasan check in asm-generic is used everywhere?

That would be a larger change.  As I understand it (and I may misunderstand
it), I would need to rename all the clear_bit(), __clear_bit(), change_bit(),
... functions to have an 'arch_' prefix and then include instrumented-lock.h

>   2. Why not add the default implementation to
>      include/asm-generic/bitops/instrumented-lock.h, in case an arch_*()
>      variant is not provided yet?
> 
> Note that you did 1 for s390.

Well, s390 already uses instrumented-lock.h so I followed along with
what they're doing.  I don't think instrumented-lock.h is used at all on
these other architectures, but the whole bitops header files are such a
mess that I could easily have built a completely wrong mental model of
what's going on.

