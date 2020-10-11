From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 5/5] fs: remove do_mounts
Date: Sun, 11 Oct 2020 19:01:02 +0100
Message-ID: <20201011180102.GB3576660@ZenIV.linux.org.uk>
References: <20200917082236.2518236-1-hch@lst.de>
 <20200917082236.2518236-6-hch@lst.de>
 <20201011141749.GA126978@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201011141749.GA126978@roeck-us.net>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org

On Sun, Oct 11, 2020 at 07:17:49AM -0700, Guenter Roeck wrote:

> Someone didn't bother test building this patch.
> 
> arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_mount':
> arch/alpha/kernel/osf_sys.c:437:14: error: 'path' redeclared as different kind of symbol

Quite.  Matter of fact, there's another problem (path_mount()
that needs to be moved from fs/internal.h for that) and IMO this
is simply not worth bothering with.  I don't see any benefits
in the last commit in there; the next-to-last one has some
point, and it's not hard to fix, but since it clearly got
no testing whatsoever...  Christoph, if you want it back,
resend it later, *after* having tested it.  qemu-system-alpha
works well enough to boot the last released debian/alpha. 

For now I'm dropping the last two commits from that branch.
