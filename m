From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 1/2] fs: don't let getdents return bogus names
Date: Fri, 18 Jan 2019 17:22:50 +0100
Message-ID: <CAG48ez22Mc=t7_=WpZdLFJhShk8xMQb=G2dem56NXK2JgXh-Ng@mail.gmail.com>
References: <20190114182318.110443-1-jannh@google.com> <20190115000046.GR27534@dastard>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NYmAocf0BnEwnPh37EKXz0D4WFm/LnSM1+UNP94iKo8=;
        b=MJdW4DC2Se9FH7yLlU5PlbJZzU1r7UuXn0yRa/U5hmXRMBh/iWoYbv/RhguLKR0wVf
         /GonJfULt0d7uBJawZyXZJNZRjXkZ1o7wklHOrJtt9r+dleaq+zomyeN4sQBaBZsXVCQ
         e96dycDeBIz4XAFgdHR1MWrRPmbVk5C1K76PHMuETWNXME3m4Zvo7dMHgeM+s+LrLZwE
         THk4y3m5rrpvi0QOQSjQnB14FGxfw4JodJgmneTxvRrtQewW6tgdY+DPxJ9FDfT24Cce
         YwinyrkeLolMaK0FRfyZR6zQcing15NQnwNmRcjP9/6+GVRPK1oB/wMEIxkt+o4igLNb
         I0qg==
In-Reply-To: <20190115000046.GR27534@dastard>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>

On Tue, Jan 15, 2019 at 1:01 AM Dave Chinner <david@fromorbit.com> wrote:
> On Mon, Jan 14, 2019 at 07:23:17PM +0100, Jann Horn wrote:
> > When you e.g. run `find` on a directory for which getdents returns
> > "filenames" that contain slashes, `find` passes those "filenames" back to
> > the kernel, which then interprets them as paths. That could conceivably
> > cause userspace to do something bad when accessing something like an
> > untrusted USB stick, but I'm not aware of any specific example.
> >
> > Instead of returning bogus filenames to userspace, return -EUCLEAN.
>
> Please don't use EUCLEAN directly to indicate filesystem corruption
> directly.  If we want to indicate that the filesystem is corrupted,
> please hoist the multiple XFS/ext4 definitions of:
>
> #define EFSCORRUPTED EUCLEAN
>
> up into include/uapi/asm-generic/errno.h and then use EFSCORRUPTED

Alright, I've added a patch that moves EFSCORRUPTED into the uapi
header in front of my series and changed the following patches to use
EFSCORRUPTED instead of EUCLEAN; see the v4 version I just sent out.
