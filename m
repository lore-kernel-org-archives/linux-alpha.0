Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA02459E5;
	Mon, 11 Aug 2025 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900038; cv=none; b=UF2DMbxJyw4TWjxLW3avdeWcXPjszD+X30R7EplKMrOLlemGgRFWXB53MuC9TUof2UI2I6aEkoTgfso/fTgO0IsLf14OLAKwivg50fQ5gYZhvoWem/rVySiG+dsXSDec2f2+vl3hAfKWkS2qMpWGvvp7CljwevfJixEXEiGq0Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900038; c=relaxed/simple;
	bh=x1bDgwfeXw1Edvgyt0xb7BuxrJ4YuqV6Jd8p3l4JuJQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ym8ODB6uQjf9cQaNPfrn3YlcQmnToUt6EolS4rwLQi8yP4RA9ROq9oBJsbjGnSFQGfhW4VxepLWWrr07AO/ZLhzxZf6nBUYbmFcROBfrHNYIeRAiMAi8ESESV7DDM21TMu/cFje5W9p1a+o6QIgakvg9NYF5i3vNXqXoewnJctY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Fushuai Wang <wangfushuai@baidu.com>
To: <linux-kernel@vger.kernel.org>, <linux-alpha@vger.kernel.org>,
	<richard.henderson@linaro.org>, <mattst88@gmail.com>
CC: Fushuai Wang <wangfushuai@baidu.com>
Subject: [PATCH] alpha: kernel: Use for_each_online_cpu() in smp_cpus_done()
Date: Mon, 11 Aug 2025 16:13:39 +0800
Message-ID: <20250811081339.9401-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc5.internal.baidu.com (172.31.50.49) To
 bjhj-exc17.internal.baidu.com (172.31.4.15)
X-FEAS-Client-IP: 172.31.4.15
X-FE-Policy-ID: 52:10:53:SYSTEM

Replace the explicit for loop with for_each_online_cpu() to make
the code cleaner.

Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 arch/alpha/kernel/smp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..741096076dbd 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -482,9 +482,8 @@ smp_cpus_done(unsigned int max_cpus)
 	int cpu;
 	unsigned long bogosum = 0;
 
-	for(cpu = 0; cpu < NR_CPUS; cpu++) 
-		if (cpu_online(cpu))
-			bogosum += cpu_data[cpu].loops_per_jiffy;
+	for_each_online_cpu(cpu)
+		bogosum += cpu_data[cpu].loops_per_jiffy;
 	
 	printk(KERN_INFO "SMP: Total of %d processors activated "
 	       "(%lu.%02lu BogoMIPS).\n",
-- 
2.36.1

