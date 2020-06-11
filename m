From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: c_next should increase position index
Date: Wed, 10 Jun 2020 17:45:18 -0700
Message-ID: <20200611004518.1433720-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGRnUIreoLTBDb/yvpjHmHR02mw68n2dnzxC4vEtTes=;
        b=WHwJyCnfpWqepOjSduVWbz4+PssN6zFkBBfuV0v8kVDf8yJwFuWqjzPxoQjUzL5Qz0
         AkdxLMPdeBeJEYHztLJo7HS2MN2A5m8TfXvDTjdgl36Z5OaziSHV6G1kXgv4jvT5O2MF
         3IEjMCPGIa2N/5252MDG0/8EWGAZFGQXWwk4DEZauFUjAl3EFMGnjG688YoZGgxBe83j
         8GTQCOpyv4yBfAuJPEHI+iGfdsHwhzRlFNeCuhALm9QdYTMF/Q9cRC2CRphTo0vYRsuc
         pCrTNxq6dBGo2y2Tsozq4+4JK04iqTg7z3SFc0ZJvkwsMkTPA6LgRUj4sQ0qBw5xIH6O
         sSFQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Vasily Averin <vvs@virtuozzo.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f19aa577354b..0964f373c4ba 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -1412,6 +1412,7 @@ c_start(struct seq_file *f, loff_t *pos)
 static void *
 c_next(struct seq_file *f, void *v, loff_t *pos)
 {
+	(*pos)++;
 	return NULL;
 }
 
-- 
2.26.2

