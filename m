From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH] fs: don't let getdents return bogus names
Date: Mon, 16 Jul 2018 22:20:24 +0200
Message-ID: <CAG48ez1=rW2fBmx0pwu+yQCGpq2Bu7XnMYRkYJt2Dnj5y1USFw@mail.gmail.com>
References: <20180716194843.252772-1-jannh@google.com> <20180716195657.GO30522@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCmPxVK3qYnR6RrgRdSfGNbiY0q4whf6n33vgOL84UY=;
        b=N8BM6qn9D0cG1ga2Pc2yQH4+5Q7cpcjCE05dCYQa6SXUVaIPJ+oMH2zY1TVk/ZoDH2
         6nI9UgWaqEOVvIaQcH2gFbbKSXk8sFA+kioSg3RBLCrDbcsJ/EnERT+zUij5GuwFUMx1
         xD38GEMQahn5+qDtAImCb4spGY9hXLSxnLBmmFfVD3VM5l8DL/WCXTk3BUsC5FesxkxB
         9I1tCDoavhWwonxQN54l4K5+8utJVjj7ru3Y7Aq1qTdfzcZbWYlEVJgtU7rCH58Lk+ql
         PVPrd7iZ5jF1PKYLETcMnGmZ4+LhCqbivO8vLqvefFJAy24ZFJt24peZqGx/VIhEwr+4
         s3Ew==
In-Reply-To: <20180716195657.GO30522@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, "Theodore Y. Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2018 at 9:57 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jul 16, 2018 at 09:48:43PM +0200, Jann Horn wrote:
> > When you e.g. run `find` on a directory for which getdents returns
> > "filenames" that contain slashes, `find` passes those "filenames" back to
> > the kernel, which then interprets them as paths. That could conceivably
> > cause userspace to do something bad when accessing something like an
> > untrusted USB stick, but I'm not aware of any specific example.
> >
> > Instead of returning bogus filenames to userspace, return -EUCLEAN.
>
> Because there's such a lot of userland code that expect and handles that
> error value...

Empirically, for example, "find" seems to handle it (by printing an
error message to its caller).

> I'm not sure if this mitigation is actually better than "just return it
> as-is", TBH.

Turning it into something that behaves approximately like an I/O error
seems way better to me than letting userspace run around wildly and
potentially (depending on the filename and what userspace is trying to
do) mess with unrelated files belonging to entirely different mounts.
For accidental corruption, that's probably not an issue; but when
dealing with something like a malicious vfat filesystem on a USB
stick, I imagine it could be problematic.
