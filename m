From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: df9ee29270 breaks the build on alpha
Date: Mon, 01 Nov 2010 20:53:10 +1300
Message-ID: <4CCE71E6.7070609@orcon.net.nz>
References: <AANLkTi=p+5Tey=bwBSdGBmyMA13xmxhSZyg26Hk9=a8G@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=p+5Tey=bwBSdGBmyMA13xmxhSZyg26Hk9=a8G@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: David Howells <dhowells@redhat.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On 30/10/10 05:15, Matt Turner wrote:
>    CC      init/main.o
> In file included from /space/mattst88/alpha-2.6/arch/alpha/include/asm/dma.h:22,
>                   from include/linux/bootmem.h:8,
>                   from init/main.c:25:
> /space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h: In function '__set_hae':
> /space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h:41: error:
> 'arch_local_irq_save' is static but used in inline function
> '__set_hae' which is not static
> /space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h:49: error:
> 'arch_local_irq_restore' is static but used in inline function
> '__set_hae' which is not static
>

Yes, I've seen this too.  It is tempting to redefine __set_hae() and 
set_hae() to be static inline (and it builds and works fine for my miata 
kernel when I do so) but there is commit d559d4a24a3fe which has this to 
say:

commit d559d4a24a3fed75bd890abcc1f95cd8d8dad6e1
Author: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Date:   Sat Jun 21 03:28:31 2008 +0400

     alpha: fix compile failures with gcc-4.3 (bug #10438)

     Vast majority of these build failures are gcc-4.3 warnings
     about static functions and objects being referenced from
     non-static (read: "extern inline") functions, in conjunction
     with our -Werror.

     We cannot just convert "extern inline" to "static inline",
     as people keep suggesting all the time, because "extern inline"
     logic is crucial for generic kernel build.
     So
     - just make sure that all callees of critical "extern inline"
       functions are also "extern inline";
     - use "static inline", wherever it's possible.

     traps.c: work around gcc-4.3 being too smart about array
     bounds-checking.

     TODO: add "gnu_inline" attribute to all our "extern inline"
     functions to ensure desired behaviour with future compilers.

     Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


So, what's the way best forward?

Cheers
Michael.
