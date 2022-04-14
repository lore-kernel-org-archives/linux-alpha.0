From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PING^3][PATCH] Alpha: Remove redundant local asm header
 redirections
Date: Thu, 14 Apr 2022 09:30:30 +0200
Message-ID: <aa1e5107-22b6-3225-bad0-a2036782ce61@physik.fu-berlin.de>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
 <alpine.DEB.2.21.2204132104530.9383@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.21.2204132104530.9383@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Maciej!

On 4/14/22 00:53, Maciej W. Rozycki wrote:
> On Sun, 13 Feb 2022, Maciej W. Rozycki wrote:
> 
>> Remove a number of asm headers locally redirected to the respective 
>> generic or generated versions.
> 
>  Ping for:
> <https://lore.kernel.org/lkml/alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk/>

Maybe Andrew Morton could pick the fix up if the original maintainer is currently
not responding?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

