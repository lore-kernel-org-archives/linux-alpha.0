From: "dalias@libc.org" <dalias@libc.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Fri, 28 Jul 2023 14:42:12 -0400
Message-ID: <20230728184212.GD20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <ZMEjlDNJkFpYERr1@example.org>
 <20230727.041348-imposing.uptake.velvet.nylon-712tDwzCAbCCoSGx@cyphar.com>
 <20230727.173441-loving.habit.lame.acrobat-V6VTPe8G4FRI@cyphar.com>
 <dc48b40748e24d3799e7ee66fa7e8cb4@AcuMS.aculab.com>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dc48b40748e24d3799e7ee66fa7e8cb4@AcuMS.aculab.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, christian@brauner.io

On Fri, Jul 28, 2023 at 08:43:58AM +0000, David Laight wrote:
> ....
> > FWIW, I agree with Christian that these behaviours are not ideal (and
> > I'm working on a series that might allow for these things to be properly
> > blocked in the future) but there's also the consistency argument -- I
> > don't think fchownat() is much safer to allow in this way than
> > fchmodat() and (again) this behaviour is already possible through
> > procfs.
> 
> If the 'through procfs' involves readlink("/proc/self/fd/n") and
> accessing through the returned path then the permission checks
> are different.
> Using the returned path requires search permissions on all the
> directories.

That's *not* how "through procfs" works. The "magic symlinks" in
/proc/*/fd are not actual symlinks that get dereferenced to the
contents they readlink() to, but special-type objects that dereference
directly to the underlying file associated with the open file
description.

Rich
