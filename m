From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 18:28:53 +0200
Message-ID: <87ila5jp2y.fsf@igel.home>
References: <cover.1689074739.git.legion@kernel.org>
        <cover.1689092120.git.legion@kernel.org>
        <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
        <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
        <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com> (David
        Laight's message of "Thu, 27 Jul 2023 09:01:06 +0000")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, christian@brauner.io

On Jul 27 2023, David Laight wrote:

> From: Aleksa Sarai
>> Sent: 25 July 2023 17:36
> ...
>> We almost certainly want to support AT_EMPTY_PATH at the same time.
>> Otherwise userspace will still need to go through /proc when trying to
>> chmod a file handle they have.
>
> That can't be allowed.

IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
m).  With that, new architectures only need to implement the fchmodat2
syscall to cover all chmod variants.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
