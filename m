From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/5] silo: Build with -U_FORTIFY_SOURCE
Date: Sun,  5 Apr 2020 11:48:55 -0700
Message-ID: <20200405184858.3963582-2-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2U36IISqiR++RgOtOmUdkahCg0qsGx0ff3vJaea/sA=;
        b=PU21hskpNExrXOcX1tjz5p2qLBW47yseY+oMwaONEvJkhGUpeSEFHPqK0FO8CuO5Ae
         jXooUzbIaejDRmakDet8XO2MP8kPjJ97KjL7leVC91KQ+I+8Dza5EuDf+p3NQphyYNyB
         U1dqsnxJWumHQV1M4HBWWwRVffB0fIWHxSRcdf/1Qzbs0u6OnIk5xBjGNoJAaSy9kouU
         xqqDG0JEt4RGt6Fz5YMAvb95aJ8FD7/Tx6wl3DUzAqBozD3YVHjuMGit1KZQ1TUAj7P7
         AfQwu2MwGGhOiDqm58p88UqLYhvpy4kb8ugPEqYVn9bDnzMuNIzaJ1NBXzVVp9bq3h07
         8skA==
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Matt Turner <mattst88@gmail.com>

Otherwise the build will fail:

| ld: decompnet.o: in function `error':
| decomp.c:(.text+0x4dc): undefined reference to `__longjmp_chk'

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 3d0efe7..9739f7a 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,8 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -U_FORTIFY_SOURCE \
+	-DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.24.1

