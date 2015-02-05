From: Pierre Chevalier <pierrechevalier83@gmail.com>
Subject: [PATCH] Arch: alpha: boot: fixed a brace coding style issue
Date: Thu,  5 Feb 2015 20:30:25 +0000
Message-ID: <1423168225-641-1-git-send-email-pierrechevalier83@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=As+SgT9S+C84zIE4xfFE/9SK5NUXlQ9SNL1oPwI8uKM=;
        b=kx2X033aB2TaYtwjnP1VfOd/Ua41bKN+R3HtmKJlVDJHtB964Jsj6OT9oAU3SHE0V/
         EPiYXn5rz3b9quMcy1XGrSOOxiUedPO3XTMzlQVYQbx40+T5d92uB0PLqd/pgl9Yb//z
         ep6peRx9Vb7MFeNCnk9UQxhFortG/6PmJbSeubTVaWgjU++Mkimp2j1EoizMWvWNN3F3
         Ow5WoS7Fj14/RnX42BSiYtn0LShPrn5pV/5VsNzHI9+R5jc9rBuUKTVx570fxPRWX8tI
         6eLWGb10pB82hDk/4Rn/HKlPoSG1MiWjpE61vK0PpRbCVrAuEj+T68Kcdx7cCErM7G4q
         aWkw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre Chevalier <pierrechevalier83@gmail.com>

Fixed a coding style issue.

Signed-off-by: Pierre Chevalier <pierrechevalier83@gmail.com>
---
 arch/alpha/boot/bootp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 2a542a5..c2b3bce 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -177,9 +177,8 @@ start_kernel(void)
 	move_stack(initrd_start - PAGE_SIZE);
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0 || nbytes >= sizeof(envval)) {
+	if (nbytes < 0 || nbytes >= sizeof(envval))
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
 	srm_printk("Loading the kernel...'%s'\n", envval);
 
-- 
2.2.2

