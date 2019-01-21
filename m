From: Bob Tracy <rct@gherkin.frus.com>
Subject: followup: [FTBFS] kernel 4.18-rc7 bitsperlong.h issue on alpha
Date: Mon, 21 Jan 2019 10:19:28 -0600
Message-ID: <20190121161928.GA12984@gherkin.frus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <LvxZD5mWZdK.A.koH.hEfRcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190121161928.GA12984@gherkin.frus.com
To: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org
Cc: mcree@orcon.net.nz, mattst88@gmail.com


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

July 30, 2018 I reported the following to linux-kernel, linux-alpha, etc.:

On an alpha system, got the following build error on the 4.18-rc7
mainline kernel source tree:

  HOSTCC  net/bpfilter/main.o
In file included from tools/include/uapi/asm/bitsperlong.h:17,
                 from /usr/include/asm-generic/int-ll64.h:12,
		 from /usr/include/alpha-linux-gnu/asm/types.h:24,
                 from tools/include/linux/types.h:10,
                 from ./include/uapi/linux/bpf.h:11,
                 from net/bpfilter/main.c:9:
tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size.  Check asm/bitsperlong.h
 #error Inconsistent word size.  Check asm/bitsperlong.h
  ^~~~~
scripts/Makefile.host:107: recipe for target 'net/bpfilter/main.o' failed
make[2]: *** [net/bpfilter/main.o] Error 1
scripts/Makefile.build:558: recipe for target 'net/bpfilter' failed
make[1]: *** [net/bpfilter] Error 2
Makefile:1029: recipe for target 'net' failed
make: *** [net] Error 2


I implemented a crap workaround at the time in
"linux/tools/include/asm-generic/bitsperlong.h", similar to what some
frustrated person did for the x86-64 case in
"linux/include/asm-generic/bitsperlong.h".  Never sent that in because I
knew it was the wrong approach.

The proper fix is attached.  If needed, consider this my official
"signed off by" and/or "tested by".  This applies cleanly to at least
all kernel mainline source trees from 4.18 to current.

Thanks.
--Bob

--x+6KMIRAuhnl3hBn
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

--x+6KMIRAuhnl3hBn--

