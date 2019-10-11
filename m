From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 20/29] h8300: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 10 Oct 2019 17:06:00 -0700
Message-ID: <20191011000609.29728-21-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zkQRciK9mkrlSR6uxFsvjRswhc34+65nZ5EFVAGwQNE=;
        b=YSecILoAsuaYNC3glukrCd31elBfhWrMe0PzbA6TDXYdPOVhmOhkQLy8xjOVCWTle3
         sWZgpOp1PTW2fO+D3A347Fw7oous07bPkmNpp/aoq4rj0PLZ+w9ksZu6jr+caikG/bpH
         XU/ce13E03H0+EglsamH4gM2AQvQFCYts7cLo=
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <keescook@chromium.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/h8300/kernel/vmlinux.lds.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 2ac7bdcd2fe0..6b1afc2f9b68 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -37,7 +40,6 @@ SECTIONS
 #endif
 	_etext = . ;
 	}
-	EXCEPTION_TABLE(16)
 	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
-- 
2.17.1

