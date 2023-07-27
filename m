From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 19:02:53 +0200
Message-ID: <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
 <87ila5jp2y.fsf@igel.home>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690477387;
        bh=dRinFx40BRIrMwg/8epwp+lbWEUZUugvI2zcPLmbs6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sAR5rAZfLiN5wJdY9U15gQ+2zoDM6Q7hVZtIHJDTHH3SMwSc6rlEIKvPsqk5cg3Xg
         AnK5C2Dn3qHE9/zOovZJD+aFBMhlS1NqJawkK5/s4w9i3bPzaSYhofqqqKdEv6EEDb
         RtYXOrAZMbdXRoYQuKrdmE7RTPcMhBa0fkyPAx5iDnXWgAEVUJ3Aj6CGpfOlUJUxxW
         8nidLRiIuhUXXQC5j/4yspRCD2nyMbAbSjNyAqO2bH4dx6cYM4R62nwXAEseaQd5cM
         YRFCocsOOhANZ2EdBrrnT78bTY++zOkqtL+nF+3DXHIOv3NNTYaDz5jmZh2VKAyKCQ
         noXRpmWJsxuAA==
Content-Disposition: inline
In-Reply-To: <87ila5jp2y.fsf@igel.home>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: David Laight <David.Laight@ACULAB.COM>, 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "catalin.marinas@arm.com" <catalin.m>

On Thu, Jul 27, 2023 at 06:28:53PM +0200, Andreas Schwab wrote:
> On Jul 27 2023, David Laight wrote:
> 
> > From: Aleksa Sarai
> >> Sent: 25 July 2023 17:36
> > ...
> >> We almost certainly want to support AT_EMPTY_PATH at the same time.
> >> Otherwise userspace will still need to go through /proc when trying to
> >> chmod a file handle they have.
> >
> > That can't be allowed.
> 
> IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
> m).  With that, new architectures only need to implement the fchmodat2
> syscall to cover all chmod variants.

There's a difference though as fchmod() doesn't work with O_PATH file
descriptors while AT_EMPTY_PATH does. Similar to how fchown() doesn't
work with O_PATH file descriptors.

However, we do allow AT_EMPTY_PATH with fchownat() so there's no reason
to not allow it for fchmodat2().

But it's a bit of a shame that O_PATH looks less and less like O_PATH.
It came from can-do-barely-anything to can-do-quite-a-lot-of-things over
the years.

In any case, AT_EMPTY_PATH for fchmodat2() can be an additional patch on
top.
