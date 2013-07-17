From: Phil Carmody <pc+lkml@asdf.org>
Subject: Re: [PATCH 7/7] alpha: Fix type compatibility warning for
	marvel_map_irq
Date: Wed, 17 Jul 2013 17:42:28 +0300
Message-ID: <20130717144228.GB11841@fatphil.org>
References: <20130716211259.GA11841@fatphil.org> <51E69616.3000500@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E69616.3000500@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org

On 17/07/13 06:03 -0700, Richard Henderson wrote:
> On 07/16/2013 02:12 PM, Phil Carmody wrote:
> > Greetings Richard,
> > 
> > Your
> > 
> > +       struct pci_dev *dev = (struct pci_dev *)dev;
> > 
> > should surely (i.e. I'm nowhere near a compiler or kernel tree 
> > presently) be
> > 
> > +       struct pci_dev *dev = (struct pci_dev *)cdev;
> > 
> > I guess post that, you can have:
> > 
> > Acked-by: Phil Carmody <pc+lkml@asdf.org>
> 
> Ug.  Self-assignment suppressing uninitialized variable warning
> is the stupidest extension evar.

That complaint gets my Ack too!
 
> Good eyes, thanks.

I don't have much to offer, but I never forget how enormously in debt 
I am to those who enabled my shiny new '164 to run linux way way back. 

Phil
-- 
If "law-abiding citizens have nothing to fear" from privacy-invading 
technologies and policies, then law-abiding governments should have
nothing to fear from whistleblowers.
