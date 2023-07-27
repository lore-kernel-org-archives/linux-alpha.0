From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 19:36:21 +0200
Message-ID: <20230727-boxte-wohnviertel-74b8541d27ec@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
 <87ila5jp2y.fsf@igel.home>
 <20230727-zerrt-leitmotiv-9e8b60abf690@brauner>
 <20230727171336.GC20050@brightrain.aerifal.cx>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690479396;
        bh=iU7zvXpvxPSg5KiGe2n535PFFdPoC8EIhqciU1h+3Zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VxumH8hGN053L+FyKWAl7yNCuep6zB52SgRtI5W/3VmZXm+mmZ4jBeoyIQx8UEPBz
         KB2g3ckpL1rFkA8SxtOo/2sVYVEfDaKNkKBz1lQ8P2ADzxBiSuYz1s4+mgNIaH8PHC
         mgTZjyPGv647aIhCLp9wnBJ2zOHZU59iFOFLNAEflHY4ZPUF7p4ROHHXQAz2E75cTe
         Vin+UGvlA56e4nxESt9X2PQkCsoXkmtj+oV/UF3bLR5Ny1I9LiKjhW+1r+2WJ/O6Yd
         TgUSACO81o4AuGEsdvCy68dJhSXgXujDC+IFg4xwGOBHFACldMWcZVQg7TP9JlZNoG
         348a+hccYCeEA==
Content-Disposition: inline
In-Reply-To: <20230727171336.GC20050@brightrain.aerifal.cx>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dalias@libc.org" <dalias@libc.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, David Laight <David.Laight@ACULAB.COM>, 'Aleksa Sarai' <cyphar@cyphar.com>, Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "axboe@kernel.dk" <axboe@kernel.dk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "bp@alien8.de" <bp@alien8.d>

On Thu, Jul 27, 2023 at 01:13:37PM -0400, dalias@libc.org wrote:
> On Thu, Jul 27, 2023 at 07:02:53PM +0200, Christian Brauner wrote:
> > On Thu, Jul 27, 2023 at 06:28:53PM +0200, Andreas Schwab wrote:
> > > On Jul 27 2023, David Laight wrote:
> > > 
> > > > From: Aleksa Sarai
> > > >> Sent: 25 July 2023 17:36
> > > > ...
> > > >> We almost certainly want to support AT_EMPTY_PATH at the same time.
> > > >> Otherwise userspace will still need to go through /proc when trying to
> > > >> chmod a file handle they have.
> > > >
> > > > That can't be allowed.
> > > 
> > > IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
> > > m).  With that, new architectures only need to implement the fchmodat2
> > > syscall to cover all chmod variants.
> > 
> > There's a difference though as fchmod() doesn't work with O_PATH file
> > descriptors while AT_EMPTY_PATH does. Similar to how fchown() doesn't
> > work with O_PATH file descriptors.
> > 
> > However, we do allow AT_EMPTY_PATH with fchownat() so there's no reason
> > to not allow it for fchmodat2().
> > 
> > But it's a bit of a shame that O_PATH looks less and less like O_PATH.
> > It came from can-do-barely-anything to can-do-quite-a-lot-of-things over
> > the years.
> > 
> > In any case, AT_EMPTY_PATH for fchmodat2() can be an additional patch on
> > top.
> 
> From a standpoint of implementing O_SEARCH/O_EXEC using it, I don't
> see any reason fchown/fchmod should not work on O_PATH file
> descriptors. And indeed when you have procfs available to emulate them
> via procfs, it already does. So I don't see this as unwanted

I'm really not talking about the fact that proc is a giant loophole for
basically everyhing related to O_PATH and reopening fds.

I'm saying that both fchmod() and fchown() don't work on O_PATH fds.
They explicitly reject them.

AT_EMPTY_PATH and therefore O_PATH for fchmodat2() is fine given that we
do it for fchownat() already.
