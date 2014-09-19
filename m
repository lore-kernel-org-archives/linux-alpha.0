From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2] asm/uapi: Add definition of TIOC[SG]RS485
Date: Fri, 19 Sep 2014 09:18:13 +0200
Message-ID: <1411111093-14411-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=3NCiYt/b1wYt1so4wNhkKicgYq4Z+oDKDTa8ueIAxgo=;
        b=lYj2tdYvUaq15Ze7OkJPLSZPUBMVwsRpNvxdEZm2xrVta8lSQ12t0z8DbIopn2nsvi
         sirA6neIOLfi2FaCS4MwhahTEAEBFzPkSAoWBdHgclnZw/iCulU6UopscNyJMlcHVr2O
         jdREWw+c9uSEt8yknpF4iR3TOWW6TEHamWi32N96N33LQXaPOP2vv6HuBNgHAYEOUQad
         i56pa5sYXLI3l3qIMM+DiZLHQZEc/LhdjxplVCfEvMcVx7pRn1DOFVLB4dk0747wte/j
         B+D66p0csRl1e2ck0CxOuguyhF4pq0lq1KH+QXEjK3NvVTS0zIqgzz/RbJZmMLyuRdwK
         bpvQ==
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, linux-serial@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Commit: e676253b19b2d269cccf67fdb1592120a0cd0676 (serial/8250: Add
support for RS485 IOCTLs), adds support for RS485 ioctls for 825_core on
all the archs. Unfortunately the definition of TIOCSRS485 and
TIOCGRS485 was missing on the ioctls.h file

Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changelog:

v2: Suggested by Guenter Roeck
 	s/Unfortunaltely/Unfortunately/


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

