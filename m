From: Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [PATCH 2/5] fs,nfs: lift compat nfs4 mount data handling into the
 nfs code
Date: Mon, 21 Sep 2020 12:05:52 -0400
Message-ID: <CAFX2Jfks7QTS5crWa43mp4TQ3LoquvRxjuEeCpsZr1aees00eA@mail.gmail.com>
References: <20200917082236.2518236-1-hch@lst.de> <20200917082236.2518236-3-hch@lst.de>
 <20200917171604.GW3421308@ZenIV.linux.org.uk> <20200917171826.GA8198@lst.de> <20200921064813.GB18559@lst.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20200921064813.GB18559@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>

This is for the binary mount stuff? That was already legacy code when
I first started, and mount uses text options now. My preference is for
keeping it as close to the original code as possible.

I'm curious if you've been able to test this? I'm not sure if there is
a way to force binary mount data through mount.nfs

Anna

On Mon, Sep 21, 2020 at 2:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Sep 17, 2020 at 07:18:26PM +0200, Christoph Hellwig wrote:
> > On Thu, Sep 17, 2020 at 06:16:04PM +0100, Al Viro wrote:
> > > On Thu, Sep 17, 2020 at 10:22:33AM +0200, Christoph Hellwig wrote:
> > > > There is no reason the generic fs code should bother with NFS specific
> > > > binary mount data - lift the conversion into nfs4_parse_monolithic
> > > > instead.
> > >
> > > Considering the size of struct compat_nfs4_mount_data_v1...  Do we really
> > > need to bother with that "copy in place, so we go through the fields
> > > backwards" logics?  Just make that
> > >
> > > > +static void nfs4_compat_mount_data_conv(struct nfs4_mount_data *data)
> > > > +{
> > >     struct compat_nfs4_mount_data_v1 compat;
> > >     compat = *(struct compat_nfs4_mount_data_v1 *)data;
> > > and copy the damnt thing without worrying about the field order...
> >
> > Maybe.  But then again why bother?  I just sticked to the existing
> > code as much as possible.
>
> Trond, Anna: what is your preference?
