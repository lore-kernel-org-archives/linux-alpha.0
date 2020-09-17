From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/5] fs,nfs: lift compat nfs4 mount data handling into
 the nfs code
Date: Thu, 17 Sep 2020 19:18:26 +0200
Message-ID: <20200917171826.GA8198@lst.de>
References: <20200917082236.2518236-1-hch@lst.de> <20200917082236.2518236-3-hch@lst.de> <20200917171604.GW3421308@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200917171604.GW3421308@ZenIV.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org

On Thu, Sep 17, 2020 at 06:16:04PM +0100, Al Viro wrote:
> On Thu, Sep 17, 2020 at 10:22:33AM +0200, Christoph Hellwig wrote:
> > There is no reason the generic fs code should bother with NFS specific
> > binary mount data - lift the conversion into nfs4_parse_monolithic
> > instead.
> 
> Considering the size of struct compat_nfs4_mount_data_v1...  Do we really
> need to bother with that "copy in place, so we go through the fields
> backwards" logics?  Just make that
> 
> > +static void nfs4_compat_mount_data_conv(struct nfs4_mount_data *data)
> > +{
> 	struct compat_nfs4_mount_data_v1 compat;
> 	compat = *(struct compat_nfs4_mount_data_v1 *)data;
> and copy the damnt thing without worrying about the field order...

Maybe.  But then again why bother?  I just sticked to the existing
code as much as possible.
