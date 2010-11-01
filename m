From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: df9ee29270 breaks the build on alpha
Date: Mon, 1 Nov 2010 16:47:05 +0300
Message-ID: <20101101134705.GA18811@jurassic.park.msu.ru>
References: <AANLkTi=p+5Tey=bwBSdGBmyMA13xmxhSZyg26Hk9=a8G@mail.gmail.com> <4CCE71E6.7070609@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CCE71E6.7070609@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Mon, Nov 01, 2010 at 08:53:10PM +1300, Michael Cree wrote:
> So, what's the way best forward?

I guess the simplest way to fix that is to use swpipl() call
directly, like this (untested).

Ivan.

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index eda9b90..56ff965 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -37,8 +37,9 @@
  */
 extern inline void __set_hae(unsigned long new_hae)
 {
-	unsigned long flags;
-	local_irq_save(flags);
+	unsigned long flags = swpipl(IPL_MAX);
+
+	barrier();
 
 	alpha_mv.hae_cache = new_hae;
 	*alpha_mv.hae_register = new_hae;
@@ -46,7 +47,8 @@ extern inline void __set_hae(unsigned long new_hae)
 	/* Re-read to make sure it was written.  */
 	new_hae = *alpha_mv.hae_register;
 
-	local_irq_restore(flags);
+	setipl(flags);
+	barrier();
 }
 
 extern inline void set_hae(unsigned long new_hae)
