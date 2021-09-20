From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Mon, 20 Sep 2021 20:25:54 +0200 (CEST)
Message-ID: <202109201825.18KIPsV4026066@valdese.nms.ulrich-teichert.org>
References: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

Hi,

[sorry for the late answer, I was sick yesterday with digestive
system trouble, but nothing serious, just painful....]
> On Sat, Sep 18, 2021 at 1:26 PM Ulrich Teichert
> <krypton@ulrich-teichert.org> wrote:
> >
> > I was just tinkering with it to get it compiled without warning,
> > I certainly didn't get the big picture :-/
> 
> Ok, you shamed me into some tinkering too, and I fixed a couple of
> issues with the alpha build.
> 
> The whole "pci_iounmap()" mess is not something I solved (you were
> cc'd on the email I sent out about that), but I did test a few
> different Jensen configurations and fixed a couple of uglies.
> 
> So at least _some_ Jensen configurations build cleanly once more, and
> I re-enabled JENSEN as a valid machine target.

Yes, I was able to build a minimal Jensen config without any warning
after pulling today, thanks! I think investing a bit in cleaning up
non-PCI configurations may help as soon as PCIe will be obsoleted
by the next bus system ;-)

> But if it doesn't boot, it's all fairly moot. And those things are a
> pain to debug, and if the last booting kernel was years and years ago,
> I don't think it realistically will necessarily ever be fixed.

The main trouble is that my system has only 64MB of memory and the smallest
kernel image with all drivers I need was about 105MB big. According
to: http://users.bart.nl/~geerten/FAQ-9.html
the Jensen can take up to 128MB of RAM and the required PS/2 SIMMs
with partity are still available on ebay, so I just bought 4x32 MB SIMMs.
After setting CONFIG_CC_OPTIMIZE_FOR_SIZE the kernel image was still
93MB big, but with 128MB I should be able to boot it. Let's see....

> Oh well. I have an odd love-hate relationship with alpha.
> 
> I think it's one of the worst architectures ever designed (memory
> ordering is completely broken, and the lack of byte operations in the
> original specs were a big reason for the initial problems and eventual
> failure).

I didn't had the money for an Alpha at that time, but as soon as
cheap systems were available on ebay, I took the opportunity. At the
time I bought them, I considered the Miatas (the "Personal Workstations"
from DEC) as quite fast - that must have been around 2004/2006.

> But at the same time, I really did enjoy it back in the day, and it
> _was_ the first port I did, and the first truly integrated kernel
> architecture (the original Linux m68k port that preceded it was a
> "hack up and replace" job rather than "integrate")

My experience is that each port is good for code quality, but I can
only state that for user space applications, not having done much kernel
work,

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
