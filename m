From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] fs: don't let getdents return bogus names
Date: Mon, 16 Jul 2018 20:56:57 +0100
Message-ID: <20180716195657.GO30522@ZenIV.linux.org.uk>
References: <20180716194843.252772-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180716194843.252772-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 16, 2018 at 09:48:43PM +0200, Jann Horn wrote:
> When you e.g. run `find` on a directory for which getdents returns
> "filenames" that contain slashes, `find` passes those "filenames" back to
> the kernel, which then interprets them as paths. That could conceivably
> cause userspace to do something bad when accessing something like an
> untrusted USB stick, but I'm not aware of any specific example.
> 
> Instead of returning bogus filenames to userspace, return -EUCLEAN.

Because there's such a lot of userland code that expect and handles that
error value...

I'm not sure if this mitigation is actually better than "just return it
as-is", TBH.
