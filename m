From: Julia Lawall <julia@diku.dk>
Subject: [PATCH] arch/alpha/kernel: Add kmalloc NULL tests
Date: Mon, 13 Jul 2009 10:54:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0907131054170.6808@ask.diku.dk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Check that the result of kmalloc is not NULL before passing it to other
functions.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x == NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/alpha/kernel/core_marvel.c |    2 ++
 arch/alpha/kernel/core_titan.c  |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index e302dae..80953bc 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -1103,6 +1103,8 @@ marvel_agp_info(void)
 	 * Allocate the info structure.
 	 */
 	agp = kmalloc(sizeof(*agp), GFP_KERNEL);
+	if (!agp)
+		return NULL;
 
 	/*
 	 * Fill it in.
diff --git a/arch/alpha/kernel/core_titan.c b/arch/alpha/kernel/core_titan.c
index 319fcb7..d6fd453 100644
--- a/arch/alpha/kernel/core_titan.c
+++ b/arch/alpha/kernel/core_titan.c
@@ -757,6 +757,8 @@ titan_agp_info(void)
 	 * Allocate the info structure.
 	 */
 	agp = kmalloc(sizeof(*agp), GFP_KERNEL);
+	if (!agp)
+		return NULL;
 
 	/*
 	 * Fill it in.
