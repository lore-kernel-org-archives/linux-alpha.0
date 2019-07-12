From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Date: Fri, 12 Jul 2019 14:25:53 +0100
Message-ID: <20190712132553.GN17978@ZenIV.linux.org.uk>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
 <20190712105745.nruaftgeat6irhzr@yavin>
 <20190712123924.GK17978@ZenIV.linux.org.uk>
 <20190712125552.GL17978@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AJVh5wDvTLPMmzgGYz1CmQZJBPgy5mgVTQWwgpv08U=; b=g0vJ6U/rU+G1Ud
	pAzVCUeh+7/KN66UuXKhu/1GFsiJ6dGwfzJghJwv4aBWfantC3kxfSz+ekFIx37jEgAafJOKl+2Lz
	M8nGoX0qwGaRvm7Z5kvAZegifDLSIJK3Mui8OPndJX1/iH8oeCxc0/IJHkdXfZ95Vph/7RX47+Yhf
	jw3qgHP6QCeht1kwTBo7eGyoTG5C5mxn49Hpp2/ORUt6a2d1gD6/F9Jf6pyIV/i68AOX5II1hUNR5
	uZ3OAojLeUTABF/9evCDnUOatW1xWvt8417mPPRiQVy0+2kNtJQ5v8zSEI5IUFUkxQd1JmuCqs/ut
	MqJVxKZzIUqxChDM7CLg==;
Content-Disposition: inline
In-Reply-To: <20190712125552.GL17978@ZenIV.linux.org.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>, "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, Ch

On Fri, Jul 12, 2019 at 01:55:52PM +0100, Al Viro wrote:
> On Fri, Jul 12, 2019 at 01:39:24PM +0100, Al Viro wrote:
> > On Fri, Jul 12, 2019 at 08:57:45PM +1000, Aleksa Sarai wrote:
> > 
> > > > > @@ -2350,9 +2400,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
> > > > >  			s = ERR_PTR(error);
> > > > >  		return s;
> > > > >  	}
> > > > > -	error = dirfd_path_init(nd);
> > > > > -	if (unlikely(error))
> > > > > -		return ERR_PTR(error);
> > > > > +	if (likely(!nd->path.mnt)) {
> > > > 
> > > > Is that a weird way of saying "if we hadn't already called dirfd_path_init()"?
> > > 
> > > Yes. I did it to be more consistent with the other "have we got the
> > > root" checks elsewhere. Is there another way you'd prefer I do it?
> > 
> > "Have we got the root" checks are inevitable evil; here you are making the
> > control flow in a single function hard to follow.
> > 
> > I *think* what you are doing is
> > 	absolute pathname, no LOOKUP_BENEATH:
> > 		set_root
> > 		error = nd_jump_root(nd)
> > 	else
> > 		error = dirfd_path_init(nd)
> > 	return unlikely(error) ? ERR_PTR(error) : s;
> > which should be a lot easier to follow (not to mention shorter), but I might
> > be missing something in all of that.
> 
> PS: if that's what's going on, I would be tempted to turn the entire
> path_init() part into this:
> 	if (flags & LOOKUP_BENEATH)
> 		while (*s == '/')
> 			s++;
> in the very beginning (plus the handling of nd_jump_root() prototype
> change, but that belongs with nd_jump_root() change itself, obviously).
> Again, I might be missing something here...

Argh... I am, at that - you have setting path->root (and grabbing it)
in LOOKUP_BENEATH cases and you do it after dirfd_path_init().  So
how about
	if (flags & LOOKUP_BENEATH)
		while (*s == '/')
			s++;
before the whole thing and
        if (*s == '/') { /* can happen only without LOOKUP_BENEATH */
                set_root(nd);
		error = nd_jump_root(nd);
		if (unlikely(error))
			return ERR_PTR(error);
        } else if (nd->dfd == AT_FDCWD) {
                if (flags & LOOKUP_RCU) {
                        struct fs_struct *fs = current->fs;
                        unsigned seq;

                        do {
                                seq = read_seqcount_begin(&fs->seq);
                                nd->path = fs->pwd;
                                nd->inode = nd->path.dentry->d_inode;
                                nd->seq = __read_seqcount_begin(&nd->path.dentry->d_seq);
                        } while (read_seqcount_retry(&fs->seq, seq));
                } else {
                        get_fs_pwd(current->fs, &nd->path);
                        nd->inode = nd->path.dentry->d_inode;
                }  
        } else {
                /* Caller must check execute permissions on the starting path component */
                struct fd f = fdget_raw(nd->dfd);
                struct dentry *dentry;

                if (!f.file)
                        return ERR_PTR(-EBADF);

                dentry = f.file->f_path.dentry;

                if (*s && unlikely(!d_can_lookup(dentry))) {
                        fdput(f);
                        return ERR_PTR(-ENOTDIR);
                }

                nd->path = f.file->f_path;
                if (flags & LOOKUP_RCU) {
                        nd->inode = nd->path.dentry->d_inode;
                        nd->seq = read_seqcount_begin(&nd->path.dentry->d_seq);
                } else {
                        path_get(&nd->path);
                        nd->inode = nd->path.dentry->d_inode;
                }
                fdput(f);
        }
	if (flags & LOOKUP_BENEATH) {
		nd->root = nd->path;
		if (!(flags & LOOKUP_RCU))
			path_get(&nd->root);
		else
			nd->root_seq = nd->seq;
	}
	return s;
replacing the part in the end?  Makes for much smaller change; it might
very well still make sense to add dirfd_path_init() as a separate
cleanup (perhaps with the *s == '/' case included), though.
