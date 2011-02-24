From: "Uwe Schindler" <uwe@thetaphi.de>
Subject: RE: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 19:55:12 +0100
Message-ID: <008301cbd454$5df093a0$19d1bae0$@thetaphi.de>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com> <002101cbd40a$fcb4a610$f61df230$@thetaphi.de> <AANLkTi=3mY=dUkhCRjFE_1-iPOMV8OHsGwqc1OF9zp9V@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=3mY=dUkhCRjFE_1-iPOMV8OHsGwqc1OF9zp9V@mail.gmail.com>
Content-Language: de
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

From: Matt Turner [mailto:mattst88@gmail.com]
> On Thu, Feb 24, 2011 at 10:09 AM, Uwe Schindler <uwe@thetaphi.de>
> wrote:
> > My bigger problem is that recent kernels (even the stable one no 
> > longer work for me). On mounting my root  xfs filesystem it produces 
> > a message about a wrong relocation format / some other linking 
> > problem when loading the XFS .ko (the exact message is not known, 
> > its somewhere in the screen buffer of the already rebooted with 
> > older kernel machine, I can only remember what the problem was - 
> > next time I try I will take a pen and write down the message on 
> > console). This happens with the last stable kernel version, did not 
> > test
> > 2.7.37-1 until now.
> > The last kernel that works for me is 2.6.31-1-alpha-generic. Does 
> > anybody knows what the problem loading the XFS module is?
> >
> > Unstable is else still running fine!
> 
> This is the first I've heard of XFS not working (though, I've never 
> used it myself). Have you reported this anywhere?
> 
> Please mail linux-alpha@vger.kernel.org and the appropriate XFS 
> mailing list to try to get this fixed.

This mail thread is already going to these mailing lists
(linux-alpha@vger.kernel.org).

I will try 2.6.27-1-alpha-generic ASAP and report if it is maybe solved,
else I will post the exact error message XFS kernel module is presenting (at
least it's not a problem of my installation, because 2.6.31 and previous
works fine with XFS since years on an 128 Gig disk). Is the UDEV problem
gone with 2.6.37 kernel, too? I think it's 2.6.33 that fixed it (from your
previous mail on this thread). 

Finally I still have to tell that Debian Unstable is still running very well
with this AlphaStation 500 with EV56! So I never understood why there was no
Debian release for Alpha anymore :(

Uwe

