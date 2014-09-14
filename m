From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] vfs: move getname() from callers to do_mount()
Date: Sun, 14 Sep 2014 19:12:59 +0100
Message-ID: <20140914181259.GQ7996@ZenIV.linux.org.uk>
References: <1410537212-3153-1-git-send-email-waydi1@gmail.com>
 <1410700510-15408-1-git-send-email-waydi1@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410700510-15408-1-git-send-email-waydi1@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seunghun Lee <waydi1@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, jlayton@poochiereds.net, bfields@fieldses.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Sun, Sep 14, 2014 at 10:15:10PM +0900, Seunghun Lee wrote:
> It would make more sense to pass char __user * instead of
> char * in callers of do_mount() and do getname() inside do_mount().
> 
> Suggested-by: Al Viro <viro@ZenIV.linux.org.uk>
> Signed-off-by: Seunghun Lee <waydi1@gmail.com>

Applied with one modification: this getname/kern_path/putname is equivalent to
user_path(dir_name, &path) and do_mount() becomes simpler if we use that
instead of not-quite-opencoding it.

Beginning of do_mount() becomes simply
        /* Discard magic */
        if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
                flags &= ~MS_MGC_MSK;

        /* Basic sanity checks */
        if (data_page)
                ((char *)data_page)[PAGE_SIZE - 1] = 0;

        /* ... and get the mountpoint */
        retval = user_path(dir_name, &path);
        if (retval)
                return retval;
that way, and there's no struct filename * to discard on exit; getname and
putname are done inside user_path().
