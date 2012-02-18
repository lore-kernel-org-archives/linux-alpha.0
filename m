From: Jim Faulkner <jfaulkne@ccs.neu.edu>
Subject: Re: [PATCH] fix modpost when CONFIG_ALPHA_TSUNAMI=y
Date: Sat, 18 Feb 2012 17:39:57 -0500
Message-ID: <20120218223957.GB28758@alumni-linux.ccs.neu.edu>
References: <20120109003504.GA19756@alumni-linux.ccs.neu.edu> <20120218212431.GA25058@alumni-linux.ccs.neu.edu> <4F40264E.6050602@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F40264E.6050602@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, gregkh@linuxfoundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, torvalds@linux-foundation.org, jay.estabrook@gmail.com

On Sun, Feb 19, 2012 at 11:29:34AM +1300, Michael Cree wrote:
> >  
> > +#include <linux/module.h>
> 
> Wouldn't <linux/exports.h> be better?  I seem to recall that this was a
> problem with EXPORT_SYMBOL not being defined and I see my own personal
> fix (which I had completely forgotten to send upstream) was to include
> <linux/exports.h>

core_marvel.c and core_titan.c both include <linux/module.h> in the
mainline kernel, which is why I thought it was the appropriate fix for
core_tsunami.c.

