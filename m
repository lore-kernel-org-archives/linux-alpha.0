From: Balint Cristian <rezso@rdsor.ro>
Subject: Re: Compiling latest 2.6 bk snapshot on Alpha
Date: Wed, 3 Sep 2003 18:44:43 -0400
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200309031844.43208.rezso@rdsor.ro>
References: <20030903143157.GA17699@localhost> <20030903150024.GA18306@localhost> <20030903151532.GH14376@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20030903151532.GH14376@lug-owl.de>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

If using RedHat-7.2 based thing on alpha or older you can use my own maintained RH rawhide for alpha:

ftp.rdsor.ro/pub/Linux/Distributions/AlphaLinux

There can find very latest gcc/binutils/glibc shaga, it must fit OK with any redhat for alphas.

I have no problem compiling latest kernel with tham.


Cristian


On Wednesday 03 September 2003 11:15, Jan-Benedict Glaw wrote:
> On Wed, 2003-09-03 11:00:24 -0400, Mathieu Chouquet-Stringer
> <mchouque@online.fr>
>
> wrote in message <20030903150024.GA18306@localhost>:
> > On Wed, Sep 03, 2003 at 04:40:31PM +0200, Marc Zyngier wrote:
> > > Please check your binutils version. Here is the one I use, with great
> > > success :
> > >
> > > maz@panther:/mnt/i386/linux-2.5$ alpha-linux-ld --version
> > > GNU ld version 2.13.90.0.18 20030121
> >
> > Mine is: GNU ld version 2.14.90.0.5 20030722 Debian GNU/Linux
>
> I've just started a compile run with exactly this ld and gcc-3.3.2
> 20030812. This may take a while (it's a 166MHz NoName...).
>
> Maybe you've simply created a too large kernel image. Have you compiled
> many features into the kernel (where modules would have worked also...)?
>
> MfG, JBG

-- 
Life in itself has no meaning. 
Life is an opportunity to create meaning.

              \|/ ____ \|/ 
              "@'/ .. \`@" 
              /_| \__/ |_\ 
                 \__U_/ 
