From: Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] alpha: Add some spaces to ensure format specification
Date: Tue, 21 Jun 2022 16:15:06 +0800
Message-ID: <20220621081506.50096-1-jiaming@nfschina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, liqiong@nfschina.com, renyu@nfschina.com, Zhang Jiaming <jiaming@nfschina.com>

Add a space after ','.
Add spaces around the '=', '>' and '=='.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/alpha/boot/stdio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/boot/stdio.c b/arch/alpha/boot/stdio.c
index 60f73ccd2e89..e6d1ebff4209 100644
--- a/arch/alpha/boot/stdio.c
+++ b/arch/alpha/boot/stdio.c
@@ -42,8 +42,8 @@ static int skip_atoi(const char **s)
 
 static char * number(char * str, unsigned long long num, int base, int size, int precision, int type)
 {
-	char c,sign,tmp[66];
-	const char *digits="0123456789abcdefghijklmnopqrstuvwxyz";
+	char c, sign, tmp[66];
+	const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
 	int i;
 
 	if (type & LARGE)
@@ -83,14 +83,14 @@ static char * number(char * str, unsigned long long num, int base, int size, int
 		precision = i;
 	size -= precision;
 	if (!(type&(ZEROPAD+LEFT)))
-		while(size-->0)
+		while (size-- > 0)
 			*str++ = ' ';
 	if (sign)
 		*str++ = sign;
 	if (type & SPECIAL) {
 		if (base==8)
 			*str++ = '0';
-		else if (base==16) {
+		else if (base == 16) {
 			*str++ = '0';
 			*str++ = digits[33];
 		}
@@ -125,7 +125,7 @@ int vsprintf(char *buf, const char *fmt, va_list args)
 				/* 'z' changed to 'Z' --davidm 1/25/99 */
 
 
-	for (str=buf ; *fmt ; ++fmt) {
+	for (str = buf ; *fmt ; ++fmt) {
 		if (*fmt != '%') {
 			*str++ = *fmt;
 			continue;
@@ -296,7 +296,7 @@ int sprintf(char * buf, const char *fmt, ...)
 	int i;
 
 	va_start(args, fmt);
-	i=vsprintf(buf,fmt,args);
+	i = vsprintf(buf, fmt, args);
 	va_end(args);
 	return i;
 }
-- 
2.25.1

