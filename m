From: "dalias@libc.org" <dalias@libc.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 13:13:37 -0400
Message-ID: <20230727171336.GC20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
 <87ila5jp2y.fsf@igel.home>
 <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <brauner@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, David Laight <David.Laight@ACULAB.COM>, 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.d>

On Thu, Jul 27, 2023 at 07:02:53PM +0200, Christian Brauner wrote:
> On Thu, Jul 27, 2023 at 06:28:53PM +0200, Andreas Schwab wrote:
> > On Jul 27 2023, David Laight wrote:
> > 
> > > From: Aleksa Sarai
> > >> Sent: 25 July 2023 17:36
> > > ...
> > >> We almost certainly want to support AT_EMPTY_PATH at the same time.
> > >> Otherwise userspace will still need to go through /proc when trying to
> > >> chmod a file handle they have.
> > >
> > > That can't be allowed.
> > 
> > IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
> > m).  With that, new architectures only need to implement the fchmodat2
> > syscall to cover all chmod variants.
> 
> There's a difference though as fchmod() doesn't work with O_PATH file
> descriptors while AT_EMPTY_PATH does. Similar to how fchown() doesn't
> work with O_PATH file descriptors.
> 
> However, we do allow AT_EMPTY_PATH with fchownat() so there's no reason
> to not allow it for fchmodat2().
> 
> But it's a bit of a shame that O_PATH looks less and less like O_PATH.
> It came from can-do-barely-anything to can-do-quite-a-lot-of-things over
> the years.
> 
> In any case, AT_EMPTY_PATH for fchmodat2() can be an additional patch on
> top.

From a standpoint of implementing O_SEARCH/O_EXEC using it, I don't
see any reason fchown/fchmod should not work on O_PATH file
descriptors. And indeed when you have procfs available to emulate them
via procfs, it already does. So I don't see this as unwanted
functionality or an access control regression. I see it as things
behaving as expected.

Semantically, O_PATH is a reference to the inode, not to the dirent.
So there is no reason you should not be able to do things that need
permission to the inode (changing permissions on it) rather than to
the dirent (renaming/moving).

Rich
