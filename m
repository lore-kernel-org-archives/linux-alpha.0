From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [BUG] 4.13.0 kernel build error on Alpha
Date: Mon, 11 Sep 2017 18:02:30 +1200
Message-ID: <20170911060230.mrkdgsw4gs3zf76z@tower>
References: <20170910223418.GA22820@gherkin.frus.com>
 <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
 <20170911031641.GA26870@gherkin.frus.com>
 <20170911032340.GA26971@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170911032340.GA26971@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Matt Turner <mattst88@gmail.com>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, Helge Deller <deller@gmx.de>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Sun, Sep 10, 2017 at 10:23:40PM -0500, Bob Tracy wrote:
> On Sun, Sep 10, 2017 at 10:16:41PM -0500, Bob Tracy wrote:
> > On Sun, Sep 10, 2017 at 07:59:40PM -0700, Matt Turner wrote:
> > > On Sun, Sep 10, 2017 at 3:34 PM, Bob Tracy <rct@gherkin.frus.com> wrote:
> > > > Here we go again :-(.  Tool versions as follows:
> > > > (...)
> > > >
> > > >   MODPOST vmlinux.o
> > > > WARNING: EXPORT symbol "callback_setenv" [vmlinux] version generation failed, symbol will not be versioned.
> > > > (...)
> > > > WARNING: modpost: Found 24 section mismatch(es).
> > > > To see full details build your kernel with:
> > > > 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> > > 
> > > All of this is fixed by
> > > 
> > > commit 873f9b5bcbf27f6e89e1879714abe4532cacf5d7
> > > Author: Ben Hutchings <ben@decadent.org.uk>
> > > Date:   Wed Jul 19 01:01:16 2017 +0100
> > > 
> > >     alpha: Restore symbol versions for symbols exported from assembly
> > 
> > I guess that commit hasn't made it into Linus' tree :-(.  If the patch
> > is short, please forward if you would be so kind.  Many thanks in
> > advance.
> 
> Never mind.  Linus pulled it five days ago as I type this.  The fixes
> obviously didn't make it in time for 4.13-final, but should be in 4.14.

4.13 final builds fine for me when building for a DP264 alpha config.

But I do recommend you revert 6cd9dc3e75078ef646076fa63adfb9b85ced0b66
(mm/compaction.c: fix zoneindex in kcompactd()) in your build of the
kernel for Alpha as it causes random segfaults in user space.
Unfortunately no one took any notice when I reported this some time
ago.

Cheers
Michael.
