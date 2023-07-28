From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Fri, 28 Jul 2023 08:43:58 +0000
Message-ID: <dc48b40748e24d3799e7ee66fa7e8cb4@AcuMS.aculab.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <ZMEjlDNJkFpYERr1@example.org>
 <20230727.041348-imposing.uptake.velvet.nylon-712tDwzCAbCCoSGx@cyphar.com>
 <20230727.173441-loving.habit.lame.acrobat-V6VTPe8G4FRI@cyphar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20230727.173441-loving.habit.lame.acrobat-V6VTPe8G4FRI@cyphar.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "christian@brauner.io" <christian@brauner.io>, "dalias@libc.org" <dalias@libc.org>, davem@davemloft.ne

...
> FWIW, I agree with Christian that these behaviours are not ideal (and
> I'm working on a series that might allow for these things to be properly
> blocked in the future) but there's also the consistency argument -- I
> don't think fchownat() is much safer to allow in this way than
> fchmodat() and (again) this behaviour is already possible through
> procfs.

If the 'through procfs' involves readlink("/proc/self/fd/n") and
accessing through the returned path then the permission checks
are different.
Using the returned path requires search permissions on all the
directories.

This is all fine for xxxat() functions where a real open
directory fd is supplied.
But other cases definitely need a lot of thought to ensure
they don't let programs acquire permissions they aren't
supposed to have.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

