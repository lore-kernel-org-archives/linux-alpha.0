From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 5/5] fs: remove do_mounts
Date: Sun, 11 Oct 2020 07:17:49 -0700
Message-ID: <20201011141749.GA126978@roeck-us.net>
References: <20200917082236.2518236-1-hch@lst.de>
 <20200917082236.2518236-6-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NdWG6HCrBS/BqpXsmrdRoBMmy2SE7zJ+cxa45t7HGkU=;
        b=u7fdlAaoi3vd2v0oil89YhSyuhGN03RvfKfu8uPhPrYDJKIbu6RA/RCz6M0kSyunDx
         Rsx30SR+5snZkMgMB2UnkXJr9FX1exLz8GPiQGEMNoyJditwfzHQdcWyMkzMXRxnjpAt
         2dCkewn0f1Mk5cbAgllG0C4Q4zfyW5BzFAIxMSo9baOzp8tJgv3MYeWwu8YeltkgGbSW
         cl7YltHO8oSr0IKjYlnGTn95a7QiynGPNif6MVBSSskZifX9O2QguQHvtcP7oWel3bTy
         R8NFllUCA8xQcNYSuLWdlP4EkrF9kX9m1ApfxcTb//Et3oIS1UqmnA2gw3/cPTdxf2GS
         ZAlw==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
In-Reply-To: <20200917082236.2518236-6-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org

On Thu, Sep 17, 2020 at 10:22:36AM +0200, Christoph Hellwig wrote:
> There are only two callers left, one of which is is in the alpha-specific
> OSF/1 compat code.  Just open code it in both.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/alpha/kernel/osf_sys.c |  7 ++++++-
>  fs/namespace.c              | 25 ++++++++-----------------
>  include/linux/fs.h          |  2 --
>  3 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 5fd155b13503b5..8acd5101097576 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -434,6 +434,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
                                                                                             ^^^^
>  	struct osf_mount_args tmp;
>  	struct filename *devname;
>  	const char *fstype;
> +	struct path path;
        ^^^^^^^^^^^^^^^^

Someone didn't bother test building this patch.

arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_mount':
arch/alpha/kernel/osf_sys.c:437:14: error: 'path' redeclared as different kind of symbol

Guenter

>  	int retval;
>  
>  	if (copy_from_user(&tmp, args, sizeof(tmp)))
> @@ -467,7 +468,11 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
>  
>  	if (IS_ERR(devname))
>  		return PTR_ERR(devname);
> -	retval = do_mount(devname.name, dirname, fstype, flags, NULL);
> +	retval = user_path_at(AT_FDCWD, dirname, LOOKUP_FOLLOW, &path);
> +	if (!retval) {
> +		ret = path_mount(devname.name, &path, fstype, flags, NULL);
> +		path_put(&path);
> +	}
>  	putname(devname);
>  	return retval;
>  }
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 12b431b61462b9..2ff373ebeaf27f 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -3193,20 +3193,6 @@ int path_mount(const char *dev_name, struct path *path,
>  			    data_page);
>  }
>  
> -long do_mount(const char *dev_name, const char __user *dir_name,
> -		const char *type_page, unsigned long flags, void *data_page)
> -{
> -	struct path path;
> -	int ret;
> -
> -	ret = user_path_at(AT_FDCWD, dir_name, LOOKUP_FOLLOW, &path);
> -	if (ret)
> -		return ret;
> -	ret = path_mount(dev_name, &path, type_page, flags, data_page);
> -	path_put(&path);
> -	return ret;
> -}
> -
>  static struct ucounts *inc_mnt_namespaces(struct user_namespace *ns)
>  {
>  	return inc_ucount(ns, current_euid(), UCOUNT_MNT_NAMESPACES);
> @@ -3390,10 +3376,11 @@ EXPORT_SYMBOL(mount_subtree);
>  SYSCALL_DEFINE5(mount, char __user *, dev_name, char __user *, dir_name,
>  		char __user *, type, unsigned long, flags, void __user *, data)
>  {
> -	int ret;
> +	struct path path;
>  	char *kernel_type;
>  	char *kernel_dev;
>  	void *options;
> +	int ret;
>  
>  	kernel_type = copy_mount_string(type);
>  	ret = PTR_ERR(kernel_type);
> @@ -3410,8 +3397,12 @@ SYSCALL_DEFINE5(mount, char __user *, dev_name, char __user *, dir_name,
>  	if (IS_ERR(options))
>  		goto out_data;
>  
> -	ret = do_mount(kernel_dev, dir_name, kernel_type, flags, options);
> -
> +	ret = user_path_at(AT_FDCWD, dir_name, LOOKUP_FOLLOW, &path);
> +	if (ret)
> +		goto out_options;
> +	ret = path_mount(kernel_dev, &path, kernel_type, flags, options);
> +	path_put(&path);
> +out_options:
>  	kfree(options);
>  out_data:
>  	kfree(kernel_dev);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 7519ae003a082c..bd9878bdd4bfe9 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2292,8 +2292,6 @@ extern struct vfsmount *kern_mount(struct file_system_type *);
>  extern void kern_unmount(struct vfsmount *mnt);
>  extern int may_umount_tree(struct vfsmount *);
>  extern int may_umount(struct vfsmount *);
> -extern long do_mount(const char *, const char __user *,
> -		     const char *, unsigned long, void *);
>  extern struct vfsmount *collect_mounts(const struct path *);
>  extern void drop_collected_mounts(struct vfsmount *);
>  extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
