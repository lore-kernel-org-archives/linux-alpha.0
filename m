From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH v4 3/3] fs: let filldir_t return bool instead of an error code
Date: Mon, 21 Jan 2019 16:49:45 +0100
Message-ID: <CAG48ez3SgejgGbctHwxON1B1k26xk-z16xdozKZkx7=-Li0aHw@mail.gmail.com>
References: <20190118161440.220134-1-jannh@google.com> <20190118161440.220134-3-jannh@google.com>
 <20190120224059.GA4205@dastard>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1UbmoNU2Elrtyi+ikkL7Tod5Yv+X3eL2cyfpgQGaQ8=;
        b=ZpBgI4rIvFYQFFiygIquZ4ddgJy+2NXAAhvTyq3Ey5teg741IR0sDrKcE27cYKvn1b
         PWqSZA1RoSj+BxAEZ8zjlYWdfRIU5RnRywak/eehXLJm6m7ulzxp7yFaXD8r9KUTowYo
         wyLFbWw2QXYrFS/yhfi6Fvs9nptz3ZIQeX1GkaIOm0/8O57tOHwL+Mxbf+Jes7SNj0nK
         0GqFZ8ekJSzhn/ephf63YoBfRn82xwjLCeMEiJY6ZKUoa0UKFuRzrjAKvc/WOhWQ2tEU
         I52MYKJrGqmMUc8biEO13oDevHne8se9JewVoachHBDwvCezEJSzBvq7KS+UASQmwNee
         uA4w==
In-Reply-To: <20190120224059.GA4205@dastard>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-arch <linux-arch@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>

On Sun, Jan 20, 2019 at 11:41 PM Dave Chinner <david@fromorbit.com> wrote:
> On Fri, Jan 18, 2019 at 05:14:40PM +0100, Jann Horn wrote:
> > As Al Viro pointed out, many filldir_t functions return error codes, but
> > all callers of filldir_t functions just check whether the return value is
> > non-zero (to determine whether to continue reading the directory); more
> > precise errors have to be signalled via struct dir_context.
> > Change all filldir_t functions to return bool instead of int.
> >
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  arch/alpha/kernel/osf_sys.c | 12 +++----
> >  fs/afs/dir.c                | 30 +++++++++--------
> >  fs/ecryptfs/file.c          | 13 ++++----
> >  fs/exportfs/expfs.c         |  8 ++---
> >  fs/fat/dir.c                |  8 ++---
> >  fs/gfs2/export.c            |  6 ++--
> >  fs/nfsd/nfs4recover.c       |  8 ++---
> >  fs/nfsd/vfs.c               |  6 ++--
> >  fs/ocfs2/dir.c              | 10 +++---
> >  fs/ocfs2/journal.c          | 14 ++++----
> >  fs/overlayfs/readdir.c      | 24 +++++++-------
> >  fs/readdir.c                | 64 ++++++++++++++++++-------------------
> >  fs/reiserfs/xattr.c         | 20 ++++++------
> >  fs/xfs/scrub/dir.c          |  8 ++---
> >  fs/xfs/scrub/parent.c       |  4 +--
> >  include/linux/fs.h          | 10 +++---
> >  16 files changed, 125 insertions(+), 120 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> > index db1c2144d477..14e5ae0dac50 100644
> > --- a/arch/alpha/kernel/osf_sys.c
> > +++ b/arch/alpha/kernel/osf_sys.c
> > @@ -108,7 +108,7 @@ struct osf_dirent_callback {
> >       int error;
> >  };
> >
> > -static int
> > +static bool
> >  osf_filldir(struct dir_context *ctx, const char *name, int namlen,
> >           loff_t offset, u64 ino, unsigned int d_type)
> >  {
> > @@ -120,14 +120,14 @@ osf_filldir(struct dir_context *ctx, const char *name, int namlen,
> >
> >       buf->error = check_dirent_name(name, namlen);
> >       if (unlikely(buf->error))
> > -             return -EFSCORRUPTED;
> > +             return false;
> >       buf->error = -EINVAL;   /* only used if we fail */
> >       if (reclen > buf->count)
> > -             return -EINVAL;
> > +             return false;
>
> Oh, it's because the error being returned is being squashed by
> dir_emit():

Yeah.

> >  struct dir_context {
> > @@ -3469,17 +3471,17 @@ static inline bool dir_emit(struct dir_context *ctx,
> >                           const char *name, int namelen,
> >                           u64 ino, unsigned type)
> >  {
> > -     return ctx->actor(ctx, name, namelen, ctx->pos, ino, type) == 0;
> > +     return ctx->actor(ctx, name, namelen, ctx->pos, ino, type);
> >  }
>
> /me wonders if it would be cleaner to do:
>
> static inline bool dir_emit(...)
> {
>         buf->error = ctx->actor(....)
>         if (buf->error)
>                 return false;
>         return true;
> }
>
> And clean up all filldir actors just to return the error state
> rather than have to jump through hoops to stash the error state in
> the context buffer and return the error state?

One negative thing about that, IMO, is that it mixes up the request
for termination of the loop and the presence of an error. The current
code returns fake errors that never reach userspace in various places
to terminate the loop, e.g. fillonedir() has a "return -EINVAL" to
terminate the loop if at least one element has been read already, and
filldir() has a "return -EINTR" on signal_pending() that explicitly
only happens if at least one element has been read already.

But really, I don't have strong feelings about this, I just want to
get the "fs: don't let getdents return bogus names" patch in. :P

> That then allows callers who want/need the full error info can
> continue to call ctx->actor directly,

"continue to call ctx->actor directly"? I don't remember any code that
calls ctx->actor directly.

> while all those that just want
> to terminate their loops on error can continue just to call
> dir_emit()...
