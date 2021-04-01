From: Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH] alpha/kernel/traps: Use find_vma_intersection() in traps
 for setting si_code
Date: Thu, 1 Apr 2021 13:25:25 -0700
Message-ID: <CANN689GC8jXbzFb_HL-vpoBxuD4-By029=PMsi4Vs9ufik4RhQ@mail.gmail.com>
References: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9pPnGfDemhcam0jMg7ahtrXvDDeJXDuIzJjdn/CBqY=;
        b=Tp8Ke9BKCULw6yltQvnYkmv2QThjBCXVafzs+Ia/6Q7krHR99BCm3bYyic2o5YkFbr
         3gfeB9enL3wwTt5B4J9fhsXdX8nfTvZGH241U4QQP53Hg6K4hbIYltcy1mTpFRkMmuJD
         7ELOAE5nxnxE1SLwr7zP5G1tTZVjYr0ZqmJtz4gkecRkxoFvJ6dmyh7l5L5gc7AHFt9n
         ShDDLDBN+DUpzgVgN9NSPmt1l291rdHgEY3lp/PqTsPuAHQGy0tlQs5PYZ+BtUYmlJFC
         sZea3AoEklBUGQ+0G+Ttag4mGF/k5xDmMmgM7X9T4zBMbaDc/o0XhC2ax3pjgFi9uLuY
         Zz8w==
In-Reply-To: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Howlett <liam.howlett@oracle.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>

You are correct that find_vma is insufficient for what's intended
here, and that find_vma_intersection fixes it.

I'll let the arch maintainers speak of what the consequences of the
changed si_code would be - the bug has been here so long, that I would
worry some userspace might have come to depend on it (the old "common
law feature" issue).
 Just a concern I have, with 0 evidence behind it, so I hope it turns
out not to be an actual issue.

Acked-by: Michel Lespinasse <walken@google.com>

On Thu, Apr 1, 2021 at 12:51 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> find_vma() will continue to search upwards until the end of the virtual
> memory space.  This means the si_code would almost never be set to
> SEGV_MAPERR even when the address falls outside of any VMA.
>
> Using find_vma_intersection() allows for what is intended by only
> returning a VMA if it falls within the range provided, in this case a
> window of 1.
>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> ---
>  arch/alpha/kernel/traps.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 921d4b6e4d95..7f51386c06d0 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -957,8 +957,10 @@ do_entUnaUser(void __user * va, unsigned long opcode,
>                 si_code = SEGV_ACCERR;
>         else {
>                 struct mm_struct *mm = current->mm;
> +               unsigned long addr = (unsigned long)va;
> +
>                 mmap_read_lock(mm);
> -               if (find_vma(mm, (unsigned long)va))
> +               if (find_vma_intersection(mm, addr, addr + 1))
>                         si_code = SEGV_ACCERR;
>                 else
>                         si_code = SEGV_MAPERR;
> --
> 2.30.0



-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
