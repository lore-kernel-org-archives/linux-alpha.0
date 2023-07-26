From: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Wed, 26 Jul 2023 15:45:56 +0200
Message-ID: <ZMEjlDNJkFpYERr1@example.org>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690379171;
        bh=YMmxomfMr9G4i/xBDFo8a+tJ6BzX3X5lQtLwpyL37dM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iLrm54/OyVAkeX7XRTdQI6vJKk7fvA9E8WFuxeM1GUgON2oCeY1wjM8yTYrtIi4IQ
         Oo3FMgcMnRzknsY84kWAeTJ0inxm7fg97Q/tOUTzG6ZMmI5ATwnzUC945HbXcM2RRW
         HKanW7qmiSF3lCZhc3wQfBbpJJOtev2Fm0SsXZJptqvFFvEwrKyC1aKGldedLK/9Vz
         62DImdurXvwbmhgOteOs/aXLApFhcpwiLDIG+sQUeQFLsagl1k2OVSVn88v78BFAcl
         Vj6NEoPbw1eyE9ZIq7xYhoiahGzuo+q0Lii/UprIQXPLwFPgjeIIKj3g1kimIqX0ng
         b/060n7yg03AQ==
Content-Disposition: inline
In-Reply-To: <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.li

On Wed, Jul 26, 2023 at 02:36:25AM +1000, Aleksa Sarai wrote:
> On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > On the userspace side fchmodat(3) is implemented as a wrapper
> > function which implements the POSIX-specified interface. This
> > interface differs from the underlying kernel system call, which does not
> > have a flags argument. Most implementations require procfs [1][2].
> > 
> > There doesn't appear to be a good userspace workaround for this issue
> > but the implementation in the kernel is pretty straight-forward.
> > 
> > The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> > unlike existing fchmodat.
> > 
> > [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> > 
> > Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  fs/open.c                | 18 ++++++++++++++----
> >  include/linux/syscalls.h |  2 ++
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/open.c b/fs/open.c
> > index 0c55c8e7f837..39a7939f0d00 100644
> > --- a/fs/open.c
> > +++ b/fs/open.c
> > @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
> >  	return err;
> >  }
> >  
> > -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> > +static int do_fchmodat(int dfd, const char __user *filename, umode_t mode, int lookup_flags)
> 
> I think it'd be much neater to do the conversion of AT_ flags here and
> pass 0 as a flags argument for all of the wrappers (this is how most of
> the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).

I just addressed the Al Viro's suggestion.

https://lore.kernel.org/lkml/20190717014802.GS17978@ZenIV.linux.org.uk/

> >  {
> >  	struct path path;
> >  	int error;
> > -	unsigned int lookup_flags = LOOKUP_FOLLOW;
> > +
> >  retry:
> >  	error = user_path_at(dfd, filename, lookup_flags, &path);
> >  	if (!error) {
> > @@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> >  	return error;
> >  }
> >  
> > +SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
> > +		umode_t, mode, int, flags)
> > +{
> > +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
> > +		return -EINVAL;
> 
> We almost certainly want to support AT_EMPTY_PATH at the same time.
> Otherwise userspace will still need to go through /proc when trying to
> chmod a file handle they have.

I'm not sure I understand. Can you explain what you mean?

-- 
Rgrds, legion

