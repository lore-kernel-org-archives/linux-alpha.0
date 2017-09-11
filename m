From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.13.0 kernel build error on Alpha
Date: Sun, 10 Sep 2017 22:23:40 -0500
Message-ID: <20170911032340.GA26971@gherkin.frus.com>
References: <20170910223418.GA22820@gherkin.frus.com>
 <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
 <20170911031641.GA26870@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170911031641.GA26870@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Sun, Sep 10, 2017 at 10:16:41PM -0500, Bob Tracy wrote:
> On Sun, Sep 10, 2017 at 07:59:40PM -0700, Matt Turner wrote:
> > On Sun, Sep 10, 2017 at 3:34 PM, Bob Tracy <rct@gherkin.frus.com> wrote:
> > > Here we go again :-(.  Tool versions as follows:
> > > (...)
> > >
> > >   MODPOST vmlinux.o
> > > WARNING: EXPORT symbol "callback_setenv" [vmlinux] version generation failed, symbol will not be versioned.
> > > (...)
> > > WARNING: modpost: Found 24 section mismatch(es).
> > > To see full details build your kernel with:
> > > 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> > 
> > All of this is fixed by
> > 
> > commit 873f9b5bcbf27f6e89e1879714abe4532cacf5d7
> > Author: Ben Hutchings <ben@decadent.org.uk>
> > Date:   Wed Jul 19 01:01:16 2017 +0100
> > 
> >     alpha: Restore symbol versions for symbols exported from assembly
> 
> I guess that commit hasn't made it into Linus' tree :-(.  If the patch
> is short, please forward if you would be so kind.  Many thanks in
> advance.

Never mind.  Linus pulled it five days ago as I type this.  The fixes
obviously didn't make it in time for 4.13-final, but should be in 4.14.

--Bob
