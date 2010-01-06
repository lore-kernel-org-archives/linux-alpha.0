From: Anton Blanchard <anton@samba.org>
Subject: [patch 2/6] alpha: cpumask_of_node() should handle -1 as a node
Date: Wed, 06 Jan 2010 15:55:11 +1100
Message-ID: <20100106045524.959942683@samba.org>
References: <20100106045509.245662398@samba.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

pcibus_to_node can return -1 if we cannot determine which node a pci bus
is on. If passed -1, cpumask_of_node will negatively index the lookup array
and pull in random data:

# cat /sys/devices/pci0000:00/0000:00:01.0/local_cpus
00000000,00000003,00000000,00000000
# cat /sys/devices/pci0000:00/0000:00:01.0/local_cpulist
64-65

Change cpumask_of_node to check for -1 and return cpu_all_mask in this
case:

# cat /sys/devices/pci0000:00/0000:00:01.0/local_cpus
ffffffff,ffffffff,ffffffff,ffffffff
# cat /sys/devices/pci0000:00/0000:00:01.0/local_cpulist
0-127

Signed-off-by: Anton Blanchard <anton@samba.org>
---

Index: linux-cpumask/arch/alpha/include/asm/topology.h
===================================================================
--- linux-cpumask.orig/arch/alpha/include/asm/topology.h	2010-01-06 15:20:22.952583839 +1100
+++ linux-cpumask/arch/alpha/include/asm/topology.h	2010-01-06 15:20:46.610083557 +1100
@@ -28,6 +28,9 @@ static const struct cpumask *cpumask_of_
 {
 	int cpu;
 
+	if (node == -1)
+		return cpu_all_mask;
+
 	cpumask_clear(&node_to_cpumask_map[node]);
 
 	for_each_online_cpu(cpu) {

-- 

