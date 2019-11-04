From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 03/13] c6x: use pgtable-nopud instead of 4level-fixup
Date: Mon,  4 Nov 2019 08:56:17 +0200
Message-ID: <1572850587-20314-4-git-send-email-rppt@kernel.org>
References: <1572850587-20314-1-git-send-email-rppt@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572850630;
        bh=p11JZ/878S75pE68Mq2TwTFjvlVsPceSwhIak764zRU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yl19luYIpVN9yj9aWbS/N6Ywf4o+a2WiEIojSiZt5QPDi0OogL/lKkGXX91IGry+P
         HsgsBx0sCXGHp8mGP0ZAUQGckCp0pMeJbL8h5vn55B4NbBenpEdNqsBHORE02ICICI
         MP1mY8J0w47Nek+EyGx1TYDCPiNYKt3GfIrpQcVU=
In-Reply-To: <1572850587-20314-1-git-send-email-rppt@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jeff Dike <jdike@addtoit.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linus Torvalds <torvalds@linux-foundation.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>, Richard Weinberger <richard@nod.at>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Russell King <linux@armlinux.org.uk>, Sam

From: Mike Rapoport <rppt@linux.ibm.com>

c6x is a nommu architecture and does not require fixup for upper layers of
the page tables because it is already handled by the generic nommu
implementation.

Replace usage of include/asm-generic/4level-fixup.h with
include/asm-generic/pgtable-nopud.h

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/c6x/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/c6x/include/asm/pgtable.h b/arch/c6x/include/asm/pgtable.h
index 0b6919c..197c473 100644
--- a/arch/c6x/include/asm/pgtable.h
+++ b/arch/c6x/include/asm/pgtable.h
@@ -8,7 +8,7 @@
 #ifndef _ASM_C6X_PGTABLE_H
 #define _ASM_C6X_PGTABLE_H
 
-#include <asm-generic/4level-fixup.h>
+#include <asm-generic/pgtable-nopud.h>
 
 #include <asm/setup.h>
 #include <asm/page.h>
-- 
2.7.4

