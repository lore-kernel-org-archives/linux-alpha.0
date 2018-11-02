From: Brajeswar Ghosh <brajeswar.linux@gmail.com>
Subject: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Fri, 2 Nov 2018 20:56:37 +0530
Message-ID: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=+tiYrxvHegvRIReUVdDqpD8LcgeUWFuNGCEcrAENPyQ=;
        b=Y9gmkal1oF9OCzSiOuLWoxGnki/7tClk8D6bDN7oRfHKNRIj7hk9LeYVryuROJnJfk
         PHdjSdakpo6aTCwtE6Y/c9pujyPGCMCa8+I3gAqPD3VC72xP3vnRS65znHsCjxZFuMF6
         ZvbAm+WfVW+P7QmBfOvs+JtUWSmpFV210V0jrc+WU1DaLe/O3mNbrFDMyfagQa6wunkv
         rIHXJnl6U81JlMRi98LwszAoQr3UDs3FMCkPpL/Xff6LF++YLoiX5hrKNlgZDMXnMlCD
         OeyusDgTZi/p/gx9udDCSgGrJTDLHzLTLFpKH4f0Xx0oGiq6CWNMCbR96ZvXvqGk2h4H
         qqJQ==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, parri.andrea@gmail.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com
Cc: jrdr.linux@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, sabyasachi.linux@gmail.com

Remove asm/xchg.h which is included more than once

Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>
---
 arch/alpha/include/asm/cmpxchg.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 6c7c39452471..bcbdac0744f9 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -36,7 +36,6 @@
 #undef ____cmpxchg
 #define ____xchg(type, args...)		__xchg ##type(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
-#include <asm/xchg.h>
 
 /*
  * The leading and the trailing memory barriers guarantee that these
-- 
2.17.1

