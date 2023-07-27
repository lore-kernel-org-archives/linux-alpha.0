From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 09:01:06 +0000
Message-ID: <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "christian@brauner.io" <christian@brauner.io>, "dalias@libc.org" <dalias@libc.org>, davem@davemloft.ne

From: Aleksa Sarai
> Sent: 25 July 2023 17:36
...
> We almost certainly want to support AT_EMPTY_PATH at the same time.
> Otherwise userspace will still need to go through /proc when trying to
> chmod a file handle they have.

That can't be allowed.

Just because a process has a file open and write access to
the directory that contains it doesn't mean they are allowed
to change the file permissions.

They also need directory search access from a directory
they have open through to the containing directory.

	David
