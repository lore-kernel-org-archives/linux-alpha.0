From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 01/14] alpha: invoke oom-killer from page fault
Date: Tue, 27 Apr 2010 22:58:28 -0400
Message-ID: <i2ob4198de61004271958xdb1f45e3o30f0e451bd192ea4@mail.gmail.com>
References: <20100422160613.723698029@suse.de>
	 <20100422161222.762354051@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2LBKUpMARko/JObKSXqWlIDR7H5Lit9K4/qjP0rZXnY=;
        b=hsk6evPZZMX9CisPf7YnYZRpCLohqKnVWVosg4kZ/WANmM0M2vW9e8uvS0h955j5Ku
         V7mk8pT1eW4wGPMK//J6rU6zidIDIpg+TinEWHIW0luJWWYQzfP75aMGsbJiRICb2tn+
         HfobrHzhYMqaTFJlGJwB9XNMO8KozXmPtTCr0=
In-Reply-To: <20100422161222.762354051@suse.de>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: npiggin@suse.de
Cc: linux-arch@vger.kernel.org, David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Thu, Apr 22, 2010 at 12:06 PM,  <npiggin@suse.de> wrote:
> As explained in commit 1c0fe6e3bd, we want to call the architecture i=
ndependent
> oom killer when getting an unexplained OOM from handle_mm_fault, rath=
er than
> simply killing current.
>
> Cc: linux-alpha@vger.kernel.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: linux-arch@vger.kernel.org
> Signed-off-by: Nick Piggin <npiggin@suse.de>
> ---
> Index: linux-2.6/arch/alpha/mm/fault.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/arch/alpha/mm/fault.c
> +++ linux-2.6/arch/alpha/mm/fault.c
> @@ -188,16 +188,10 @@ do_page_fault(unsigned long address, uns
> =A0 =A0 =A0 =A0/* We ran out of memory, or some other thing happened =
to us that
> =A0 =A0 =A0 =A0 =A0 made us unable to handle the page fault gracefull=
y. =A0*/
> =A0out_of_memory:
> - =A0 =A0 =A0 if (is_global_init(current)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 yield();
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 down_read(&mm->mmap_sem);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto survive;
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 printk(KERN_ALERT "VM: killing process %s(%d)\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0current->comm, task_pid_nr(current));
> =A0 =A0 =A0 =A0if (!user_mode(regs))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto no_context;
> - =A0 =A0 =A0 do_group_exit(SIGKILL);
> + =A0 =A0 =A0 pagefault_out_of_memory();
> + =A0 =A0 =A0 return;
>
> =A0do_sigbus:
> =A0 =A0 =A0 =A0/* Send a sigbus, regardless of whether we were in ker=
nel
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Thanks, added to my tree.

Matt
