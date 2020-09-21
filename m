From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/5] fs,nfs: lift compat nfs4 mount data handling into
 the nfs code
Date: Mon, 21 Sep 2020 20:11:23 +0200
Message-ID: <20200921181123.GA1776@lst.de>
References: <20200917082236.2518236-1-hch@lst.de> <20200917082236.2518236-3-hch@lst.de> <20200917171604.GW3421308@ZenIV.linux.org.uk> <20200917171826.GA8198@lst.de> <20200921064813.GB18559@lst.de> <CAFX2Jfks7QTS5crWa43mp4TQ3LoquvRxjuEeCpsZr1aees00eA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFX2Jfks7QTS5crWa43mp4TQ3LoquvRxjuEeCpsZr1aees00eA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anna Schumaker <anna.schumaker@netapp.com>
Cc: Christoph Hellwig <hch@lst.de>, Trond Myklebust <trond.myklebust@hammerspace.com>, Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>

On Mon, Sep 21, 2020 at 12:05:52PM -0400, Anna Schumaker wrote:
> This is for the binary mount stuff? That was already legacy code when
> I first started, and mount uses text options now. My preference is for
> keeping it as close to the original code as possible.

Ok.  Al, are you fine with the series as-is then?

> 
> I'm curious if you've been able to test this? I'm not sure if there is
> a way to force binary mount data through mount.nfs

The test is pretty trivial - even the most recent nfsutils supports the
binary mount data.  You just need to patch out the detection for a
modern kernel.
