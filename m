From: Mark Salter <msalter@redhat.com>
Subject: [PATCH 01/10] alpha: select ARCH_MIGHT_HAVE_PC_SERIO
Date: Sat, 14 Dec 2013 11:59:27 -0500
Message-ID: <1387040376-26906-2-git-send-email-msalter@redhat.com>
References: <1387040376-26906-1-git-send-email-msalter@redhat.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1387040376-26906-1-git-send-email-msalter@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Mark Salter <msalter@redhat.com>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

Architectures which might use an i8042 for serial IO to keyboard,
mouse, etc should select ARCH_MIGHT_HAVE_PC_SERIO.

Signed-off-by: Mark Salter <msalter@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
CC: linux-alpha@vger.kernel.org
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d39dc9b..7ce5ce5 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -2,6 +2,7 @@ config ALPHA
 	bool
 	default y
 	select ARCH_MIGHT_HAVE_PC_PARPORT
+	select ARCH_MIGHT_HAVE_PC_SERIO
 	select HAVE_AOUT
 	select HAVE_IDE
 	select HAVE_OPROFILE
-- 
1.8.3.1

