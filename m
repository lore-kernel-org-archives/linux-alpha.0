From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 02/13] arm: nommu: use pgtable-nopud instead of 4level-fixup
Date: Fri,  1 Nov 2019 10:39:33 +0200
Message-ID: <1572597584-6390-3-git-send-email-rppt@kernel.org>
References: <1572597584-6390-1-git-send-email-rppt@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572597615;
        bh=oG08x38Bw8t//MmcsXiMwfmG8dPNjLcnVisdmtiKgLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kkCucn3uHqnMfCDvIzd0rw4B5nODD/Bpkp+sk228WySb2t9n3AXfH9+hmzqbAM7tb
         hhdQo7gWfnmZ3TCiDmqgdnYqXHvzfp8U6W43WtlMzmnZWLfgHczyLqnSNKlGlxychs
         2K3/FD28seYDl7iR26xnae/zqVrGkoiF37jRQcvQ=
In-Reply-To: <1572597584-6390-1-git-send-email-rppt@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jeff Dike <jdike@addtoit.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linus Torvalds <torvalds@linux-foundation.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>, Richard Weinberger <richard@nod.at>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Russell King <linux@armlinux.org.uk>, Sam

From: Mike Rapoport <rppt@linux.ibm.com>

The generic nommu implementation of page table manipulation takes care of
folding of the upper levels and does not require fixups.

Simply replace of include/asm-generic/4level-fixup.h with
include/asm-generic/pgtable-nopud.h.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 3ae120c..eabcb48 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -12,7 +12,7 @@
 
 #ifndef CONFIG_MMU
 
-#include <asm-generic/4level-fixup.h>
+#include <asm-generic/pgtable-nopud.h>
 #include <asm/pgtable-nommu.h>
 
 #else
-- 
2.7.4

