From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 24/32] docs/vm: swap_numa.txt: convert to ReST format
Date: Wed, 21 Mar 2018 21:22:40 +0200
Message-ID: <1521660168-14372-25-git-send-email-rppt@linux.vnet.ibm.com>
References: <1521660168-14372-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1521660168-14372-1-git-send-email-rppt@linux.vnet.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Andrey Ryabinin <aryabinin@virtuozzo.com>, Matt Turner <mattst88@gmail.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, Richard Henderson <rth@twiddle.net>

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/swap_numa.txt | 55 +++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/Documentation/vm/swap_numa.txt b/Documentation/vm/swap_numa.txt
index d5960c9..e0466f2 100644
--- a/Documentation/vm/swap_numa.txt
+++ b/Documentation/vm/swap_numa.txt
@@ -1,5 +1,8 @@
+.. _swap_numa:
+
+===========================================
 Automatically bind swap device to numa node
--------------------------------------------
+===========================================
 
 If the system has more than one swap device and swap device has the node
 information, we can make use of this information to decide which swap
@@ -7,15 +10,16 @@ device to use in get_swap_pages() to get better performance.
 
 
 How to use this feature
------------------------
+=======================
 
 Swap device has priority and that decides the order of it to be used. To make
 use of automatically binding, there is no need to manipulate priority settings
 for swap devices. e.g. on a 2 node machine, assume 2 swap devices swapA and
 swapB, with swapA attached to node 0 and swapB attached to node 1, are going
-to be swapped on. Simply swapping them on by doing:
-# swapon /dev/swapA
-# swapon /dev/swapB
+to be swapped on. Simply swapping them on by doing::
+
+	# swapon /dev/swapA
+	# swapon /dev/swapB
 
 Then node 0 will use the two swap devices in the order of swapA then swapB and
 node 1 will use the two swap devices in the order of swapB then swapA. Note
@@ -24,32 +28,39 @@ that the order of them being swapped on doesn't matter.
 A more complex example on a 4 node machine. Assume 6 swap devices are going to
 be swapped on: swapA and swapB are attached to node 0, swapC is attached to
 node 1, swapD and swapE are attached to node 2 and swapF is attached to node3.
-The way to swap them on is the same as above:
-# swapon /dev/swapA
-# swapon /dev/swapB
-# swapon /dev/swapC
-# swapon /dev/swapD
-# swapon /dev/swapE
-# swapon /dev/swapF
-
-Then node 0 will use them in the order of:
-swapA/swapB -> swapC -> swapD -> swapE -> swapF
+The way to swap them on is the same as above::
+
+	# swapon /dev/swapA
+	# swapon /dev/swapB
+	# swapon /dev/swapC
+	# swapon /dev/swapD
+	# swapon /dev/swapE
+	# swapon /dev/swapF
+
+Then node 0 will use them in the order of::
+
+	swapA/swapB -> swapC -> swapD -> swapE -> swapF
+
 swapA and swapB will be used in a round robin mode before any other swap device.
 
-node 1 will use them in the order of:
-swapC -> swapA -> swapB -> swapD -> swapE -> swapF
+node 1 will use them in the order of::
+
+	swapC -> swapA -> swapB -> swapD -> swapE -> swapF
+
+node 2 will use them in the order of::
+
+	swapD/swapE -> swapA -> swapB -> swapC -> swapF
 
-node 2 will use them in the order of:
-swapD/swapE -> swapA -> swapB -> swapC -> swapF
 Similaly, swapD and swapE will be used in a round robin mode before any
 other swap devices.
 
-node 3 will use them in the order of:
-swapF -> swapA -> swapB -> swapC -> swapD -> swapE
+node 3 will use them in the order of::
+
+	swapF -> swapA -> swapB -> swapC -> swapD -> swapE
 
 
 Implementation details
-----------------------
+======================
 
 The current code uses a priority based list, swap_avail_list, to decide
 which swap device to use and if multiple swap devices share the same
-- 
2.7.4

