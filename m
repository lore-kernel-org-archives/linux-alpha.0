From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [PATCH v2 1/3] word-at-a-time.h: fix some Kbuild files
Date: Tue, 6 Oct 2015 15:23:47 -0400
Message-ID: <1444159429-4788-2-git-send-email-cmetcalf@ezchip.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Metcalf <cmetcalf@ezchip.com>

arch/tile added word-at-a-time.h after the patch that added generic-y
entries; the generic-y entry is now stale.

arch/h8300 is newer than the generic-y patch for word-at-a-time.h,
and needs a generic-y entry.

arch/powerpc seems to have gotten a generic-y entry by mistake in
the first patch; this change removes it.

Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
---
 arch/h8300/include/asm/Kbuild   | 1 +
 arch/powerpc/include/asm/Kbuild | 1 -
 arch/tile/include/asm/Kbuild    | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/h8300/include/asm/Kbuild b/arch/h8300/include/asm/Kbuild
index 70e6ae1e7006..373cb23301e3 100644
--- a/arch/h8300/include/asm/Kbuild
+++ b/arch/h8300/include/asm/Kbuild
@@ -73,4 +73,5 @@ generic-y += uaccess.h
 generic-y += ucontext.h
 generic-y += unaligned.h
 generic-y += vga.h
+generic-y += word-at-a-time.h
 generic-y += xor.h
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index ac1662956e0c..ab9f4e0ed4cf 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -7,4 +7,3 @@ generic-y += mcs_spinlock.h
 generic-y += preempt.h
 generic-y += rwsem.h
 generic-y += vtime.h
-generic-y += word-at-a-time.h
diff --git a/arch/tile/include/asm/Kbuild b/arch/tile/include/asm/Kbuild
index 0b6cacaad933..ba35c41c71ff 100644
--- a/arch/tile/include/asm/Kbuild
+++ b/arch/tile/include/asm/Kbuild
@@ -40,5 +40,4 @@ generic-y += termbits.h
 generic-y += termios.h
 generic-y += trace_clock.h
 generic-y += types.h
-generic-y += word-at-a-time.h
 generic-y += xor.h
-- 
2.1.2
