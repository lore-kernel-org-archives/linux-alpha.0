From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sun, 27 Apr 2003 02:18:35 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001101c30c52$8ead4ec0$1011a8c0@roadrunner>
References: <20030426205148.GZ19139@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20030426205148.GZ19139@lug-owl.de>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan-Benedict Glaw' <jbglaw@lug-owl.de>, linux-alpha@vger.kernel.org

Jan-Benedict Glaw wrote:
> > > Well. On kernel.org, in the main page there is a link to THAT
> > > kernel... I could searcho for the full ~.19 version... but... 
> > > how big is it??? cause my /boot partition is about 12 MB.. 
> > > the Image will be smalller than that... won't it???
> > 
> > wget http://kernel.org/pub/linux/kernel/v2.4/patch-2.4.19.bz2
>                                                ^^^^^^^^^^^^^^^^
> > tar xfvj linux-2.4.19.tar.bz2; \
>            ^^^^^^^^^^^^^^^^^^^^
> > cd linux-2.4.19; \
> > make menuconfig; \
> > make dep; make; \
> > make modules;
> > 
> > Maybe that helps?
> 
> Maybe a little, but there's an obvious bug:)

Sure there is... I shouldn't work 32 hours in a row. :-)

Sleep well, folks!

Best regards,
 Oliver


