From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/5] silo: Build with -fno-PIC to reduce size
Date: Sun,  5 Apr 2020 11:48:54 -0700
Message-ID: <20200405184858.3963582-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vukA4BCy8hPLxpxj8As00UZ6jZyoV8t8UgBtm7ruucc=;
        b=klDvP2nakMe1uERBpsXPMZHIwxdoQJbVtLutHMYhtFx7Q3GtCyorDvYb1RQySlN5xn
         vQP+t5KbtRfKu+ayYat2Kmnowz5S+7ozLQcrRuNf0fe3tafn1ILCYgrHOfxNXacY4Psu
         j1yeDlEjhh1yJTLOffidg9owsJBN/dN6mZAkYRKVpp4XAsbW3kZ3gArMcJuSAZR+FlL9
         kT+Mk+3NtIONJz8Eodt4ZKRskkaLgAjv2isRU8cdaKKPlaU7aAtbyS31xRpvrPEhRJs/
         3nd7vF9So4E2hnABP77/YpJdbS4fgXD7YoPFlIowxxAvZzvicMhsjuGUh2zVIDjM31Au
         n4lg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Matt Turner <mattst88@gmail.com>

Otherwise the resulting image will be too large:

| ./util second.map second.aout second2.aout second.b second.b2
| Distance between two changes larger than 63K 3 84553 0

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 0f176db..3d0efe7 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,7 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.24.1

