From: "dalias@libc.org" <dalias@libc.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 12:31:04 -0400
Message-ID: <20230727163103.GB20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, christian@brauner.io

On Thu, Jul 27, 2023 at 09:01:06AM +0000, David Laight wrote:
> From: Aleksa Sarai
> > Sent: 25 July 2023 17:36
> ....
> > We almost certainly want to support AT_EMPTY_PATH at the same time.
> > Otherwise userspace will still need to go through /proc when trying to
> > chmod a file handle they have.
> 
> That can't be allowed.
> 
> Just because a process has a file open and write access to
> the directory that contains it doesn't mean they are allowed
> to change the file permissions.
> 
> They also need directory search access from a directory
> they have open through to the containing directory.

Am I missing something? How is this different from fchmod?

Rich
