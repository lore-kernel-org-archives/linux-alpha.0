From: Christoph Lameter <clameter@sgi.com>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Thu, 30 Aug 2007 11:12:35 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0708301112030.7975@schroedinger.engr.sgi.com>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org>
 <20070829234734.GA26410@stusta.de> <Pine.LNX.4.64.0708291736010.4526@schroedinger.engr.sgi.com>
 <46D66D49.20300@l4x.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <46D66D49.20300@l4x.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Dittmer <jdi@l4x.org>
Cc: Adrian Bunk <bunk@kernel.org>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Thu, 30 Aug 2007, Jan Dittmer wrote:

> Christoph Lameter wrote:
> > On Thu, 30 Aug 2007, Adrian Bunk wrote:
> > 
> > > Christoph, is your fix in -mm suitable for 2.6.23, or how else should this
> > > regression be fixed for 2.6.23?
> > 
> > Looks like this is just alpha and a certain particular compiler version? 
> 
> binutils 2.15.95, gcc 3.3.6 and I could update to 4.0.4 or something
> more recent I guess. And yes, it's only alpha.
> 
> Of which file do you want the objdump?

The one where the link fails. Dump the code around the unresolved symbol.


