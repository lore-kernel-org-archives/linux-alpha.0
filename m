From: Mark Salter <msalter@redhat.com>
Subject: [PATCH v2 01/14] alpha: select ARCH_MAY_HAVE_PC_PARPORT
Date: Tue,  8 Oct 2013 01:10:17 -0400
Message-ID: <1381209030-351-2-git-send-email-msalter@redhat.com>
References: <1381209030-351-1-git-send-email-msalter@redhat.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1381209030-351-1-git-send-email-msalter@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Mark Salter <msalter@redhat.com>, linux-alpha@vger.kernel.org

Architectures which support CONFIG_PARPORT_PC should select
ARCH_MAY_HAVE_PC_PARPORT.

Signed-off-by: Mark Salter <msalter@redhat.com>
Acked-by: Richard Henderson <rth@twiddle.net>
CC: linux-alpha@vger.kernel.org
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 35a300d..626949c 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -1,6 +1,7 @@
 config ALPHA
 	bool
 	default y
+	select ARCH_MAY_HAVE_PC_PARPORT
 	select HAVE_AOUT
 	select HAVE_IDE
 	select HAVE_OPROFILE
-- 
1.8.3.1

