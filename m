From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/9] arm: remove EISA kconfig option
Date: Thu, 15 Nov 2018 20:05:29 +0100
Message-ID: <20181115190538.17016-2-hch@lst.de>
References: <20181115190538.17016-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=b/bu/9pgdVGHgVmVL74u6sTXJYv774AB75fo2cbsSkk=; b=NgcCkC95ScqwwWvR8Lg6zagjrj
        ftIUrG2nBUZzfF64e5yK4Auk0pOmzQyRDy53KTMOUn4rrvSKZGCR0+UvMDYSwDCKxcxA7TLRwvf68
        NzkDoWLd+ZcvPL94Tsu7J5lCLIrLkZ9a3GOTEWKedYxHvoo1V6FN3rmQN6R0NE7LDzNOv4lNb3Q7L
        9l5sOGAe2azSuZclRZ2nFje90ILfD2lsYTNBppbHGYb2p3bJ8bEznU+AZJoVxKrkNe+psXuO07k/7
        r/4tpSOPvzX427lpafekojEAE3qJvjZk032KuQuOBW5AixarcT9Sk+q9gTd7oHTL2S+++AoJfPLEL
    
In-Reply-To: <20181115190538.17016-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-mips@linux-mips.org

No arm config enables EISA, and arm does not include drivers/eisa/Kconfig
which provides support for things like PCI to EISA bridges, so it is most
likely dead.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/Kconfig | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 91be74d8df65..f24a7435d19a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -163,21 +163,6 @@ config HAVE_PROC_CPU
 config NO_IOPORT_MAP
 	bool
 
-config EISA
-	bool
-	---help---
-	  The Extended Industry Standard Architecture (EISA) bus was
-	  developed as an open alternative to the IBM MicroChannel bus.
-
-	  The EISA bus provided some of the features of the IBM MicroChannel
-	  bus while maintaining backward compatibility with cards made for
-	  the older ISA bus.  The EISA bus saw limited use between 1988 and
-	  1995 when it was made obsolete by the PCI bus.
-
-	  Say Y here if you are building a kernel for an EISA-based machine.
-
-	  Otherwise, say N.
-
 config SBUS
 	bool
 
-- 
2.19.1

