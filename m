From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Thu, 16 Sep 2021 12:34:34 +1200
Message-ID: <20210916003434.GB7246@tower>
References: <20210915035227.630204-1-linux@roeck-us.net>
 <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wed, Sep 15, 2021 at 12:18:58PM -0700, Linus Torvalds wrote:
> On Tue, Sep 14, 2021 at 8:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > This patch series introduces absolute_pointer() to fix the problem.
> > absolute_pointer() disassociates a pointer from its originating symbol
> > type and context, and thus prevents gcc from making assumptions about
> > pointers passed to memory operations.
> 
> Ok, I've applied this to my tree.
> 
> I note that the physical BOOT_PCB addresses in the alpha setup.h file
> might be useful for things like MILO in user space, but since I
> couldn't even find MILO sources any more, I couldn't really check.
> 
> I suspect alpha is basically on life support and presumably nobody
> would ever compile a bootloader anyway, so it's unlikely to matter.
> 
> If somebody does find any issues, we'll know better and we can ask
> where the user space sources are that might use that alpha setup.h
> file.

I think everyone uses aboot now as the bootloader on Alpha.  So as
long as we can still compile aboot everyone should be happy.

Cheers
Michael.
