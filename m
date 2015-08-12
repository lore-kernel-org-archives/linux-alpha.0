From: Catalin Marinas <catalin.marinas@gmail.com>
Subject: Re: [PATCH 31/31] dma-mapping-common: skip kmemleak checks for
 page-less SG entries
Date: Wed, 12 Aug 2015 17:26:44 +0100
Message-ID: <CAHkRjk6ykXd1=DLZ16dKiyrBXWmd80WC4gLyoN50JYigJG_-bQ@mail.gmail.com>
References: <1439363150-8661-1-git-send-email-hch@lst.de> <1439363150-8661-32-git-send-email-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=DAf5Wyqqr9wwC0032B3Xti7JQwnG50zAYorCgiezCxw=;
        b=fNqq66vzlXamCOKbyVLQiwBw46TDsIRz5zEHhCmCiHoivGOxZS8ZZ5v3yZ04RvCsNR
         CqkMM+BdkUgxgHwOKr2kBzGBic+TmJPByaXUShQLQLUcRJbrG3KPGAJ2Zdjof5CVZOuu
         MOkxl2JYXUJgvsJ9cg18W484ZrD8Jg/l0L5FHO4l59qee47HepbciemnmPsmuGD+sdmP
         knf8Df9Jo9UlypjCbi001sJsmVxoauaQCMQzSiZhmn06Xd3TlJO3uSSp8KTA0bBAeeef
         v8tSjwGpwm6uOgrc773vPBV6VesDObra9T/k/gnkbDW2ya/b1bS8Qb4oH8dbPXCJiD3b
         cNig==
In-Reply-To: <1439363150-8661-32-git-send-email-hch@lst.de>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, axboe@kernel.dk, Dan Williams <dan.j.williams@intel.com>, vgupta@synopsys.com, hskinnemoen@gmail.com, egtvedt@samfundet.no, realmz6@gmail.com, David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>, "x86@kernel.org" <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>, alex.williamson@redhat.com, grundler@parisc-linux.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-nvdimm@ml01.01.org, Linux

Christoph,

On 12 August 2015 at 08:05, Christoph Hellwig <hch@lst.de> wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/asm-generic/dma-mapping-common.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/dma-mapping-common.h b/include/asm-generic/dma-mapping-common.h
> index 940d5ec..afc3eaf 100644
> --- a/include/asm-generic/dma-mapping-common.h
> +++ b/include/asm-generic/dma-mapping-common.h
> @@ -51,8 +51,10 @@ static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>         int i, ents;
>         struct scatterlist *s;
>
> -       for_each_sg(sg, s, nents, i)
> -               kmemcheck_mark_initialized(sg_virt(s), s->length);
> +       for_each_sg(sg, s, nents, i) {
> +               if (sg_has_page(s))
> +                       kmemcheck_mark_initialized(sg_virt(s), s->length);
> +       }

Just a nitpick for the subject, it should say "kmemcheck" rather than
"kmemleak" (different features ;)).

-- 
Catalin
