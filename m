From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 19/21] treewide: add checks for the return value of
 memblock_alloc*()
Date: Wed, 16 Jan 2019 15:27:35 +0100
Message-ID: <CAMuHMdWKPj-2Let44rmaVwh-b6kkGg+0cFPQ-+3k9LP86pB7NA@mail.gmail.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
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
	List-Owner; bh=UQiIEmqAL1TfHiWg+/7GVXTwHK7/1lfa5EVVTfAonps=; b=DEE1rCZqvBj6kZ
	BgAe6dwHBJTosyemGSEK5Z/aAK0z4iexdJHOu50mpgcSU/hzxcY5Oqv42gDNlC7CI0KdX7a2BO0sG
	wxRYvKpm5kybIbE9IZPbWoFidG0QitzmmU/YhZxD90Ua0147dCCaUldBY2wtDTEKdqEU39ORfCpmj
	7U56JElVNBNnuMnUCAhReoGdTY2xVey1LNn1uStHrTaYoVpzt8NCdsjiiDSZsnGA8zkPGYBrvm33O
	NslFd4JpH2JaeHsZSrKNeoJ3eau2p48dgi9TpbxNgdvTXFZ3HpgdN+DANTqYbSrgy9zHz3AxGvGI3
	C9jvV3uWgJceg7dHiTWw==;
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
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
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, 

Hi Mike,

On Wed, Jan 16, 2019 at 2:46 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
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

In general, you want to use %zu for size_t

> size, align);
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

>  74 files changed, 415 insertions(+), 29 deletions(-)

I'm wondering if this is really an improvement?
For the normal memory allocator, the trend is to remove printing of errors
from all callers, as the core takes care of that.

> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -83,6 +83,9 @@ mk_resource_name(int pe, int port, char *str)
>
>         sprintf(tmp, "PCI %s PE %d PORT %d", str, pe, port);
>         name = memblock_alloc(strlen(tmp) + 1, SMP_CACHE_BYTES);
> +       if (!name)
> +               panic("%s: Failed to allocate %lu bytes\n", __func__,

%zu, as strlen() returns size_t.

> +                     strlen(tmp) + 1);
>         strcpy(name, tmp);
>
>         return name;
> @@ -118,6 +121,9 @@ alloc_io7(unsigned int pe)
>         }
>
>         io7 = memblock_alloc(sizeof(*io7), SMP_CACHE_BYTES);
> +       if (!io7)
> +               panic("%s: Failed to allocate %lu bytes\n", __func__,

%zu, as sizeof() returns size_t.
Probably there are more. Yes, it's hard to get them right in all callers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
