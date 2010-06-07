From: Greg KH <gregkh@suse.de>
Subject: Re: 2.6.35-rc2 compilation error on Alpha
Date: Sun, 6 Jun 2010 20:04:37 -0700
Message-ID: <20100607030437.GA32725@suse.de>
References: <4C0C22C4.3010705@orcon.net.nz> <AANLkTim9aWVzb7v5fnS6x3ghMU2_tpaLlbZu3SKXV_0R@mail.gmail.com> <4C0C47A8.1000800@orcon.net.nz> <AANLkTinnprvU7bbe28emifv766_tWKjaSfW0ch2PQY23@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinnprvU7bbe28emifv766_tWKjaSfW0ch2PQY23@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Sun, Jun 06, 2010 at 09:24:03PM -0400, Matt Turner wrote:
> On Sun, Jun 6, 2010 at 9:13 PM, Michael Cree <mcree@orcon.net.nz> wrote:
> > On 07/06/10 12:08, Matt Turner wrote:
> >>
> >> On Sun, Jun 6, 2010 at 6:35 PM, Michael Cree<mcree@orcon.net.nz> ?wrote:
> >>>
> >>> When compiling 2.6.35-rc2 for Alpha architecture the following compiler
> >>> error is seen:
> >>>
> >>> ?CC ? ? ?arch/alpha/kernel/asm-offsets.s
> >>> In file included from include/linux/kernel.h:17,
> >>> ? ? ? ? ? ? ? ? from include/linux/sched.h:54,
> >>> ? ? ? ? ? ? ? ? from arch/alpha/kernel/asm-offsets.c:9:
> >>> include/linux/bitops.h: In function ?hweight_long?:
> >>> include/linux/bitops.h:49: error: implicit declaration of function
> >>> ?__arch_hweight32?
> >>
> >> Yeah, it was a stupid typo in
> >> 1527bc8b928dd1399c3d3467dd47d9ede210978a. I've fixed it and put the
> >> patch in my tree for Linus.
> >
> > Ah, now the offending commit is pointed out to me I can see the trivial fix.
> > ?With that, as you say, compilation now bombs out in the pci-sysfs stuff.
> > ?Since you claim to have that in hand I'll await your solution.
> >
> > Cheers
> > Michael.
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at ?http://vger.kernel.org/majordomo-info.html
> >
> 
> Fixes for both breaks are in:
>    git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
> for-linus
> 
> I know alpha hardware isn't easy to get your hands on to compile test
> these changes, but guys, please just send linux-alpha@ the patch and
> _I'll_ do it. Both these breaks were not even compile tested.
> 
> pci break: 2c3c8bea608866d8bd9dcf92657d57fdcac011c5
> hweight break: 1527bc8b928dd1399c3d3467dd47d9ede210978a
> 
> Greg, I haven't checked, but if either of these commits are in .34 or
> older, then my fixes need to go into -stable.

Could you check please?

thanks,

greg k-h
