From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] FIXME of file toploogy.h for alpha cpus
Date: Sat, 28 Jun 2014 00:07:49 -0400
Message-ID: <1403928469-9452-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=RGhhxpjlGSkodKEnIEZAw4Pa/WSf5kr/KXbUpcol5RY=;
        b=MHkJlWp1PtFKh1n1Gug+mOCe28KIeVNsIMvH8JCQqqRZrce8FjALtvI8W7fel4CYld
         qztUvGfzD8uGaU92lKUpeOg0V5coiNf25wRPeWmKYloxPUgNBnIKB0vOxM9x4jW+n184
         F/Uh8AtTg7tTS5oZN83fAmECaOaHkKg5rIEry2OwY/qLaVZr7bmycpnlgk75kvaALJjr
         nlUY/lVhLX6PoiHxUIWdTTlxejHupuIXA5BpDwpaUjyX3IzmfRJqSPN48m3YNOX9XOHz
         Zns/FvFIrQ8PmbgOYXY4beByvlrPL42mX7qs5OLmwOqmmwItrxwzyxyxsE6BSv4DnyLf
         7h1A==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixs the FIXME message in the function *cpumask_of_node
for using this function multiple times and the issue with recaluting
the cpu node mask when reusing this function.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/alpha/include/asm/topology.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
index 9251e13..d301f66 100644
--- a/arch/alpha/include/asm/topology.h
+++ b/arch/alpha/include/asm/topology.h
@@ -31,6 +31,9 @@ static const struct cpumask *cpumask_of_node(int node)
 	if (node == -1)
 		return cpu_all_mask;
 
+	else if (node == &node_to_cpumask_map[node])
+		return &node_to_cpumask_map[node];
+
 	cpumask_clear(&node_to_cpumask_map[node]);
 
 	for_each_online_cpu(cpu) {
-- 
1.9.1
