From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: Alpha:  Compilation error 2.6.34-rc1 git a3d3203e4b
Date: Mon, 15 Mar 2010 19:23:51 +0900
Message-ID: <20100315192321I.fujita.tomonori@lab.ntt.co.jp>
References: <4B9DDCD8.4070902@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4B9DDCD8.4070902@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mcree@orcon.net.nz
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org

On Mon, 15 Mar 2010 20:08:08 +1300
Michael Cree <mcree@orcon.net.nz> wrote:

> I note that for_each_sg is defined in include/linux/scatterlist.h, which 
> arch/alpha/include/asm/dma-mapping.h attempts to load, however 
> include/linux/scatterlist.h was the one that included (indirectly) 
> arch/alpha/include/asm/dma-mapping.h.  There is therefore a complete 
> loop of includes from include/linux/scatterlist.h back to itself.

Very sorry about that. Seems that I broke CONFIG_ALPHA_{TSUNAMI,
TITAN, RAWHIDE, MARVEL}.

=
From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] alpha: fix compile errors in dma-mapping-common.h

The commit c186caca3dbe7f44da624cb4f9d78e1b1dfb13b8 leads to the
following errors with CONFIG_ALPHA_{TSUNAMI, TITAN, RAWHIDE, MARVEL}:

/home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h: In function `dma_map_sg_attrs':
/home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h:49: error: implicit declaration of function `for_each_sg'
/home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h:50: error: syntax error before "kmemcheck_mark_initialized"

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Reported-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/core_marvel.h  |    1 -
 arch/alpha/include/asm/core_mcpcia.h  |    1 -
 arch/alpha/include/asm/core_titan.h   |    1 -
 arch/alpha/include/asm/core_tsunami.h |    1 -
 4 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/core_marvel.h b/arch/alpha/include/asm/core_marvel.h
index 30d55fe..dad300f 100644
--- a/arch/alpha/include/asm/core_marvel.h
+++ b/arch/alpha/include/asm/core_marvel.h
@@ -12,7 +12,6 @@
 #define __ALPHA_MARVEL__H__
 
 #include <linux/types.h>
-#include <linux/pci.h>
 #include <linux/spinlock.h>
 
 #include <asm/compiler.h>
diff --git a/arch/alpha/include/asm/core_mcpcia.h b/arch/alpha/include/asm/core_mcpcia.h
index acf55b4..21ac533 100644
--- a/arch/alpha/include/asm/core_mcpcia.h
+++ b/arch/alpha/include/asm/core_mcpcia.h
@@ -6,7 +6,6 @@
 #define MCPCIA_ONE_HAE_WINDOW 1
 
 #include <linux/types.h>
-#include <linux/pci.h>
 #include <asm/compiler.h>
 
 /*
diff --git a/arch/alpha/include/asm/core_titan.h b/arch/alpha/include/asm/core_titan.h
index a17f6f3..8cf79d1 100644
--- a/arch/alpha/include/asm/core_titan.h
+++ b/arch/alpha/include/asm/core_titan.h
@@ -2,7 +2,6 @@
 #define __ALPHA_TITAN__H__
 
 #include <linux/types.h>
-#include <linux/pci.h>
 #include <asm/compiler.h>
 
 /*
diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 58d4fe4..8e39ecf 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -2,7 +2,6 @@
 #define __ALPHA_TSUNAMI__H__
 
 #include <linux/types.h>
-#include <linux/pci.h>
 #include <asm/compiler.h>
 
 /*
-- 
1.7.0

