From: Christian Brauner <brauner-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2] fs/xattr: add *at family syscalls
Date: Mon, 15 May 2023 15:52:20 +0200
Message-ID: <20230515-banal-vergab-a7abb53169b5@brauner>
References: <20230511150802.737477-1-cgzones@googlemail.com>
 <20230515-kopfgeld-umkurven-f27be4b68a26@brauner>
 <CAOQ4uxgtxLLfBuVUAT7+N7cox+03wJA3ACGEu76dZd5RqGWXTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684158749;
        bh=yLHcOQuMOwKl/TYFo2kdsc0eAYysG+im84RLRDZNBd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OD90Fnua0tBl6Y7Xa5VYKmP56D3PTecnBZKxd6t/NzIbjyvtkj0FCYMKwSiEtCItm
         FOJxfFG6M+SqBZePsKLSIR0ZPW4mgn7rQihMwZEGM1Y0LT8x8v3xuCpPtttmUVHYd9
         Rw0sOkNWawXMm1K7SVGmjFitrrb6QBegfPwUWfECuki7kMZqeg4mKRp/qc7KqWwwCz
         tjZUf8ReIHUIAhWBk8AC1N5GSMad/pfCSv9nZBGYnK5ilmGWyJV349wbDLPVZPNCE5
         n1/RcwvhrCrwDX9yTR70NM50k1yHTBCmbwBHvPjfwOPT9Bw5JJoWXNoTDwaV2AHJpO
         WnSHT0ak+v8pA==
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgtxLLfBuVUAT7+N7cox+03wJA3ACGEu76dZd5RqGWXTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Amir Goldstein <amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christian =?utf-8?B?R8O2dHRzY2hl?= <cgzones-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, audit-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, selinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, jlayton-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cyphar-gVpy/LI/lHzQT0dZR+AlfA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

On Mon, May 15, 2023 at 04:04:21PM +0300, Amir Goldstein wrote:
> On Mon, May 15, 2023 at 1:33 PM Christian Brauner <brauner-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Thu, May 11, 2023 at 05:08:02PM +0200, Christian Göttsche wrote:
> > > Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> > > removexattrat().  Those can be used to operate on extended attributes,
> > > especially security related ones, either relative to a pinned directory
> > > or on a file descriptor without read access, avoiding a
> > > /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
> > >
> > > One use case will be setfiles(8) setting SELinux file contexts
> > > ("security.selinux") without race conditions.
> > >
> > > Add XATTR flags to the private namespace of AT_* flags.
> > >
> > > Use the do_{name}at() pattern from fs/open.c.
> > >
> > > Use a single flag parameter for extended attribute flags (currently
> > > XATTR_CREATE and XATTR_REPLACE) and *at() flags to not exceed six
> > > syscall arguments in setxattrat().
> > >
> > > Previous approach ("f*xattr: allow O_PATH descriptors"): https://lore.kernel.org/all/20220607153139.35588-1-cgzones-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org/
> > > v1 discussion: https://lore.kernel.org/all/20220830152858.14866-2-cgzones-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org/
> > >
> > > Signed-off-by: Christian Göttsche <cgzones-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> > > CC: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> > > CC: linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > CC: linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org
> > > CC: linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > CC: linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: audit-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > CC: selinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > ---
> >
> > Fwiw, your header doesn't let me see who the mail was directly sent to
> > so I'm only able to reply to lists which is a bit pointless...
> >
> > > v2:
> > >   - squash syscall introduction and wire up commits
> > >   - add AT_XATTR_CREATE and AT_XATTR_REPLACE constants
> >
> > > +#define AT_XATTR_CREATE              0x1     /* setxattrat(2): set value, fail if attr already exists */
> > > +#define AT_XATTR_REPLACE     0x2     /* setxattrat(2): set value, fail if attr does not exist */
> >
> > We really shouldn't waste any AT_* flags for this. Otherwise we'll run
> > out of them rather quickly. Two weeks ago we added another AT_* flag
> > which is up for merging for v6.5 iirc and I've glimpsed another AT_*
> > flag proposal in one of the talks at last weeks Vancouver conference
> > extravaganza.
> >
> > Even if we reuse 0x200 for AT_XATTR_CREATE (like we did for AT_EACCESS
> > and AT_REMOVEDIR) we still need another bit for AT_XATTR_REPLACE.
> >
> > Plus, this is really ugly since AT_XATTR_{CREATE,REPLACE} really isn't
> > in any way related to lookup and we're mixing it in with lookup
> > modifying flags.
> >
> > So my proposal for {g,s}etxattrat() would be:
> >
> > struct xattr_args {
> >         __aligned_u64 value;
> >         __u32 size;
> >         __u32 cmd;
> > };
> >
> > So everything's nicely 64bit aligned in the struct. Use the @cmd member
> > to set either XATTR_REPLACE or XATTR_CREATE and treat it as a proper
> > enum and not as a flag argument like the old calls did.
> >
> > So then we'd have:
> >
> > setxattrat(int dfd, const char *path, const char __user *name,
> >            struct xattr_args __user *args, size_t size, unsigned int flags)
> > getxattrat(int dfd, const char *path, const char __user *name,
> >            struct xattr_args __user *args, size_t size, unsigned int flags)
> >
> > The current in-kernel struct xattr_ctx would be renamed to struct
> > kernel_xattr_args and then we do the usual copy_struct_from_user()
> > dance:
> >
> > struct xattr_args args;
> > err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
> >
> > and then go on to handle value/size for setxattrat()/getxattrat()
> > accordingly.
> >
> > getxattr()/setxattr() aren't meaningfully filterable by seccomp already
> > so there's not point in not using a struct.
> >
> > If that isn't very appealing then another option is to add a new flag
> > namespace just for setxattrat() similar to fspick() and move_mount()
> > duplicating the needed lookup modifying flags.
> > Thoughts?
> 
> Here is a thought: I am not sure if I am sorry we did not discuss this API
> issue in LSFMM or happy that we did not waste our time on this... :-/
> 
> I must say that I dislike redefined flag namespace like FSPICK_*
> just as much as I dislike overloading the AT_* namespace and TBH,
> I am not crazy about avoiding this problem with xattr_args either.
> 
> A more sane solution IMO could have been:
> - Use lower word of flags for generic AT_ flags
> - Use the upper word of flags for syscall specific flags

We'd have 16 lower bits for AT_* flags and upper 16 bits for non-AT_*
flags. That might be ok but it isn't great because if we ever extend
AT_* flags into the upper 16 bits that are generally useful for all
AT_* flag taking system calls we'd not be able to use them. And at the
rate people keep suggesting new AT_* flags that issue might arise
quicker than we might think.

And we really don't want 64 bit flag arguments because of 32 bit
architectures as that gets really ugly to handle cleanly (Arnd has
talked a lot about issues in this area before).

> 
> So if it were up to me, I would vote starting this practice:
> 
> + /* Start of syscall specific range */
> + #define AT_XATTR_CREATE       0x10000     /* setxattrat(2): set
> value, fail if attr already exists */
> + #define AT_XATTR_REPLACE     0x20000     /* setxattrat(2): set
> value, fail if attr does not exist */
> 
> Which coincidentally happens to be inline with my AT_HANDLE_FID patch...

This is different though. The reason AT_HANDLE_FID is acceptable is
because we need the ability to extend an existing system call and we're
reusing a bit that is already used in two other system calls. So we
avoid adding a new system call just to add another flag argument and
we're also not using up an additional AT_* bit. This makes it bearable
imho. But here we're talking about new system calls where we can avoid
this problem arising in the first place.

> 
> Sure, we will have some special cases like MOVE_MOUNT_* and
> legacy pollution to the lower AT_ flags word, but as a generic solution
> for syscalls that need the common AT_ lookup flags and just a few
> private flags, that seems like the lesser evil to me.

It is fine to do this in some cases but we shouldn't encourage mixing
distinct flag namespaces let alone advertising this as a generic
solution imho. The AT_XATTR_* flags aren't even flags they behave like
an enum.
