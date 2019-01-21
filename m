From: Bob Tracy <rct@gherkin.frus.com>
Subject: [PATCH] 4.18-rc7 on alpha: bitsperlong issue
Date: Mon, 21 Jan 2019 15:42:32 -0600
Message-ID: <20190121214232.GA14964@gherkin.frus.com>
References: <20190121161928.GA12984@gherkin.frus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20190121161928.GA12984@gherkin.frus.com>
Resent-Message-ID: <2hX1Cnh7zUE.A.m-B.XzjRcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190121214232.GA14964@gherkin.frus.com
To: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org
Cc: mcree@orcon.net.nz, mattst88@gmail.com


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Apologies for what is essentially a repost with a proper subject header
in the sense of trying to get the attention of people who collect/approve
patches for submission upstream.  See my posting from earlier today
(followup: [FTBFS] kernel 4.18-rc7 bitsperlong.h issue on alpha) for the
back story.  As mentioned there, this patch applies cleanly to at least
all mainline kernel source trees >= version 4.18.

Further apologies for including the patch as an attachment, but I don't
trust my mailer not to impose unintended formatting.

--Bob

Signed-off-by: Bob Tracy <rct@frus.com>
Tested-by: Bob Tracy <rct@frus.com>

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch18_bitsperlong

--- a/tools/include/uapi/asm/bitsperlong.h	2019-01-20 14:40:32.522422998 -0600
+++ b/tools/include/uapi/asm/bitsperlong.h	2019-01-21 09:51:45.336938260 -0600
@@ -13,6 +13,8 @@
 #include "../../arch/mips/include/uapi/asm/bitsperlong.h"
 #elif defined(__ia64__)
 #include "../../arch/ia64/include/uapi/asm/bitsperlong.h"
+#elif defined(__alpha__)
+#include "../../arch/alpha/include/uapi/asm/bitsperlong.h"
 #else
 #include <asm-generic/bitsperlong.h>
 #endif

--NzB8fVQJ5HfG6fxh--

