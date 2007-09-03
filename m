From: "Michal Piotrowski" <michal.k.k.piotrowski@gmail.com>
Subject: Re: [1/4] 2.6.23-rc5: known regressions
Date: Mon, 3 Sep 2007 12:36:09 +0200
Message-ID: <6bffcb0e0709030336g8d9fa1ao92b9d793fb18c66a@mail.gmail.com>
References: <46DBDD6E.9020007@googlemail.com> <46DBDDF0.3090203@l4x.org>
	 <6bffcb0e0709030314t28c0102dr41f3c7b75b134cfa@mail.gmail.com>
	 <20070903102347.GQ16016@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=Rzxjv2ZgRGFXKTRONkBd0kVrOszLknN+e08/AXqSIGz7YaNNSUQWhyB4vxriyvxwLHN0v6eYsZGe4uWhuxsnOHU8B1oaxNJQq0Env6Qv5F0JiSVIHo5BSXcuHjzFvDDEfscbeUdewJv3oxm8ksLiUYg7KshCkUi3ER/mWSmTXbw=
In-Reply-To: <20070903102347.GQ16016@stusta.de>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Jan Dittmer <jdi@l4x.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On 03/09/07, Adrian Bunk <bunk@kernel.org> wrote:
> On Mon, Sep 03, 2007 at 12:14:05PM +0200, Michal Piotrowski wrote:
> > On 03/09/07, Jan Dittmer <jdi@l4x.org> wrote:
> > > Michal Piotrowski wrote:
> > > > Subject         : 2.6.23-rc2 cross compile regressions (alpha,xtensa)
> > > > References      : http://lkml.org/lkml/2007/8/6/43
> > > > Last known good : alpha: 2.6.22-git8
> > > >                   xtensa: 2.6.22-git6
> > > > Submitter       : Jan Dittmer <jdi@l4x.org>
> > > > Caused-By       : ?
> > > > Handled-By      : xtensa: Christian Zankel <chris@zankel.net>
> > > > Status          : unknown
> > >
> > > Both are fixed as of -rc5
> >
> > Thanks. I will try to figure out who fixed these bugs.
>
> alpha was commit aa137f9d29d30592774c727ec5cfcf9891e576fa
> xtensa was commit b5f281a62761887e7cb5f60fa81f7cd052fec5cb

Thanks!

>
> > Regards,
> > Michal
>
> cu
> Adrian

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
