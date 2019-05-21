From: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 1/2] open: add close_range()
Date: Tue, 21 May 2019 15:23:23 +0200
Message-ID: <20190521132252.y5wt7d7o4bdjns4e@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
 <20190521130438.q3u4wvve7p6md6cm@brauner.io>
 <87h89o9cng.fsf@oldenburg2.str.redhat.com>
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
	List-Owner; bh=4+esLSpuKkxOIiH+qi8nzG7kY8oOp99vcD5HHc7LBSc=; b=u+NZqYZG6ARtCX
	xZ8KH0+ZI7xWmxPyTthBVwIRq1HOgqV54y3tMIctpo5J0aDmR89L8Gpc12UZN5+m5s4qgCAPig3fA
	8OT0JgmXWyAv2ci67I3GZWQ3JSn+9r6z+MlfKxmmdnZ1BegvIUxI6fgF7pDWcZO5pKNB+pAtuttMG
	38szuOzTHiuKdzqZv37C1VY66xSQzIJDvZL0iXG/ZpdboZTAovyVyhK9jaU7XfriPEZICaTLnZ44W
	AHxdHFnThX7Kypr+OugaLcKblfM0d4tW5pmsardoJBkMycd0R53U5XhkAnuVIWfs98UZboZSKB851
	sNrPwqqekRmSymjTTfCw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zPeZPlO76ltnQqvYGINFToUvBJmXqM645QmEt4Hw6Rc=;
 b=BUu5zjdtN4tz3uDq/7UpOx4K4hUQVJBWS+eEuFLdpi6Rmwdp0HavCUwLV8syhoRhBs
 uutuEJthT54zEPxESFMYXggKMqpF+e9kjCS2KXB6a8V8DjwFSU/ukGJ+bjlCRLwN7Itn
 NioFIdnrRyEyEXF9J8PaDiZ1BKte4njCTV4UqMcQIxHCp36wZKBXLuGaTuzR077IIyGB
 sh/VNZyNC9dytmpNSG0A/cuTGl76M/BtkEN2Bj2PP9spj3uzju6GRwQbZsYefL3l1zFQ
 DUpnJfPzQ1HZROA8RvSmOKB1jZ+QySIxvLrPIvBwJ5t1t+aSsSSgiGJe52BZXhX2b2t5
 /pjA==
Content-Disposition: inline
In-Reply-To: <87h89o9cng.fsf@oldenburg2.str.redhat.com>
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
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org, torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de, jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk, tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, oleg@redhat.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Tue, May 21, 2019 at 03:10:11PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> >> Solaris has an fdwalk function:
> >> 
> >>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> >> 
> >> So a different way to implement this would expose a nextfd system call
> >
> > Meh. If nextfd() then I would like it to be able to:
> > - get the nextfd(fd) >= fd
> > - get highest open fd e.g. nextfd(-1)
> 
> The highest open descriptor isn't istering for fdwalk because nextfd
> would just fail.

Sure. I was thinking about other usecases. For example, sometimes in
userspace you want to do the following:
save_fd = dup(fd, <well-known-number-at-the-end-of-the-range);
close_range(3, (save_fd - 1));

Which brings me to another point. So even if we don't do close_range() I
would like libc to maybe give us something like close_range() for such
scenarios.

> 
> > But then I wonder if nextfd() needs to be a syscall and isn't just
> > either:
> > fcntl(fd, F_GET_NEXT)?
> > or
> > prctl(PR_GET_NEXT)?
> 
> I think the fcntl route is a bit iffy because you might need it to get
> the *first* valid descriptor.
> 
> >> to userspace, so that we can use that to implement both fdwalk and
> >> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> >> /proc.
> >
> > Yeah we probably don't need fdwalk.
> 
> Agreed.  Just wanted to bring it up for completeness.  I certainly don't
> want to derail the implementation of close_range.
> 
> Thanks,
> Florian
