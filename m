From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/2] ia64: use asm-generic/io.h
Date: Fri, 27 Jul 2018 07:31:37 +0200
Message-ID: <20180727073137.58668bf2@bbrezillon>
References: <20180711120824.3882108-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711120824.3882108-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

On Wed, 11 Jul 2018 14:08:05 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> asm-generic/io.h provides a generic implementation of all I/O accessors,
> which the architectures can override.
> 
> Since ia64 does not provide readsl/writesl etc, any driver using those
> fails to build, and including asm-generic/io.h will provide the
> missing interfaces, as well as any other future interfaces that get
> added there. We need to #define a couple of symbols to themselves
> in the ia64 to ensure that we use the ia64 specific version of those
> rather than the generic one.
> 
> There should be no other effect than adding {read,write}s{b,w,l}()
> as well as {in,out}s{b,w,l}_p(), which were also not provided
> by ia64 but are provided by the generic header for historic reasons.
> 

Kbuild robots reported the same problem on parisc an alpha :-/.

Regards,

Boris
