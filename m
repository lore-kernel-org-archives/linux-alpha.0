From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [PATCH v2 3/3] strscpy: zero any trailing garbage bytes in the destination
Date: Tue, 6 Oct 2015 15:23:49 -0400
Message-ID: <1444159429-4788-4-git-send-email-cmetcalf@ezchip.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Metcalf <cmetcalf@ezchip.com>

It's possible that the destination can be shadowed in userspace
(as, for example, the perf buffers are now).  So we should take
care not to leak data that could be inspected by userspace.

Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
---
 lib/string.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/string.c b/lib/string.c
index 8dbb7b1eab50..84775ba873b9 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -203,12 +203,13 @@ ssize_t strscpy(char *dest, const char *src, size_t count)
 		unsigned long c, data;
 
 		c = *(unsigned long *)(src+res);
-		*(unsigned long *)(dest+res) = c;
 		if (has_zero(c, &data, &constants)) {
 			data = prep_zero_mask(c, data, &constants);
 			data = create_zero_mask(data);
+			*(unsigned long *)(dest+res) = c & zero_bytemask(data);
 			return res + find_zero(data);
 		}
+		*(unsigned long *)(dest+res) = c;
 		res += sizeof(unsigned long);
 		count -= sizeof(unsigned long);
 		max -= sizeof(unsigned long);
-- 
2.1.2
