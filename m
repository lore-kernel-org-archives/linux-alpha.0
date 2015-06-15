From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] alpha: Add support for BOTHER
Date: Mon, 15 Jun 2015 07:28:03 -0700
Message-ID: <1434378483-12727-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Message-Id:Date:Subject:Cc:To:From; bh=uBpMpg1V4okogq9C6Q+wzWAxcHT1i/IOAMl3KTSBWMU=;
	b=E9tIQV8DGQ+1TBR8rZtzwWUSMFtC10IJzEuB7gkf4SZYNj5D14Iwx607CxYe0odvpEdD0sbqDHVR3baYGJ93lxiVmDuPo6yuZiGuXYSSIkxrJSGrAprRagfwfBhl5hedjzGClSQfk/Yvb2BdAaJGefO8QAsng3CEdXdZknwsIUI=;
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Marcel Holtmann <marcel@holtmann.org>

In -next, alpha:allmodconfig fails to build with

drivers/bluetooth/hci_ldisc.c: In function 'hci_uart_set_baudrate':
drivers/bluetooth/hci_ldisc.c:276:22: error: 'BOTHER' undeclared

This could be fixed on the user side, but it makes more sense
to just define BOTHER.

Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/alpha/include/uapi/asm/termbits.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
index 879dd3589921..0d53d9e2633f 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -147,6 +147,7 @@ struct ktermios {
 #define B3000000  00034
 #define B3500000  00035
 #define B4000000  00036
+#define   BOTHER  00037
 
 #define CSIZE	00001400
 #define   CS5	00000000
-- 
2.1.0

