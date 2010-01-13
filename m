From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH] alpha: add myself to maintainer's list
Date: Wed, 13 Jan 2010 15:11:17 +0300
Message-ID: <20100113121116.GA16918@jurassic.park.msu.ru>
References: <1263333020-9050-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1263333020-9050-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Tue, Jan 12, 2010 at 04:50:20PM -0500, Matt Turner wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c824b4d..69dc9fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -406,6 +406,8 @@ M:	Richard Henderson <rth@twiddle.net>
>  S:	Odd Fixes for 2.4; Maintained for 2.6.
>  M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>  S:	Maintained for 2.4; PCI support for 2.6.
> +M:	Matt Turner <mattst88@gmail.com>
> +S:	Patch collector for 2.6.3x+.
>  L:	linux-alpha@vger.kernel.org
>  F:	arch/alpha/

You're welcome.

But while we are here, I'd like to drop these odd mentions of 2.4 which
are just misleading these days...

What about

ALPHA PORT
M:	Richard Henderson <rth@twiddle.net>
M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
M:	Matt Turner <mattst88@gmail.com>
L:	linux-alpha@vger.kernel.org
S:	Maintained
F:	arch/alpha/

Ivan.
