From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 3/3] Optimize the ordering of sections in RW_DATA_SECTION.
Date: Wed, 16 Sep 2009 12:38:39 -0400
Message-ID: <1253119119-18956-4-git-send-email-tabbott@ksplice.com>
References: <1253119119-18956-1-git-send-email-tabbott@ksplice.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1253119119-18956-1-git-send-email-tabbott@ksplice.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Tim Abbott <tabbott@ksplice.com>

Signed-off-by: Tim Abbott <tabbott@ksplice.com>
---
 include/asm-generic/vmlinux.lds.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index a43223a..6357b04 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -720,12 +720,12 @@
 	. = ALIGN(PAGE_SIZE);						\
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {				\
 		INIT_TASK_DATA(inittask)				\
+		NOSAVE_DATA						\
+		PAGE_ALIGNED_DATA(pagealigned)				\
 		CACHELINE_ALIGNED_DATA(cacheline)			\
 		READ_MOSTLY_DATA(cacheline)				\
 		DATA_DATA						\
 		CONSTRUCTORS						\
-		NOSAVE_DATA						\
-		PAGE_ALIGNED_DATA(pagealigned)				\
 	}
 
 #define INIT_TEXT_SECTION(inittext_align)				\
-- 
1.6.3.3

