From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 20:11:32 +0200
Message-ID: <CAMuHMdUBWqdyS4w7EKsnvQLXJVgQh624AQsjgQvxT9FRW4s_6g@mail.gmail.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
	<20160428164856.10120.qmail@ns.horizon.com>
	<CAMuHMdU2e2PdwKYVaEsJ73X8Di1XHNPqnxuunr8R8bN8udazxw@mail.gmail.com>
	<20160428175843.GZ21636@brightrain.aerifal.cx>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=aQDScg3gUCk/Fwdsf7l8Mx4U6pRj2Jt6KhME608opWg=;
        b=ax6Oun+4EBon+SGU80Cf2shjvILFkpeyeQZcErrMo9kQ19GqohMRkJ0bkJ7x2M5QnH
         Drm35hlifQ9AU3yY0mqCO+PmuA6Kv84tqgEnf/kMMXy1s5uGPChlM1WTyliwJToN3/kW
         her9dZzopxykctwkl9FTh2B292V5ORm6LygkEwFUSGNInwhz0I+j64nMnsuMuEMGKPJN
         YFT6rvnyFKWkUu2aXn5ayfbKYcK0pQaCXcy5oMrl97vjCb7zwuxq64yW3HP7oAUeuX7G
         3u368mdOs0vqSLOE8ZhyfoFq/ynxXhRgtyLshQfXSoi9Q/5pl9dRdaxvG7UE349oy08s
         Z/Wg==
In-Reply-To: <20160428175843.GZ21636@brightrain.aerifal.cx>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Felker <dalias@libc.org>
Cc: George Spelvin <linux@horizon.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, zengzhaoxiu@163.com, "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, James Hogan <james.hogan@imgtec.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Jonas Bonn <jonas@southpole.se>, Lennox Wu <lennox.wu@gmail.com>, Ley Foon Tan <lftan@altera.com>, alpha <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell

On Thu, Apr 28, 2016 at 7:58 PM, Rich Felker <dalias@libc.org> wrote:
> On Thu, Apr 28, 2016 at 07:51:06PM +0200, Geert Uytterhoeven wrote:
>> On Thu, Apr 28, 2016 at 6:48 PM, George Spelvin <linux@horizon.com> wrote:
>> > Another few comments:
>> >
>> > 1. Would ARCH_HAS_FAST_FFS involve fewer changes than CPU_NO_EFFICIENT_FFS?
>>
>> No, as you want to _disable_ ARCH_HAS_FAST_FFS / _enable_
>> CPU_NO_EFFICIENT_FFS as soon as you're enabling support for a
>> CPU that doesn't support it.
>>
>> Logical OR is easier in both the Kconfig and C preprocessor languages
>> than logical NAND.
>>
>> E.g. in Kconfig, a CPU core not supporting it can just select
>> CPU_NO_EFFICIENT_FFS.
>
> How does a CPU lack an efficient ffs/ctz anyway? There are all sorts
> of ways to implement it without a native insn, some of which are
> almost or just as fast as the native insn on cpus that have the
> latter. On anything with a fast multiply, the de Bruijn sequence
> approach is near-optimal, and otherwise one of the binary-search type
> approaches (possibly branchless) can be used. If the compiler doesn't
> generate an appropriate one for __builtin_ctz, that's arguably a
> compiler bug.

m68k-linux-gcc 4.6.3 generates:

        jsr __ctzsi2

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
