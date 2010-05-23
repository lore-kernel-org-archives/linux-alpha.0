From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 124/199] arch/alpha/lib/srm_printk.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:18 +0200
Message-ID: <1274644466-24577-16-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=kIAmnI8j586QqftAg/W12cZ5WD371b96WmSZpqv7y4Y=;
        b=BRXWItTZeTDIzF2MIm4lEGYW8e4MQIJGZG+zUlDKggTPExtfoDqpX6p76NZuDTmeKp
         3d+4w+0slcUtUS0YnGzo/DQayxHT2khhRZEIYxy+620boHjGAvjXHaVx2+f48gXCXrdD
         Ngv/+c3ADz49CEKnzdqxzV8O/+axCr6iWM40A=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/srm_printk.c:32: WARNING: braces {} are not necessary for single statement blocks
arch/alpha/lib/srm_printk.c:39: ERROR: trailing whitespace
arch/alpha/lib/srm_printk.c:40: ERROR: code indent should use tabs where possible

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/srm_printk.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/lib/srm_printk.c b/arch/alpha/lib/srm_printk.c
index 31b53c4..7fd1bcc 100644
--- a/arch/alpha/lib/srm_printk.c
+++ b/arch/alpha/lib/srm_printk.c
@@ -29,13 +29,12 @@ srm_printk(const char *fmt, ...)
 	if (num_lf) {
 		/* expand each linefeed into carriage-return/linefeed: */
 		for (dst = src + num_lf; src >= buf; ) {
-			if (*src == '\n') {
+			if (*src == '\n')
 				*dst-- = '\r';
-			}
 			*dst-- = *src--;
 		}
 	}
 
-	srm_puts(buf, num_lf+len);	
-        return len;
+	srm_puts(buf, num_lf+len);
+	return len;
 }
-- 
1.7.1.251.gf80a2

