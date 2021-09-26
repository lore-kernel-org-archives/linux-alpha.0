From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sun, 26 Sep 2021 11:08:11 +0200
Message-ID: <bfdfeb42-759e-b659-39ed-af73f48722f1@physik.fu-berlin.de>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>

Hi Linus!

On 9/25/21 21:07, Linus Torvalds wrote:
> On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>>         On each context switch we save the FPU registers on stack
>> of old process and restore FPU registers from the stack of new one.
>> That allows us to avoid doing that each time we enter/leave the
>> kernel mode; however, that can get suboptimal in some cases.
> 
> Do you actually have a system or virtual image to test this all out on?

I have a system for testing and I can also create a QEMU VM image for tesing
using the Debian Ports installation ISO for Alpha [1].

I assume Matt and Michael (CC'ed) would be able to test these improvements
as well as they're working on Alpha support in the kernel.

> I'm not saying this doesn't look like an improvement, I'm more
> questioning whether it's worth it...

Since we're still maintaining Alpha ports in Debian and Gentoo, it should
be worth it, I would say.

Adrian

> [1] https://cdimage.debian.org/cdimage/ports/snapshots/2021-09-23/

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

