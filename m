From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/5] silo: Fix misleading indentation
Date: Sun,  5 Apr 2020 11:48:56 -0700
Message-ID: <20200405184858.3963582-3-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+5xtB9gijt0AIzDLP8WDiG6Mdj5tsb0toFgxnvnpVc=;
        b=ayTEyZihrLZFoMmN9PPXdC2MK0saCpGUWJ95mwNcg1eXVDPFH9Eiq5wyQxDve0cmV8
         9ol0uU1Pl8B221RBUapBp0Jpscut/+0IU472v2y1tIEmSVQGjv2I9vHo9FZYQvGAVKXN
         kbxPksUYntxVO/uPK97iq6vXW7GOu3QizGgjL9h32PBOyoLvWZAH2hicgO904EWRW8vo
         cNGoMT/FbCppQmKCq7CwhquGObQdXyv3U/pHw3dQTPmqmh/yUI+yaUoQ6A011fp8bxo8
         JgBsMrad1Uq33V7BQgoS7VCc5c19fVFiLTQ2w5rQGKfz2IR7hb54994F9ma3qqoBhOxS
         wlYQ==
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 common/stringops1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/stringops1.c b/common/stringops1.c
index 08ed4be..6edac96 100644
--- a/common/stringops1.c
+++ b/common/stringops1.c
@@ -74,7 +74,7 @@ int strlen(const char *s)
 {
 	const char *sc;
 	for (sc = s; *sc != '\0'; ++sc);
-		return sc - s;
+	return sc - s;
 }
 
 int strncmp(const char *cs, const char *ct, size_t count)
-- 
2.24.1

