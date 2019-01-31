From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the return value of
 memblock_alloc*()
Date: Thu, 31 Jan 2019 07:23:02 -0800
Message-ID: <CAMo8BfKhjwimXrGCcPjmS0+w8o6yW=ohG-hZ7caWnGpPSF6qJA@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nq/u+rThu/fE1INRmgavSkne7/kWQHU+Ws3mMyljG7s=; b=CypoCM2zifHSDr
	jp2z2i/f4NR3Fa5bPUC3dZbal5BE108U/YsgJt42dXdZxre3FTTzr67TtpYY8doazez/aJjcHQoaY
	Gby4xBEa5UysMM4MRJCVVEC38RupbF8ZO65P7prWnLFhVHoZUFZ3aStLOIjEW2Mrk1psWBxaPHuJl
	ncx9F6WdOXjoqFyVbuUc4zhiR2HmZyL/mnl4GYnt77UcEapcwQPPse5syxoQPlYPCGld7Wvn1yk1A
	j9ajyD/62MUiF51LJ1MOabezn/KkDRHxnnnw718s4kDjrrj9XQooWk2Cz3d+TD4p0Qc4pvtO5AmXB
	Xesad7OGtMja9Vtg7ojg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FEGsjMX0dp8RIKABY7YbpDek7VAiBMQ5lvDJ9kXcOns=;
 b=ZsyLjm/2i8qflJj65Hki7ZjvX/p5TsVDbFLDy7tSrA+zq8/rmQhKZ5yU4Bl9kcqNBG
 CY9HOGBpR1srhF7u4H9mYJcYyDuPjhrBD47VmrCaaN1SX2ExDlH0GQYz6bDNKGIeER/N
 DF6b1r3SOqJa9XC74nY0HVQaA3twQDl0/0usSyHts9dncP4v3Vg8voOJ8+jyAG7v0bUA
 B6+B6kriQluxGxRJeHVpFuS3YlZmyHiGWyoenK6JbziwuNQ+Alt9qkijGVE2SEtb3tDq
 9pqtKFQFBYtBJG7fxZ1NDZFxq1qNSGZFFtsmGMF43OGLzTtwPolkWURu5aoBZtbx+lxK
 2bIQ==
In-Reply-To: <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
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
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, m

On Mon, Jan 21, 2019 at 12:06 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Add check for the return value of memblock_alloc*() functions and call
> panic() in case of error.
> The panic message repeats the one used by panicing memblock allocators with
> adjustment of parameters to include only relevant ones.
>
> The replacement was mostly automated with semantic patches like the one
> below with manual massaging of format strings.
>
> @@
> expression ptr, size, align;
> @@
> ptr = memblock_alloc(size, align);
> + if (!ptr)
> +       panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
> size, align);
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reviewed-by: Guo Ren <ren_guo@c-sky.com>             # c-sky
> Acked-by: Paul Burton <paul.burton@mips.com>         # MIPS
> Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com> # s390
> Reviewed-by: Juergen Gross <jgross@suse.com>         # Xen
> ---
>  arch/xtensa/mm/kasan_init.c               |  4 ++++
>  arch/xtensa/mm/mmu.c                      |  3 +++

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
