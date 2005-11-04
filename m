From: Daniel Drake <dsd@gentoo.org>
Subject: Re: ALPHA: missing reference to barrier()
Date: Fri, 04 Nov 2005 13:31:17 +0000
Message-ID: <436B62A5.8040904@gentoo.org>
References: <436B3730.2090705@steudten.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090107030603060306050308"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <436B3730.2090705@steudten.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
To: "alpha @ steudten Engineering" <alpha@steudten.com>
Cc: LinuxAlpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090107030603060306050308
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

alpha @ steudten Engineering wrote:
> ONLY for linux ALPHA:
> 
> Please add patch to the source tree..
> 
> Hello
> 
> In the kernel source 2.6.14 from kernel.org build with the given config1, the
> symbol barrier() is missing in linux/include/asm-alpha/atomic.h with gcc 4.0.1 from
> FC4.
> 
> This is defined in linux/compiler.h or asm/compiler.h.

An alternative patch has already been merged into Linus' git tree. It should 
fix your problem.

Daniel

--------------090107030603060306050308
Content-Type: text/x-patch;
 name="1305_alpha-barrier-compile.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="1305_alpha-barrier-compile.patch"

From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Date: Sun, 30 Oct 2005 01:15:43 +0000 (-0700)
Subject:     [PATCH] fix alpha breakage
X-Git-Url: http://www.kernel.org/git/gitweb.cgi?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=63f324cf0792ed69089b79d6921ba3aaea97af50

  [PATCH] fix alpha breakage
  
  barrier.h uses barrier() in non-SMP case.  And doesn't include compiler.h.
  
  Cc: Al Viro <viro@ftp.linux.org.uk>
  Signed-off-by: Andrew Morton <akpm@osdl.org>
  Signed-off-by: Linus Torvalds <torvalds@osdl.org>
---

--- a/include/asm-alpha/barrier.h
+++ b/include/asm-alpha/barrier.h
@@ -1,6 +1,8 @@
 #ifndef __BARRIER_H
 #define __BARRIER_H
 
+#include <asm/compiler.h>
+
 #define mb() \
 __asm__ __volatile__("mb": : :"memory")
 

--------------090107030603060306050308--
