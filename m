From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [ALPHA] 2.6.28-rc fails to compile
Date: Wed, 29 Oct 2008 06:59:35 -0700
Message-ID: <20081029065935.7a5930f9@infradead.org>
References: <49083361.5060907@gentoo.org>
	<20081029100356.GA28224@cs181140183.pp.htv.fi>
	<20081029062741.7400e330@infradead.org>
	<20081029134553.GA9108@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20081029134553.GA9108@cs181140183.pp.htv.fi>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: =?UTF-8?B?UmHDumw=?= Porcel <armin76@gentoo.org>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, klausman@gentoo.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Andrew Morton <akpm@linux-foundation.org>, rth@twiddle.net

On Wed, 29 Oct 2008 15:45:53 +0200
Adrian Bunk <bunk@kernel.org> wrote:

> On Wed, Oct 29, 2008 at 06:27:41AM -0700, Arjan van de Ven wrote:
> > 
> > Andrew has a patch for this in his tree for a while... I was
> > assuming he'd do a patchdump to Linus late in -rc1 but it seems not
> > to have happened..
> 
> The basic problem for the Alpha build errors are circular #include's 
> (that are anyway a pretty bad thing), and I'm currently attacking
> that problem (it seems to be surprisingly easy).
> 
> That's IMHO better than the patch in -mm that uninlines 
> pci_ioremap_bar().

and in my opinion the uninline is nicer ;)
Because that means we can add more checks to it over time without
bloating the kernel.


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
