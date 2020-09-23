From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/5] fs,nfs: lift compat nfs4 mount data handling into
 the nfs code
Date: Wed, 23 Sep 2020 04:45:13 +0100
Message-ID: <20200923034513.GF3421308@ZenIV.linux.org.uk>
References: <20200917082236.2518236-1-hch@lst.de>
 <20200917082236.2518236-3-hch@lst.de>
 <20200917171604.GW3421308@ZenIV.linux.org.uk>
 <20200917171826.GA8198@lst.de>
 <20200921064813.GB18559@lst.de>
 <CAFX2Jfks7QTS5crWa43mp4TQ3LoquvRxjuEeCpsZr1aees00eA@mail.gmail.com>
 <20200921181123.GA1776@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200921181123.GA1776@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>

On Mon, Sep 21, 2020 at 08:11:23PM +0200, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 12:05:52PM -0400, Anna Schumaker wrote:
> > This is for the binary mount stuff? That was already legacy code when
> > I first started, and mount uses text options now. My preference is for
> > keeping it as close to the original code as possible.
> 
> Ok.  Al, are you fine with the series as-is then?

I can live with that.  I'm not fond of in_compat_syscall() proliferation,
but in this case it's reasonably sane...

OK, applied.
