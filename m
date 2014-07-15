From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 6/6] alpha: Join lines 90 and 91
Date: Tue, 15 Jul 2014 14:18:24 -0400
Message-ID: <1405448304-3724-6-git-send-email-xerofoify@gmail.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m92WpkYi2s7McdH4nSV8fSDBANQBBt9O4gsfDInkcgg=;
        b=yrXt5aZGQxurod8bBcrqWpRfCJZ51F7u46cwj7lyxRl1b8drqNkcrQzZ+BC/otfsFd
         u4qvvQWyfuRbCW4W7Vyk8qpSK7jX96H84H6Lt67vpg/i/UEDVOSOu3HQgxuneXbykYq+
         du0Yf6EGLHmyy5VPBAEwS89C+GO8zzRx6/zg7KQjxPSyOtrwqNy/8cy6v+caJXVL/h+m
         V84rrT8/NC2H8T69boP+1k4JdcY7mGp7JnXdFS0SZJt/Qd1KCUvgq/VL0qGhtaJ9Tcp+
         VsFWN80+c9ZaoVKeCZTKdIW03VTKmxSqu65gAPoHNQN9GdYK3UeyAmTnlBamJxdXB//H
         WgcQ==
In-Reply-To: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes the checkpatch error I get in this file relating to a
quoted string needed to be joined to the line above it.
---
 arch/alpha/boot/bootpz.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 6fc840d..a9e127b 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -87,8 +87,7 @@ check_range(unsigned long vstart, unsigned long vend,
 		kaddr = (find_pa(vaddr) | PAGE_OFFSET);
 		if (kaddr >= kstart && kaddr <= kend) {
 #ifdef DEBUG_CHECK_RANGE
-			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx"
-				   " [0x%lx:0x%lx]\n",
+			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx" " [0x%lx:0x%lx]\n",
 				   vaddr, kaddr, kstart, kend);
 #endif
 			return 1;
-- 
1.9.1
