From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 9/9] MAINTAINERS: add cpumask and nodemask files to BITMAP_API
Date: Sat, 27 Nov 2021 19:57:04 -0800
Message-ID: <20211128035704.270739-10-yury.norov__42606.3166394428$1638072038$gmane$org@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=233QcxxJpVsvwdAL71A0o6E8P9a0fPiFh3UgjrFlGJ0=;
        b=KkNq74uLi6kOf8pEr8DG98/abjM7uLh7+GECvfSeLoEuajiH9DIy0sW44xrjIjypLN
         8Mv9T5QuV1fbsS/shbnr41T65dYJVBAFqsEEBUaXUGRnJGCi0sM//bSWwuEuBQr+tIS2
         3wceXjtFBHV5eP+FK911ZtcoYOP9pkOQJm8mVkPx3ngUMkuxLtUBTErX/VOaKFj6rA5D
         KfQvE2oEDagWRfZWA4DNs+F/Ue4NQgP4MieHvaOOyyCO7gUq0fWrFpqxLzsVuRSYXAhx
         VbLwESubwEwWJOqwh9/LzV9ZaLM2tajrvj0OKk6cYIU1mArvG8SMDlNXs8NU8IlQAOjA
         Dg8w==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

cpumask and nodemask APIs are thin wrappers around basic bitmap API, and
corresponding files are not formally maintained. This patch adds them to
BITMAP_API section, so that bitmap folks would have closer look at it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ad0cb5cb05..ceeffcd81fa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3375,10 +3375,14 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.25.1

