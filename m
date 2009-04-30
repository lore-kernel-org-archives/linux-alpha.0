From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 1/4] alpha: Use macros for .data.page_aligned.
Date: Thu, 30 Apr 2009 19:00:13 -0400
Message-ID: <1241132416-7055-2-git-send-email-tabbott@mit.edu>
References: <1241132416-7055-1-git-send-email-tabbott@mit.edu>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1241132416-7055-1-git-send-email-tabbott@mit.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

.data.page_aligned should not need a separate output section, so as
part of this cleanup I moved into the .data output section in the
linker scripts in order to eliminate unnecessary references to the
section name.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/vmlinux.lds.S |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index b9d6568..2f33cf9 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -97,11 +97,6 @@ SECTIONS
 		*(.data.init_thread)
 	}
 
-	. = ALIGN(PAGE_SIZE);
-	.data.page_aligned : {
-		*(.data.page_aligned)
-	}
-
 	. = ALIGN(64);
 	.data.cacheline_aligned : {
 		*(.data.cacheline_aligned)
@@ -110,6 +105,7 @@ SECTIONS
 	_data = .;
 	/* Data */
 	.data : {
+		PAGE_ALIGNED_DATA
 		DATA_DATA
 		CONSTRUCTORS
 	}
-- 
1.6.2.1

