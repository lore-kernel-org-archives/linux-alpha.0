From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] alpha: remove unneeded semicolon in osf_sys.c
Date: Tue, 28 Apr 2020 14:32:35 +0800
Message-ID: <20200428063235.31061-1-yanaijie@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, arnd@arndb.de, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

Fix the following coccicheck warning:

arch/alpha/kernel/osf_sys.c:680:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/alpha/kernel/osf_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 94e4cde8071a..d5367a1c6300 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -677,7 +677,7 @@ SYSCALL_DEFINE2(osf_proplist_syscall, enum pl_code, code,
 	default:
 		error = -EOPNOTSUPP;
 		break;
-	};
+	}
 	return error;
 }
 
-- 
2.21.1

