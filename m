From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: fix ALPHA_LEGACY_START_ADDRESS and default to
 no
Date: Fri, 29 Oct 2010 23:25:50 +1300
Message-ID: <4CCAA12E.6020809@orcon.net.nz>
References: <20101029042257.GA5886@Sempron.nc.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20101029042257.GA5886@Sempron.nc.rr.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On 29/10/10 17:22, Matt Turner wrote:
> Kconfig.debug had ALPHA_LEGACY_START_ADDRESS twice, which seemed to mess
> the whole thing up so that the only way that you could unselect
> it was to set ALPHA_GENERIC. That is to say, setting ALPHA_TITAN
> actually prevented unsetting ALPHA_LEGACY_START_ADDRESS, which is
> necessary for Titan systems. WTF.

I don't see what the problem is that you are trying to fix.  The current 
Kconfig is set up to automatically turn on ALPHA_LEGACY_START_ADDRESS if 
you select a specific Alpha system for which it is safe to use 
ALPHA_LEGACY_START_ADDRESS and will automatically turn it off if you 
select one of Titan, Marvel or Wildfire.  If you select a Generic system 
then Kconfig enables the ALPHA_LEGACY_START_ADDRESS under the Kernel 
hacking menu so that it can be manually decided whether it should be on 
or off.

Debian, for example, uses this to build two different generic kernels, 
one with the legacy start address and one without.  Users can choose 
which kernel to use at install time.

If I turn on Titan in the config, then the Legacy Start Address menu 
item disappears, and the .config file is generated with 
ALPHA_LEGACY_START_ADDRESS off.  This appears to me to be the correct 
behaviour.

Cheers
Michael.
