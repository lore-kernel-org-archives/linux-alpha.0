From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 2/7] alpha: Eliminate compiler warning from memset macro
Date: Tue, 16 Jul 2013 10:04:35 -0700
Message-ID: <1373994280-12047-3-git-send-email-rth@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=jIZTv9Jpd1QAAYYnBjZoMoKDHm40cCAWGFMrWHrXOcE=;
        b=qOi1u+bmsS9m1y14oHlzvafzW4lF+WeBceaQMfd0coEakyHogjTZiFTpPp4LPRYvIL
         YkIfgEX6EqEBOpFy7bZtLo7OPK3DOprwj/GVth3+CAJiKXhKcwhUQNmwm8zE0+cpJqmF
         JeJItISiZzZdauAvL4Q85ddWAfwz7PgGqH0gMiCfUXw53+ZTMlCkKeOjCNZd2FJSOQ7P
         r/LNSWly+HNo9/8uDvMMltOZC3NnF2NP8CdeAi9Tl0a0syjleYjFBjgBGiGK6T673+f2
         eBtftyW8AVHuIjx6fVTbhNAqwrkUtl4S4x8fC39xP3uymUOA4oRjDJtVasph6zVJxR2V
         b8Ng==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Compiling with GCC 4.8 yields several instances of

crypto/vmac.c: In function =E2=80=98vmac_final=E2=80=99:
crypto/vmac.c:616:9: warning: value computed is not used [-Wunused-valu=
e]
  memset(&mac, 0, sizeof(vmac_t));
         ^
arch/alpha/include/asm/string.h:31:25: note: in definition of macro =E2=
=80=98memset=E2=80=99
     ? __builtin_memset((s),0,(n))          \
                         ^
Converting the macro to an inline function eliminates this problem.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/string.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/string.h b/arch/alpha/include/asm/s=
tring.h
index b02b8a2..8b478ae 100644
--- a/arch/alpha/include/asm/string.h
+++ b/arch/alpha/include/asm/string.h
@@ -25,12 +25,18 @@ extern void * __constant_c_memset(void *, unsigned =
long, size_t);
 extern void * __memset(void *, int, size_t);
 extern void * memset(void *, int, size_t);
=20
-#define memset(s, c, n)							    \
-(__builtin_constant_p(c)						    \
- ? (__builtin_constant_p(n) && (c) =3D=3D 0					    \
-    ? __builtin_memset((s),0,(n)) 					    \
-    : __constant_c_memset((s),0x0101010101010101UL*(unsigned char)(c),=
(n))) \
- : __memset((s),(c),(n)))
+extern inline void *memset(void *s, int c, size_t n)
+{
+	if (__builtin_constant_p(c)) {
+		if (__builtin_constant_p(n)) {
+			return __builtin_memset(s, c, n);
+		} else {
+			unsigned long c8 =3D (c & 0xff) * 0x0101010101010101UL;
+			return __constant_c_memset(s, c8, n);
+		}
+	}
+	return __memset(s, c, n);
+}
=20
 #define __HAVE_ARCH_STRCPY
 extern char * strcpy(char *,const char *);
--=20
1.8.1.4
