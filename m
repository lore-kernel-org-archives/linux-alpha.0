From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] asm/uapi: Add definition of TIOC[SG]RS485
Date: Thu, 18 Sep 2014 08:45:45 +0200
Message-ID: <1411022745-6198-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=lsp0Hs0q3aS1BGfu7iaZub+fOrG/+/i4R/Mq+pVLZ6M=;
        b=FrJUJWB5IT8u177e4rlOI54oRObbEAfYg0E0YSBn6rbqvuIT5oLqGIAGabe9gtKc0C
         XiB3xdE7OjP1wejJ/fb+LbQl+cddhm+qk1tqw0EuWdGI99bJRN7FoBmjKlUpaJ1B0VWX
         NgQGDOKOhpX7B5sA7do5zEC/vq4ICMBPrMq2rNkqsCk68g7Elf2leE55+Umz8yedS0KE
         QQKjM740t9LyJDmkdjyJeJbx21zWpVtq3/+Q4DKfZzLOz4xAaVGlpkNRebu1A0YL6gMj
         qsbES+BlaBEmLgMS1aTYtdUbGVPo26aQtO7qtMeYFCgvwby5KfM71AA+erH4xQYPjeEp
         aChg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, linux-serial@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Commit: e676253b19b2d269cccf67fdb1592120a0cd0676 (serial/8250: Add
support for RS485 IOCTLs), adds support for RS485 ioctls for 825_core on
all the archs. Unfortunaltely the definition of TIOCSRS485 and
TIOCGRS485 was missing on the ioctls.h file

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 arch/alpha/include/uapi/asm/ioctls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/uapi/asm/ioctls.h
index 92c557b..f30c94a 100644
--- a/arch/alpha/include/uapi/asm/ioctls.h
+++ b/arch/alpha/include/uapi/asm/ioctls.h
@@ -90,6 +90,8 @@
 #define TIOCSBRK	0x5427  /* BSD compatibility */
 #define TIOCCBRK	0x5428  /* BSD compatibility */
 #define TIOCGSID	0x5429  /* Return the session ID of FD */
+#define TIOCGRS485	_IOR('T', 0x2E, struct serial_rs485)
+#define TIOCSRS485	_IOWR('T', 0x2F, struct serial_rs485)
 #define TIOCGPTN	_IOR('T',0x30, unsigned int) /* Get Pty Number (of pty-mux device) */
 #define TIOCSPTLCK	_IOW('T',0x31, int)  /* Lock/unlock Pty */
 #define TIOCGDEV	_IOR('T',0x32, unsigned int) /* Get primary device node of /dev/console */
-- 
2.1.0

