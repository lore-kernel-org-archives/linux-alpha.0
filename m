From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 5/7] powerpc: Remove unused SLOW_DOWN_IO definition
Date: Fri, 15 Apr 2022 14:08:15 -0500
Message-ID: <20220415190817.842864-6-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650049720;
        bh=QNhkR5f2VwsmRJLjyIIeuyQ3Ro0/ZTlpiHVGueu8khw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RzXW0JUf3FmmvjCkNLPg6xeSiQ00FCdgqtRjSiv750sCreQXBhr+haJGO3gaKecxK
         Ut63sQ0/8xIkmtE1di1uclIYjE3djP8GM/NAZvEmiQ50vNroamDnR8EJhVyHC90mAX
         DCjvBvyeNWljHEVX3CqMYuSlRG8rajCE4XkjMSePx9n1RQV1NZMCyYIazZvPVRo+0I
         GHgXCH+MAp6nGOF2EU4Ezu3OBddS8QZSxKM+2+OKfJ2EOMkezjpNIdTE3XnvMI4AIT
         BkT+aUHhioeRJQGiWGOXv1o/Fi2wCjLqpTFlNLS+zZ+1bOC9ECLuRExRrZ8wlP2c6J
         beDpycOtgITAA==
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused SLOW_DOWN_IO definition.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/powerpc/include/asm/io.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fee979d3a1aa..c5a5f7c9b231 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -38,8 +38,6 @@ extern struct pci_dev *isa_bridge_pcidev;
 #define SIO_CONFIG_RA	0x398
 #define SIO_CONFIG_RD	0x399
 
-#define SLOW_DOWN_IO
-
 /* 32 bits uses slightly different variables for the various IO
  * bases. Most of this file only uses _IO_BASE though which we
  * define properly based on the platform
-- 
2.25.1

