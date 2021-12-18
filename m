From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 17/17] MAINTAINERS: add cpumask and nodemask files to BITMAP_API
Date: Sat, 18 Dec 2021 13:20:13 -0800
Message-ID: <20211218212014.1315894-18-yury.norov__44144.2583034345$1639862575$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V/7YV6PuikKJOpufvdQHaOC3eWjf6vds/A3UO3x9gwA=;
        b=V57np8F0LXhPyF31xZ/98vOSICHl4KXHpMtxMolGaerv0QV2DnMVUnnCvDjQoXdDXo
         rT1qtHlwGBuPWGVRNCqixnN8odHV5mxxXaYRnJZE3lAFoB3D1ap/tpQo+HN8ZXmqbSiD
         QIlZkCxHBkKbHcBQjbMxdSmxYOFoc1qPow8X/5CwC8N9sD0V27gZ/pusORn/HCgYlKRO
         4dCyLdZCSj6a6p1fhiCiQL21rXALTdc+Z1z5SDYBpicENwRWLWU4V7+P+Kd4ufK9GUr0
         SoIEC6LNYiFJiLfuFOcDYhiwtUBtAniHb+XKeX3F11JHzTtbiZ9Muu5cZPVqR5GCdbZQ
         WF1Q==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

cpumask and nodemask APIs are thin wrappers around basic bitmap API, and
corresponding files are not formally maintained. This patch adds them to
BITMAP_API section, so that bitmap folks would have closer look at it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5964e047bc04..ecd41988c871 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3392,10 +3392,14 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
 S:	Maintained
 F:	include/linux/bitmap.h
+F:	include/linux/cpumask.h
 F:	include/linux/find.h
+F:	include/linux/nodemask.h
 F:	lib/bitmap.c
+F:	lib/cpumask.c
 F:	lib/find_bit.c
 F:	lib/find_bit_benchmark.c
+F:	lib/nodemask.c
 F:	lib/test_bitmap.c
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/find.h
-- 
2.30.2

