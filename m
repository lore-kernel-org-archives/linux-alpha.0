From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Wed, 24 Jul 2013 22:25:44 +1200
Message-ID: <20130724102544.GA7713@omega>
References: <20130717000347.GB2483@stolen.phys.waikato.ac.nz>
 <1374546701.3719.33@driftwood>
 <20130723032511.GA18086@stolen.phys.waikato.ac.nz>
 <51EE9F36.7050402@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51EE9F36.7050402@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Michael Cree <cree@waikato.ac.nz>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Tue, Jul 23, 2013 at 07:20:22AM -0800, Richard Henderson wrote:
> On 07/22/2013 07:25 PM, Michael Cree wrote:
> > I wondered if your proposal will break glibc as glibc checks for
> > __NR_oldumount and does different things based on that.  But maybe your
> > fix will not adversely affect glibc (I did not look particularly closely
> > to see if so), but even so, there is no guarantee that other software does
> > not directly access the oldumount syscall when compiled on Alpha, and your
> > change would likely break any such software.
> 
> It won't break glibc.  While there are conditionals for oldumount,
> they do pretty much exactly the umount/umount2 dance you'd expect.

That's good to hear.

> I'm for the patch, because anything that makes us match x86 more
> closely has got to be a good thing from a portability standpoint.

OK, but I think that behoves us to make an effort to check user space
applications are compliant with the change.  Fortunately we can easily
scheck the vast majority of opensource programs now that Debian
provides a web interface for searching the source code of all their
packages.

Searching for NR_umount finds the following packages that compile on
Alpha:

eglibc
dietlibc
uclibc
qemu
radare
linux-tools
ns3
skyeye
(and a few others that are not buildable on Alpha and tons of
hits for every version of the linux kernel that result from every arch
directory therein...)

I'm happy to take a closer look at them and submit a patch to their upstreams
if need be.

Cheers
Michael.
