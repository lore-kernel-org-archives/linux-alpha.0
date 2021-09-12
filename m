From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed memory location
Date: Sun, 12 Sep 2021 09:01:49 -0700
Message-ID: <20210912160149.2227137-5-linux@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7vOSXJvuBFedGqEmsc9y4fLwgAcNpSGF+uyNF/6Rc4=;
        b=GVTomCds0oHSZwZ+CTeT02sfHZ+uX8vQBFkmUFHVSBVMyoMK1poVF7DH8H5r1UYFRK
         aPCLOAbhNTN0Pf73m3EnkBCGrCx8Sz8mfm4fpr03P50xQCkmjPnx6H1fMBfR8TXi2yql
         7EpXjBZQjVBhuRLjaeIAzrOfigBrZLiN1cMRentTn0+/xh9NknH0Wl8VZJEOKW2wEAbz
         cLq7gUjvQS/t3euFq+3g8iDOzvLSyu8Sijmu75+aIQRni0rJJTrPiWLF1zYZ7e0lMEjv
         TCPoA1bHoUyY94AnRaVage1SFWbZ2fb2dbI3Hl/OEyUsEJ3gyUrP6RZBCknb7+wWO1mY
         VqZQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210912160149.2227137-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

alpha:allmodconfig fails to build with the following error
when using gcc 11.x.

arch/alpha/kernel/setup.c: In function 'setup_arch':
arch/alpha/kernel/setup.c:493:13: error:
	'strcmp' reading 1 or more bytes from a region of size 0

Avoid the problem by using absolute_pointer() when providing a memory
address to strcmp().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/alpha/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index b4fbbba30aa2..aab477a76c30 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -490,7 +490,7 @@ setup_arch(char **cmdline_p)
 	/* Hack for Jensen... since we're restricted to 8 or 16 chars for
 	   boot flags depending on the boot mode, we need some shorthand.
 	   This should do for installation.  */
-	if (strcmp(COMMAND_LINE, "INSTALL") == 0) {
+	if (strcmp(absolute_pointer(COMMAND_LINE), "INSTALL") == 0) {
 		strlcpy(command_line, "root=/dev/fd0 load_ramdisk=1", sizeof command_line);
 	} else {
 		strlcpy(command_line, COMMAND_LINE, sizeof command_line);
-- 
2.33.0

