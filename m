From: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH] fs: don't let getdents return bogus names
Date: Thu, 19 Jul 2018 10:50:00 +1000
Message-ID: <20180719005000.GE19934@dastard>
References: <20180716194843.252772-1-jannh@google.com>
 <20180716195657.GO30522@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180716195657.GO30522@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Jann Horn <jannh@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 16, 2018 at 08:56:57PM +0100, Al Viro wrote:
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

We've been using EUCLEAN ("structure needs cleaning") for indicating
filesystem corruption errors for many years now. e.g.

fs/ext2/ext2.h:#define  EFSCORRUPTED                    EUCLEAN /* Filesystem is corrupted */
fs/ext4/ext4.h:#define EFSCORRUPTED     EUCLEAN         /* Filesystem is corrupted */
fs/hpfs/hpfs_fn.h:#define EFSERROR  EUCLEAN
fs/xfs/xfs_linux.h:#define EFSCORRUPTED EUCLEAN         /* Filesystem is corrupted */
include/linux/jbd2.h:#define EFSCORRUPTED       EUCLEAN         /* Filesystem is corrupted */

There's hundreds of places in the filesystem code that this
specific error is returned to userspace - there's more than 500
individual places this error can be returned from just XFS....

To me it seems like the right error to return if a dirent is
corrupted, because that's exactly what XFS will return if any of the
directory structure around the dirent name itself is corrupt...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
