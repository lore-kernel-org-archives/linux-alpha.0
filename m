From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Date: Mon, 8 Nov 2021 15:59:26 -0500
Message-ID: <20211108205926.GA1678880@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
 <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
 <YYlOmd0AeA8DSluD@zn.tnic>
Mime-Version: 1.0
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YYlOmd0AeA8DSluD@zn.tnic>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, Steven Rostedt <rostedt@goodmis.org>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, intel-gvt-dev@lists.freedesktop.org, alpha <linux-alpha@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>

On Mon, Nov 08, 2021 at 05:21:45PM +0100, Borislav Petkov wrote:
> On Mon, Nov 08, 2021 at 05:12:16PM +0100, Geert Uytterhoeven wrote:
> > Returning void is the other extreme ;-)
> > 
> > There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
> >   1. Return void: no one can check success or failure,
> >   2. Return an error code: up to the caller to decide,
> >   3. Return a __must_check error code: every caller must check.
> > 
> > I'm in favor of 2, as there are several places where it cannot fail.
> 
> Makes sense to me. I'll do that in the next iteration.

Is there really any reason for returning an error code?  For example, is 
it anticipated that at some point in the future these registration calls 
might fail?

Currently, the only reason for failing to register a notifier callback 
is because the callback is already registered.  In a sense this isn't 
even an actual failure -- after the registration returns the callback 
_will_ still be registered.

So if the call can never really fail, why bother with a return code?  
Especially since the caller can't do anything with such a code value.

Given the current state of affairs, I vote in favor of 1 (plus a WARN or 
something similar to generate a stack dump in the callee, since double 
registration really is a bug).

Alan Stern
