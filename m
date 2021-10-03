From: Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [PATCH v4 07/11] mm: kasan: Use is_kernel() helper
Date: Sun, 3 Oct 2021 19:19:12 +0200
Message-ID: <CA+fCnZd6=sXgb-782KkijqJ7zgBj38oXLeLbi4HoUhm3MY4J8g@mail.gmail.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com> <20210930071143.63410-8-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Return-path: <bpf-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LtNAm7zzl2qrgZZh/QTIxNxuRAfc7I+2wFFQB9vnTF0=;
        b=HPajL2gRll5UGOWQudiLfEhv04bZJLEY04ZU7ZSRAIC019LPw99IB3jcVbN4EN+uaa
         xyKMFFwUWxMYSoP4ZBJywqtND/RYthdauADK8DHtR06cFEMk7vPzapNi8yp+/BQqu9DS
         XOr3DnKVtkoe0wPl/79bKfHiDibk91+zdv0sLCel9UFYLCb9bmD47OsCKSwE0mGDtw8/
         6gdgpENhRKndxirmzsgGPXX1upChcdibaOTNC3bq+DmwPpNVd9cFYYXmPAmiOvESIXbo
         CSbSXebOc4mMaPqb0Px805lEkzhdOgcnojNc1+KreKV66iyssiTwe6WqQz88OHS1mJw/
         GXiw==
In-Reply-To: <20210930071143.63410-8-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, mingo@redhat.com, David Miller <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf <bpf@vger.kernel.org>, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>

On Thu, Sep 30, 2021 at 9:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Directly use is_kernel() helper in kernel_or_module_addr().
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 3239fd8f8747..1c955e1c98d5 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -226,7 +226,7 @@ static void describe_object(struct kmem_cache *cache, void *object,
>
>  static inline bool kernel_or_module_addr(const void *addr)
>  {
> -       if (addr >= (void *)_stext && addr < (void *)_end)
> +       if (is_kernel((unsigned long)addr))
>                 return true;
>         if (is_module_address((unsigned long)addr))
>                 return true;
> --
> 2.26.2
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
