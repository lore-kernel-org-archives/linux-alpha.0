From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 21:42:15 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <002201c30c2b$f5300d80$1011a8c0@roadrunner>
References: <1051365623.1967.79.camel@Gandalf>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1051365623.1967.79.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 333101@personal.net.py
Cc: linux-alpha@vger.kernel.org

Alan Bort wrote:
> > > > > I've noted that the downloadable file is only 4 MB (a little 
> > > > > less)... is that the FULL kernel???
> > > > 
> > > > Is that already compiled?  My kernels usually end up 
> > > > around 1.5 MB 
> > > > in size, or ~2.7 MB uncompressed.
> > > well: 4,0M    patch-2.4.20.bz2
> > > 
> > > that's what du patch-2.4.20.bz2 returns....
> > 
> > That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full 
> > source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is 
> > broken.
>
> Well. On kernel.org, in the main page there is a link to THAT 
> kernel... I could searcho for the full ~.19 version... but... 
> how big is it??? cause my /boot partition is about 12 MB.. 
> the Image will be smalller than that... won't it???

wget http://kernel.org/pub/linux/kernel/v2.4/patch-2.4.19.bz2
tar xfvj linux-2.4.19.tar.bz2; \
cd linux-2.4.19; \
make menuconfig; \
make dep; make; \
make modules;

Maybe that helps?

br,
 Oliver



