From: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH v3 1/2] fs: don't let getdents return bogus names
Date: Tue, 15 Jan 2019 11:00:46 +1100
Message-ID: <20190115000046.GR27534@dastard>
References: <20190114182318.110443-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114182318.110443-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>

On Mon, Jan 14, 2019 at 07:23:17PM +0100, Jann Horn wrote:
> When you e.g. run `find` on a directory for which getdents returns
> "filenames" that contain slashes, `find` passes those "filenames" back to
> the kernel, which then interprets them as paths. That could conceivably
> cause userspace to do something bad when accessing something like an
> untrusted USB stick, but I'm not aware of any specific example.
> 
> Instead of returning bogus filenames to userspace, return -EUCLEAN.

Please don't use EUCLEAN directly to indicate filesystem corruption
directly.  If we want to indicate that the filesystem is corrupted,
please hoist the multiple XFS/ext4 definitions of:

#define EFSCORRUPTED EUCLEAN

up into include/uapi/asm-generic/errno.h and then use EFSCORRUPTED
in all the places where we want to indicate to userspace that the
filesystem is corrupted. That tells both the code reader and the
userspace developers that it's a corruption error and puts context
to the "structure needs cleaning" text that goes along with it...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
