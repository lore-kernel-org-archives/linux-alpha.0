From: Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH v4 07/11] mm: kasan: Use is_kernel() helper
Date: Thu, 30 Sep 2021 17:45:35 +0200
Message-ID: <CAG_fn=XD+nVgVRgj7KFsPWSuia+gZzpA3KAdqucjKodOvxSF6w@mail.gmail.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com> <20210930071143.63410-8-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8d6xo5L9QevHc/0Sduv9NQkae1fLgboqRLN/cOlHL94=;
        b=iR/rfVgiWHq5rw4NLK5OT9v5lYhcLGBGwNqvqBTHa8uM0K3LSI6Qds40sZdhqy343D
         nKF1AalapkTkhy/ypRBVypdug7o8/xaqtmHaWv9UPFEGjb1UhHpm/4rTjAiBbtASwfKx
         3JH/kVbQPqPEjk5/0bNv7k1/Y2BIonRHJ0vWOSQM3zvPY70Uxrv2rSgTrqGgUv6GDu7E
         chrKKhinXiSRYk/xsds2GtV3wz6HxpGI4jq2FDoKpBIlG6t+6bi34LoQK0m5uh10NjJQ
         5mDPrpUbvxQNLMegc4nJJFYKUu1kf5g3ZYgnxHtFO6ahoMuizo6fqj2+osS40oUSZmZK
         mhMw==
In-Reply-To: <20210930071143.63410-8-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, David Miller <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>

On Thu, Sep 30, 2021 at 9:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wr=
ote:
>
> Directly use is_kernel() helper in kernel_or_module_addr().
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 3239fd8f8747..1c955e1c98d5 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -226,7 +226,7 @@ static void describe_object(struct kmem_cache *cache,=
 void *object,
>
>  static inline bool kernel_or_module_addr(const void *addr)
>  {
> -       if (addr >=3D (void *)_stext && addr < (void *)_end)
> +       if (is_kernel((unsigned long)addr))
>                 return true;
>         if (is_module_address((unsigned long)addr))
>                 return true;
> --
> 2.26.2
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
