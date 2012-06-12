From: Kautuk Consul <consul.kautuk@gmail.com>
Subject: Re: [PATCH 02/19 v2] alpha/mm/fault.c: Port OOM changes to do_page_fault
Date: Tue, 12 Jun 2012 21:28:38 +0530
Message-ID: <CAFPAmTSeV5QaHL4eJZA6ZZBENC1KNunSGv66CrXCjXaQj-hRkg@mail.gmail.com>
References: <1333195166-4978-1-git-send-email-consul.kautuk@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=IA0C6XH3eDSa75wXd77hkcKUY9DhgCzLkaTEu1QK8d8=;
        b=B4NviHtioeYkJqmFlMhaD1d3x/9EOaB8XBsk0Mws75bCNEBf95rYj5aq7uEAcOazoP
         APvxMcIu8QV1/vt/y/DDHwXBZzZXrIFYx4xlgVixRi3TC7gl59Yxir8cmGiyInu1OPo4
         eqwUtS7cMkJEIgPB/0ntxqrtGLq0uBNXGi8KnP2e0BSGBoUE4kAnmTIrLdeAIue2V+sc
         ncAv82RnxkpULz7pW160mJ2Ob29pTjHXJ/ZtYY2gTGJA55RrplDUu3Kzq8NO1Uuulp5i
         4AM8EMuNQu1I4iG/tuTqAoOpzAbg0xb8BRQLDymENXO0rvUi53wqhbj8jaysWxclvM9C
         IbQQ==
In-Reply-To: <1333195166-4978-1-git-send-email-consul.kautuk@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, "Mohd. Faris" <mohdfarisq2010@gmail.com>

Hi,

When can I see this in linux-next ?

Thanks,
Kautuk.

On Sat, Mar 31, 2012 at 5:29 PM, Kautuk Consul <consul.kautuk@gmail.com=
> wrote:
> Commit d065bd810b6deb67d4897a14bfe21f8eb526ba99
> (mm: retry page fault when blocking on disk transfer) and
> commit 37b23e0525d393d48a7d59f870b3bc061a30ccdb
> (x86,mm: make pagefault killable)
>
> The above commits introduced changes into the x86 pagefault handler
> for making the page fault handler retryable as well as killable.
>
> These changes reduce the mmap_sem hold time, which is crucial
> during OOM killer invocation.
>
> Port these changes to ALPHA.
>
> Signed-off-by: Mohd. Faris <mohdfarisq2010@gmail.com>
> Signed-off-by: Kautuk Consul <consul.kautuk@gmail.com>
> Acked-by: Matt Turner <mattst88@gmail.com>
> ---
> =A0arch/alpha/mm/fault.c | =A0 36 ++++++++++++++++++++++++++++++-----=
-
> =A01 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
> index 5eecab1..0c4132d 100644
> --- a/arch/alpha/mm/fault.c
> +++ b/arch/alpha/mm/fault.c
> @@ -89,6 +89,8 @@ do_page_fault(unsigned long address, unsigned long =
mmcsr,
> =A0 =A0 =A0 =A0const struct exception_table_entry *fixup;
> =A0 =A0 =A0 =A0int fault, si_code =3D SEGV_MAPERR;
> =A0 =A0 =A0 =A0siginfo_t info;
> + =A0 =A0 =A0 unsigned int flags =3D (FAULT_FLAG_ALLOW_RETRY | FAULT_=
=46LAG_KILLABLE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (cause > 0 =
? FAULT_FLAG_WRITE : 0));
>
> =A0 =A0 =A0 =A0/* As of EV6, a load into $31/$f31 is a prefetch, and =
never faults
> =A0 =A0 =A0 =A0 =A0 (or is suppressed by the PALcode). =A0Support tha=
t for older CPUs
> @@ -114,6 +116,7 @@ do_page_fault(unsigned long address, unsigned lon=
g mmcsr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto vmalloc_fault;
> =A0#endif
>
> +retry:
> =A0 =A0 =A0 =A0down_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0vma =3D find_vma(mm, address);
> =A0 =A0 =A0 =A0if (!vma)
> @@ -144,8 +147,11 @@ do_page_fault(unsigned long address, unsigned lo=
ng mmcsr,
> =A0 =A0 =A0 =A0/* If for any reason at all we couldn't handle the fau=
lt,
> =A0 =A0 =A0 =A0 =A0 make sure we exit gracefully rather than endlessl=
y redo
> =A0 =A0 =A0 =A0 =A0 the fault. =A0*/
> - =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address, cause > 0 ?=
 FAULT_FLAG_WRITE : 0);
> - =A0 =A0 =A0 up_read(&mm->mmap_sem);
> + =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address, flags);
> +
> + =A0 =A0 =A0 if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(cu=
rrent))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> =A0 =A0 =A0 =A0if (unlikely(fault & VM_FAULT_ERROR)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (fault & VM_FAULT_OOM)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out_of_memory;
> @@ -153,10 +159,26 @@ do_page_fault(unsigned long address, unsigned l=
ong mmcsr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto do_sigbus;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> +
> + =A0 =A0 =A0 if (flags & FAULT_FLAG_ALLOW_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags &=3D ~FAULT_FLAG_=
ALLOW_RETRY;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* No need to up_rea=
d(&mm->mmap_sem) as we would
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* have already relea=
sed it in __lock_page_or_retry
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* in mm/filemap.c.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto retry;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 up_read(&mm->mmap_sem);
> +
> =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0/* Something tried to access memory that isn't in our =
memory map.
> @@ -186,12 +208,14 @@ do_page_fault(unsigned long address, unsigned l=
ong mmcsr,
> =A0 =A0 =A0 =A0/* We ran out of memory, or some other thing happened =
to us that
> =A0 =A0 =A0 =A0 =A0 made us unable to handle the page fault gracefull=
y. =A0*/
> =A0out_of_memory:
> + =A0 =A0 =A0 up_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0if (!user_mode(regs))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto no_context;
> =A0 =A0 =A0 =A0pagefault_out_of_memory();
> =A0 =A0 =A0 =A0return;
>
> =A0do_sigbus:
> + =A0 =A0 =A0 up_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0/* Send a sigbus, regardless of whether we were in ker=
nel
> =A0 =A0 =A0 =A0 =A0 or user mode. =A0*/
> =A0 =A0 =A0 =A0info.si_signo =3D SIGBUS;
> --
> 1.7.5.4
>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
