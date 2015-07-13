From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [3/3] IRQ: Print "unexpected IRQ" messages consistently across architectures
Date: Mon, 13 Jul 2015 13:35:09 -0500
Message-ID: <CAErSpo52Kk0c=1UHQzxntJc3ph_CX8vcY+QdULBKv-HGUHBK9Q@mail.gmail.com>
References: <20150712220211.7166.42035.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20150713032303.D49801402B1@ozlabs.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=mNz0sbM31F25o3BT2ZvjVjjSJUkp6GLmqTPCWr+eQYA=;
        b=YyDVY5iB7mP61wgPFSvY3RWVrzHI9XjPgw+1egLn2Lo5sT4D4cLVgYZ8DYiyhR+6aw
         H8crkJ+dm9On4DkeiNCJk6GTUuGoM6K/jaKI+yA1Gv/p4i9Aju2OZpxKlOjBgUXqUl3F
         IYpU9DpjKR3HjYpDgJsa9MRgjZnM9iLSMtgSCS7MWftdkIgGl526wRe9XxaqbpN342Ef
         HEpwVy7oAcbNYkufsJiTZ6HxD8CkYv/+XF+U63TL9ZU14Y+bkaAYCYxbs60P7gb2zbUS
         Z8zTbh0qZ+o0lmdvSTAhmF6hFanpRLSAU0VkmLMlh64LmTdPi/a5HRNopmNuhOVJu9jv
         mEZg==
In-Reply-To: <20150713032303.D49801402B1@ozlabs.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, linux-am33-list@redhat.com, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, "x86@kernel.org" <x86@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Sun, Jul 12, 2015 at 10:23 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Sun, 2015-12-07 at 22:02:11 UTC, Bjorn Helgaas wrote:
>> Many architectures use a variant of "unexpected IRQ trap at vector %x" to
>> log unexpected IRQs.  This is confusing because (a) it prints the Linux IRQ
>> number, but "vector" more often refers to a CPU vector number, and (b) it
>> prints the IRQ number in hex with no base indication, while Linux IRQ
>> numbers are usually printed in decimal.
>>
>> Print the same text ("unexpected IRQ %d") across all architectures.
>>
>> No functional change other than the output text.
>
> There's already a fallback version in asm-generic, so shouldn't you instead
> just delete all the versions that are identical to that?
>
> eg. on powerpc we have:
>
>>  static inline void ack_bad_irq(unsigned int irq)
>>  {
>> -     printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
>> +     printk(KERN_CRIT "unexpected IRQ %d\n", irq);
>>  }
>
> And the generic version is:
>
>>  #ifndef ack_bad_irq
>>  static inline void ack_bad_irq(unsigned int irq)
>>  {
>> -     printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
>> +     printk(KERN_CRIT "unexpected IRQ %d\n", irq);
>>  }
>>  #endif
>
> So we can just delete the powerpc version?

Wow, I really didn't do my homework here.  Not only is there a generic
version already, but there's also print_irq_desc(), which prints way
more information than any of the ack_bad_irq() implementations.

I'll try again :)

Bjorn
