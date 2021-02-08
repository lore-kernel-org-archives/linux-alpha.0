From: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] tmpfs: disallow CONFIG_TMPFS_INODE64 on alpha
Date: Mon, 8 Feb 2021 14:54:20 -0800 (PST)
Message-ID: <alpine.LSU.2.11.2102081451180.4656@eggly.anvils>
References: <20210208215726.608197-1-seth.forshee@canonical.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=kVUOEc5nkXmVvfZidGnyIjkcOxFERzMz3epUtID1enM=;
        b=HnBDHRhtT5UEp7iPoSHsC38SU/teqOAMudFS/tRIWgMSz/HRv5hjIF3E42OPTc2jby
         zkGe4KLfxuujJnSJ5+rjhLCzG+I8FCGeve+XqieANDs7k2Xv7Yp7y1Vf42I7AV5TjTTO
         Yr8Focc9SbKedfVNZGW6OYr+JoxVlonA3VUmkNnGmgd8iuSN7z4D6K5GhC75Z4wG0a7b
         BRo+0iixfOVaTdXnhgNxCBgdpF+McR5mmLTRJ12RorJdJ9WZK+pQOMDHu8eXZUjWJ0+m
         B7nS+1kmc0eNDYbXmd/DOLB08vClYB0J0dbv3CxTu+W+2BgZXi0AeAAigUg5Kggi1k5g
         Y1hw==
In-Reply-To: <20210208215726.608197-1-seth.forshee@canonical.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Down <chris@chrisdown.name>, Amir Goldstein <amir73il@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Mon, 8 Feb 2021, Seth Forshee wrote:

> As with s390, alpha is a 64-bit architecture with a 32-bit ino_t.
> With CONFIG_TMPFS_INODE64=y tmpfs mounts will get 64-bit inode
> numbers and display "inode64" in the mount options, whereas
> passing "inode64" in the mount options will fail. This leads to
> erroneous behaviours such as this:
> 
>  # mkdir mnt
>  # mount -t tmpfs nodev mnt
>  # mount -o remount,rw mnt
>  mount: /home/ubuntu/mnt: mount point not mounted or bad option.
> 
> Prevent CONFIG_TMPFS_INODE64 from being selected on alpha.
> 
> Fixes: ea3271f7196c ("tmpfs: support 64-bit inums per-sb")
> Cc: stable@vger.kernel.org # v5.9+
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Thanks,
Acked-by: Hugh Dickins <hughd@google.com>

> ---
>  fs/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index 3347ec7bd837..da524c4d7b7e 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -203,7 +203,7 @@ config TMPFS_XATTR
>  
>  config TMPFS_INODE64
>  	bool "Use 64-bit ino_t by default in tmpfs"
> -	depends on TMPFS && 64BIT && !S390
> +	depends on TMPFS && 64BIT && !(S390 || ALPHA)
>  	default n
>  	help
>  	  tmpfs has historically used only inode numbers as wide as an unsigned
> -- 
> 2.29.2
