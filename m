From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Date: Fri, 12 Jul 2019 13:39:24 +0100
Message-ID: <20190712123924.GK17978@ZenIV.linux.org.uk>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
 <20190712105745.nruaftgeat6irhzr@yavin>
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
	List-Owner; bh=Li+Jk1ERv4oO1wWotXfNLNGjZAdMbL44Yonr13UtOwM=; b=fmuyRb3JbH7JBl
	K48Ef19ha+k2sc16c2VuzEnU9B2eDCn8Gp2SEWB4h6qnBLGn8CYSudxyEU7R06yl/SD/pXSIpX8du
	fDxvzPM4oCusmuxcXnZZqZbmvJCfKVl+AqeMEh2ZAbV+kJuyA03MNukboqBRnkI9kQ+RDLm746Mlk
	U2fVgDLqzu5P1aaz7K248PIsx4xXjFjt4d6Bi18x4eti3I6WXiJkprgM3YV6/NCJ5PglMVwdaZzd/
	vGiPyHFEC6Bji1qoQ5mN1vngc+h7j69n6okttEf1MXzckeeTSpvA5ZYi4PVD7djSShkQXZTR1BG1L
	sUNEuNCYLDJMaeVNUlVw==;
Content-Disposition: inline
In-Reply-To: <20190712105745.nruaftgeat6irhzr@yavin>
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

On Fri, Jul 12, 2019 at 08:57:45PM +1000, Aleksa Sarai wrote:

> > > @@ -2350,9 +2400,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
> > >  			s = ERR_PTR(error);
> > >  		return s;
> > >  	}
> > > -	error = dirfd_path_init(nd);
> > > -	if (unlikely(error))
> > > -		return ERR_PTR(error);
> > > +	if (likely(!nd->path.mnt)) {
> > 
> > Is that a weird way of saying "if we hadn't already called dirfd_path_init()"?
> 
> Yes. I did it to be more consistent with the other "have we got the
> root" checks elsewhere. Is there another way you'd prefer I do it?

"Have we got the root" checks are inevitable evil; here you are making the
control flow in a single function hard to follow.

I *think* what you are doing is
	absolute pathname, no LOOKUP_BENEATH:
		set_root
		error = nd_jump_root(nd)
	else
		error = dirfd_path_init(nd)
	return unlikely(error) ? ERR_PTR(error) : s;
which should be a lot easier to follow (not to mention shorter), but I might
be missing something in all of that.
