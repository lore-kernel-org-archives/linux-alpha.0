From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 5/5] second/util: Remove unused shadowed variables
Date: Sun,  5 Apr 2020 11:48:58 -0700
Message-ID: <20200405184858.3963582-5-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2u8Zi5WKG0LXUGqO/LujvBudiFZlVRinVUlFzRXq1M=;
        b=H6gBPvPFY9gUXO95qHEf5NwE5Kz51xKeXBdSODWb8hcogHSAssIVybbFz7Z16pMAl9
         BwaNhLI/CoR0J673YHjml1JLNgRDy26LUkfwuhGR95qg0US0fwGcRR3tSNsON1LkTeTb
         dY+of8kAPGEedWrV6UYSuVamR1VN9tolZF90tk+K/hCtKfmawuMqBJ6xiQudz48x1NYl
         PLnu12Sr9nHmrgeaNL+DEYgeRHSbxkeHgOwpZCDCimpqe39T63aAdF9U+94/vdyeEEwB
         Bu4yjkXh0l0dBXS915jPQ9AEAiigVyNpsgwJri3plMlv2nNQEOEqWb86R1gDQRn6zJ51
         hciA==
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 second/util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/second/util.c b/second/util.c
index 3346823..3469c34 100644
--- a/second/util.c
+++ b/second/util.c
@@ -120,8 +120,6 @@ int main(int argc, char **argv)
     int end, rodata_start, rodata_end;
     int net = 0;
     int i = 1;
-    char sym[256];
-    unsigned int addr;
 
     if (!strcmp (argv[i], "-a")) {
 	net = 1;
-- 
2.24.1

