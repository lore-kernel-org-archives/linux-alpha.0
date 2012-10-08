From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Mon, 8 Oct 2012 20:59:10 +0200
Message-ID: <CAMuHMdUjqogJ5Db1wCZz4v6OEutDPbcF0a=zc=ZCJS7-8rYDqw@mail.gmail.com>
References: <20121006204736.GA1830@ds20.borg.net>
	<20121007165534.GA8024@redhat.com>
	<20121007171300.GA10942@redhat.com>
	<20121007180420.GA900@ds20.borg.net>
	<20121007191627.GA19278@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=uaNJKy+JvSsu3jsZ5EpSk9QV8Nj+NsrdsK6v92oT4Dw=;
        b=SDyU8+lD/PtRJ10c6ErFrvr8GarlMZjXKIfm6JXxH8KxjI//yyzNxmxnDcbHyHw1eS
         U5BJwJgI0xzl5Ohxz6e0UtLB8ymQcAbhBwbFX0yUTDKY9zrXSzwwq+LCtzqF/RmYJBeF
         6GBo6PUBZ14bxidhGPFD+ENH3+7/oSZ4tRuYa4Phd1wzQLynZgSKKWXg18YtxLX/Fkdz
         XNG8SJPkxfVsCuUJ3p4bRud3vCLTjsW7Snky/uMLVmrTLRqIgQMH+raNW6P8icmjqtvf
         tpk1G1vMkCZl1/Zc9WyYd5NlNr0SCUw9PQrQEsdBHngvSkfyS4W1ZsvXZ9yM4xktBYZ7
         gwKA==
In-Reply-To: <20121007191627.GA19278@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>

On Sun, Oct 7, 2012 at 9:16 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 10/07, Thorsten Kranzkowski wrote:
>> On Sun, Oct 07, 2012 at 07:13:00PM +0200, Oleg Nesterov wrote:
>> > On 10/07, Oleg Nesterov wrote:
>> > > Hmm. I know nothing about arch/alpha and I can't understand its entry.S.
>> > > But _it seems_ to me that do_notify_resume() is called with irqs disabled.
>> > > If this is true, then imho arch/alpha should be fixed.
>> > >
>> > > Before this commit task_work_run() enabled irqs, but this was the "side
>> > > effect" of spin_lock_irq/spin_unlock_irq, we should not rely on this.
>> >
>> > Could you please test the debugging patch below?
>>
>> Of course. With that patch applied the kernel (ac3d0da) boots again. The trace line
>> is printed about once a second, with values '2' and '4'.
>
> Thanks a lot Thorsten!
>
> So I'll probably send the patch which enables interrupts in
> task_work_run(). I guess this needs "if (irqs_disabled())"
> for lockdep.
>
> The question is, should I add the warning to remind that this
> arch needs a fix?

Just wondering. As this is on an SMP system, perhaps the
read_barrier_depends() vs. smp_read_barrier_depends() matters
here?
http://lkml.indiana.edu/hypermail/linux/kernel/1209.3/00555.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
