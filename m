From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4/5] alpha: simplify osf_mount
Date: Sun, 11 Oct 2020 07:22:55 -0700
Message-ID: <20201011142255.GA203430@roeck-us.net>
References: <20200917082236.2518236-1-hch@lst.de>
 <20200917082236.2518236-5-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cygGmMKwe8ox8+ba1k/Dv7fr+XqllMIbIsz8Hntkd5E=;
        b=miZzENfpfIyXwxc6OW51smuOi4U1lomaRMltfa7/X76qVjOXEeimYZOOPQ9PObxdYf
         WEHQ4+poOU4TN1L/g9+12WGu/UuLDNgpPlzg1T8nFe6BgNlv/BfRniP+kZ9/GqkTk+q+
         /ER9hkLgEIfvimq03KeLc3Lsl1GRE5F+Ja+3k4UyHQaj0fXBEsz2D2Mf+ZrNndvLPwa6
         kZgE1LsJLKaWbq2bD0dwUi+o5KfIWEEiQye6NxUTOQMOFW6lZyU3S8a1xhJ8uUU/F6AQ
         fVtnzz4QDtB80I9Od3Cs1leiyLEyup9U8CllC68x4jvIpaxJ4QKpGDcOs2raLSnz/G3S
         6Usw==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
In-Reply-To: <20200917082236.2518236-5-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org

On Thu, Sep 17, 2020 at 10:22:35AM +0200, Christoph Hellwig wrote:
> Merge the mount_args structures and mount helpers to simplify the code a
> bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/alpha/kernel/osf_sys.c | 111 +++++++++---------------------------
>  1 file changed, 28 insertions(+), 83 deletions(-)
> 
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index d5367a1c6300c1..5fd155b13503b5 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -421,109 +421,54 @@ SYSCALL_DEFINE3(osf_fstatfs64, unsigned long, fd,
>   *
>   * Although to be frank, neither are the native Linux/i386 ones..
>   */
> -struct ufs_args {
> +struct osf_mount_args {
>  	char __user *devname;
>  	int flags;
>  	uid_t exroot;
> +	/* this has lots more here for cdfs at least, but we don't bother */
>  };
>  
> -struct cdfs_args {
> -	char __user *devname;
> -	int flags;
> -	uid_t exroot;
> -
> -	/* This has lots more here, which Linux handles with the option block
> -	   but I'm too lazy to do the translation into ASCII.  */
> -};
> -
> -struct procfs_args {
> -	char __user *devname;
> -	int flags;
> -	uid_t exroot;
> -};
> -
> -/*
> - * We can't actually handle ufs yet, so we translate UFS mounts to
> - * ext2fs mounts. I wouldn't mind a UFS filesystem, but the UFS
> - * layout is so braindead it's a major headache doing it.
> - *
> - * Just how long ago was it written? OTOH our UFS driver may be still
> - * unhappy with OSF UFS. [CHECKME]
> - */
> -static int
> -osf_ufs_mount(const char __user *dirname,
> -	      struct ufs_args __user *args, int flags)
> +SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
> +		int, flag, void __user *, data)
>  {
> -	int retval;
> -	struct cdfs_args tmp;
> +	struct osf_mount_args tmp;
>  	struct filename *devname;
> -
> -	retval = -EFAULT;
> -	if (copy_from_user(&tmp, args, sizeof(tmp)))
> -		goto out;
> -	devname = getname(tmp.devname);
> -	retval = PTR_ERR(devname);
> -	if (IS_ERR(devname))
> -		goto out;
> -	retval = do_mount(devname->name, dirname, "ext2", flags, NULL);
> -	putname(devname);
> - out:
> -	return retval;
> -}
> -
> -static int
> -osf_cdfs_mount(const char __user *dirname,
> -	       struct cdfs_args __user *args, int flags)
> -{
> +	const char *fstype;
>  	int retval;
> -	struct cdfs_args tmp;
> -	struct filename *devname;
> -
> -	retval = -EFAULT;
> -	if (copy_from_user(&tmp, args, sizeof(tmp)))
> -		goto out;
> -	devname = getname(tmp.devname);
> -	retval = PTR_ERR(devname);
> -	if (IS_ERR(devname))
> -		goto out;
> -	retval = do_mount(devname->name, dirname, "iso9660", flags, NULL);
> -	putname(devname);
> - out:
> -	return retval;
> -}
> -
> -static int
> -osf_procfs_mount(const char __user *dirname,
> -		 struct procfs_args __user *args, int flags)
> -{
> -	struct procfs_args tmp;
>  
>  	if (copy_from_user(&tmp, args, sizeof(tmp)))
>  		return -EFAULT;
>  
arch/alpha/kernel/osf_sys.c:440:27: error: 'args' undeclared (first use in this function)

> -	return do_mount("", dirname, "proc", flags, NULL);
> -}
> -
> -SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
> -		int, flag, void __user *, data)
> -{
> -	int retval;
> -
>  	switch (typenr) {
> -	case 1:
> -		retval = osf_ufs_mount(path, data, flag);
> +	case 1: /* ufs */
> +		/*
> +		 * We can't actually handle ufs yet, so we translate UFS mounts
> +		 * to ext2 mounts. I wouldn't mind a UFS filesystem, but the UFS
> +		 * layout is so braindead it's a major headache doing it.
> +		 *
> +		 * Just how long ago was it written? OTOH our UFS driver may be
> +		 * still unhappy with OSF UFS. [CHECKME]
> +		 */
> +		fstype = "ext2";
> +		devname = getname(tmp.devname);
>  		break;
> -	case 6:
> -		retval = osf_cdfs_mount(path, data, flag);
> +	case 6: /* cdfs */
> +		fstype = "iso9660";
> +		devname = getname(tmp.devname);
>  		break;
> -	case 9:
> -		retval = osf_procfs_mount(path, data, flag);
> +	case 9: /* procfs */
> +		fstype = "proc";
> +		devname = getname_kernel("");
>  		break;
>  	default:
> -		retval = -EINVAL;
>  		printk("osf_mount(%ld, %x)\n", typenr, flag);
> +		return -EINVAL;
>  	}
>  
> +	if (IS_ERR(devname))
> +		return PTR_ERR(devname);
> +	retval = do_mount(devname.name, dirname, fstype, flags, NULL);

arch/alpha/kernel/osf_sys.c:471:34: error:
	'dirname' undeclared (first use in this function); did you mean 'devname'?

> +	putname(devname);
>  	return retval;
>  }
>  
