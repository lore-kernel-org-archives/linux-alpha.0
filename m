From: Eugene Syromiatnikov <esyr@redhat.com>
Subject: [RFC PATCH] alpha: make XTABS equivalent to TAB3
Date: Thu, 14 Sep 2017 13:53:00 +0200
Message-ID: <20170914115300.GA32386@asgard.redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

XTABS is an old name for "expand tabs to spaces" flag, which was a
separate flag on some BSD implementations. POSIX, however, specifies
that this effect is enabled with TAB3 output mode.

Currently, alpha is the only architecture that has the value of
the XTABS flag not equivalent to TAB3.

Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
---
 arch/alpha/include/uapi/asm/termbits.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
index 879dd35..5510770 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -109,7 +109,11 @@ struct ktermios {
 #define VTDLY	00200000
 #define   VT0	00000000
 #define   VT1	00200000
-#define XTABS	01000000 /* Hmm.. Linux/i386 considers this part of TABDLY.. */
+/*
+ * Should be equivalent to TAB3, see description of TAB3 in
+ * POSIX.1-2008, Ch. 11.2.3 "Output Modes"
+ */
+#define XTABS	TAB3
 
 /* c_cflag bit meaning */
 #define CBAUD	0000037
-- 
2.9.3

