From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/4] alpha: VGA_HOSE depends on VGA_CONSOLE
Date: Tue,  1 May 2012 22:27:21 -0400
Message-ID: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=hVmaeFdZSDnVTtsxH67d5Ti7wD5Xxfta+D9xtYeManA=;
        b=kSEvTJtGX4OPJjhYKSKnS+1u93INtbXqxIBuqjYgOuU9L4JZN58aFoqH73F/o7h3hv
         h4SiCHOVvnkVYqsGs2NYxqIXrVVMHiLcERoXzgFkUq/N4PNwpsxjQH/46Fw7xdfaGWXJ
         rPHH4CVzriO2oEf2qrCqhEQ9DFuHR3/O1sg5YIxncJXxwE34tZ4+zODzX8I/LVJwvx6S
         ElCKhj7eu7uMlBqoJ9y61VxEujOZ03vyFFg9eOorAXojoOuobLEdyzV86UWEQa24bow4
         Sycagb+QYfomUKVRkCKU4O5Ik8TsLUv7/DuWaAUKzpoNeiZKr6MhTzfmk/zbt/s9BHki
         +7BQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

arch/alpha/kernel/console.c:locate_and_init_vga uses vga_con, causing
build failures if VGA_CONSOLE was not set and MARVEL, TITAN, DP264, or
GENERIC alpha system types were set.

Reported-by: Ra=C3=BAl Porcel <armin76@gentoo.org>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 56a4df9..22e58a9 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -477,7 +477,7 @@ config ALPHA_BROKEN_IRQ_MASK
=20
 config VGA_HOSE
 	bool
-	depends on ALPHA_GENERIC || ALPHA_TITAN || ALPHA_MARVEL || ALPHA_TSUN=
AMI
+	depends on VGA_CONSOLE && (ALPHA_GENERIC || ALPHA_TITAN || ALPHA_MARV=
EL || ALPHA_TSUNAMI)
 	default y
 	help
 	  Support VGA on an arbitrary hose; needed for several platforms
--=20
1.7.3.4

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
