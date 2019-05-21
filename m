From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] open: add close_range()
Date: Tue, 21 May 2019 13:23:13 -0700
Message-ID: <CAHk-=wgtHm4t71oKbykE=awiVv2H2wCy8yH0L_FsyhHQ5OSO+Q@mail.gmail.com>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
 <20190521164141.rbehqnghiej3gfua@brauner.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kcaAIaDR0H3GIEDIQLcBEDRl3VIG8RlAF/TPdFW/Qo=; b=ByvtOV/tniVCjx
	rQxI1bYyt65F7fqMHFv1ONJmDbs51AVL5J8Rg7Y6g9+Qo1093/P/ucM+xIgxVj1+Wv+RdXyDJYUkt
	Gj3WM6159SZQlkvawWIg/70emzZ4Js33l+IKrd5vm3oixEv61KB7P1x9skSgEjV8YW/xEIoYgB4eB
	xdVXCeOQpqhjgSBYLYCLyAnj++8YJyuWoCyBGR+ZqxkcUSCrmwNTons7s11OO1a2iHEa8FCeBbOPj
	6CXwoFh0GDwj+7KQY5/BD/0ECt5rujCWhSsntIlmy/G8E31pmC8BXsGUcO92ztKdRYgPHYmvpc4XP
	Dt3q6OfwKin6w0R7nbAA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mwA8SKkNo0NB1BSSFbQlGkhBkIi6dkzdh19hX1ggqqc=;
 b=E9cuWHFCD4Bgx1lOv97Ctr9bLKO3EjHQDpiZyM5FZUFuOxpsSHENK8V3oPkAEWY2CT
 4OwJ0l1afyS0KlYgZEStFftLyE7H7JbMd/BnYgfS8lVdq73pcYKuqkBJcrl7o7GLJZCx
 7466NcnIhfaDTvK1H+iwihEveSzhyKGC/2Zgk=
In-Reply-To: <20190521164141.rbehqnghiej3gfua@brauner.io>
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
To: Christian Brauner <christian@brauner.io>
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, David Howells <dhowells@redhat.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, tkjos@android.com, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "Dmitry V. Levin" <ldv@altlinux.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Florian Weimer <fweimer@redhat.com>, linux-parisc@vger.kernel.org, Linux API <linux-api@vger.kernel.org>

On Tue, May 21, 2019 at 9:41 AM Christian Brauner <christian@brauner.io> wrote:
>
> Yeah, you mentioned this before. I do like being able to specify an
> upper bound to have the ability to place fds strategically after said
> upper bound.

I suspect that's the case.

And if somebody really wants to just close everything and uses a large
upper bound, we can - if we really want to - just compare the upper
bound to the file table size, and do an optimized case for that. We do
that upper bound comparison anyway to limit the size of the walk, so
*if* it's a big deal, that case could then do the whole "shrink
fdtable" case too.

But I don't believe it's worth optimizing for unless somebody really
has a load where that is shown to be a big deal.   Just do the silly
and simple loop, and add a cond_resched() in the loop, like
close_files() does for the "we have a _lot_ of files open" case.

                   Linus
