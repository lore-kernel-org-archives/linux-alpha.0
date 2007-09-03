From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [1/4] 2.6.23-rc5: known regressions
Date: Mon, 3 Sep 2007 12:23:47 +0200
Message-ID: <20070903102347.GQ16016@stusta.de>
References: <46DBDD6E.9020007@googlemail.com> <46DBDDF0.3090203@l4x.org> <6bffcb0e0709030314t28c0102dr41f3c7b75b134cfa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6bffcb0e0709030314t28c0102dr41f3c7b75b134cfa@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Jan Dittmer <jdi@l4x.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Mon, Sep 03, 2007 at 12:14:05PM +0200, Michal Piotrowski wrote:
> On 03/09/07, Jan Dittmer <jdi@l4x.org> wrote:
> > Michal Piotrowski wrote:
> > > Subject         : 2.6.23-rc2 cross compile regressions (alpha,xtensa)
> > > References      : http://lkml.org/lkml/2007/8/6/43
> > > Last known good : alpha: 2.6.22-git8
> > >                   xtensa: 2.6.22-git6
> > > Submitter       : Jan Dittmer <jdi@l4x.org>
> > > Caused-By       : ?
> > > Handled-By      : xtensa: Christian Zankel <chris@zankel.net>
> > > Status          : unknown
> >
> > Both are fixed as of -rc5
> 
> Thanks. I will try to figure out who fixed these bugs.

alpha was commit aa137f9d29d30592774c727ec5cfcf9891e576fa
xtensa was commit b5f281a62761887e7cb5f60fa81f7cd052fec5cb

> Regards,
> Michal

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

