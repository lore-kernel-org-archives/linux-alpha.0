From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH] alpha: defconfig: Cleanup from old Kconfig options
Date: Thu, 20 Jul 2017 06:57:52 +0200
Message-ID: <1500526672-3399-1-git-send-email-krzk@kernel.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Remove old, dead Kconfig options (in order appearing in this commit):
 - IP_NF_QUEUE: commit 3dd6664fac7e ("netfilter: remove unused "config
   IP_NF_QUEUE"");
 - AUTOFS_FS: commit 561c5cf9236a ("staging: Remove autofs3");

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/alpha/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/defconfig b/arch/alpha/defconfig
index 539e8b5a6cbd..f4ec420d7f2d 100644
--- a/arch/alpha/defconfig
+++ b/arch/alpha/defconfig
@@ -19,7 +19,6 @@ CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
-CONFIG_IP_NF_QUEUE=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_VLAN_8021Q=m
@@ -57,7 +56,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_RTC=y
 CONFIG_EXT2_FS=y
 CONFIG_REISERFS_FS=m
-CONFIG_AUTOFS_FS=m
 CONFIG_ISO9660_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-- 
2.7.4

