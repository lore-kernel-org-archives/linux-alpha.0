From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v4 04/13] m68k: nommu: use pgtable-nopud instead of 4level-fixup
Date: Tue,  5 Nov 2019 09:15:26 +0200
Message-ID: <1572938135-31886-5-git-send-email-rppt@kernel.org>
References: <1572938135-31886-1-git-send-email-rppt@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572938187;
        bh=yv9SFIdg5D2vfTnwk1AOT8EqOCosf2YIIQ4xx40h8eQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZRTuWPcP4i8KXp9kO0eX8Cq/bOAclo2IZloNtkN7BqQM764gwyOW1YDPXlBmhcYxu
         27+RdQ6zG5qfgmWd7fNu28xsFBXrv9t8Jg8RG7EpprDZ1vyG9Ma1zqUsj8CTDFaAiN
         ZeseKIlG4QaXbeDs7iNmG/bbFvUlHYWbJAtEzy1g=
In-Reply-To: <1572938135-31886-1-git-send-email-rppt@kernel.org>
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
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/pgtable_no.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index c18165b..ccc4568 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -2,7 +2,7 @@
 #ifndef _M68KNOMMU_PGTABLE_H
 #define _M68KNOMMU_PGTABLE_H
 
-#include <asm-generic/4level-fixup.h>
+#include <asm-generic/pgtable-nopud.h>
 
 /*
  * (C) Copyright 2000-2002, Greg Ungerer <gerg@snapgear.com>
-- 
2.7.4

