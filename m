From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/4] alpha: properly define get/set_rtc_time on Marvel/SMP
Date: Tue,  1 May 2012 22:27:22 -0400
Message-ID: <1335925644-5192-2-git-send-email-mattst88@gmail.com>
References: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=dcBEShrDYTDOguG3u9kMluSNeAz/NeJCDDMca+qsePY=;
        b=VKQ2YFV0Od51Kc8dkDWMMXJmOFtkGHUN2QBS++r4NnBGUxb30UUmNPLrac270vxaBO
         cu8uz7O1LM3/frIyIoXYO4iU5FPmDEyI9ks9bycQ3f5Lfaiyp6a0HmWZywQv3jV7vj2Z
         kwWru60JiR2K8ki3945i7PpqbwwqqDqhxY8MpOMov5koQ+LkLeNwYd3tBXyS7y1J+UE3
         NTvac0hXDkmsxumaGGYv6I1Rq+ah3lK5Wr+GGklGRoNmQzggoa2SqG7lfRWUGqbDhnXr
         unOuNpnW0SwBEuXV5AqUUFuP3DvV3ZZfMP68EFugCJO6ZZLiQFddigGCkWe1CLPo4T4c
         G6Bg==
In-Reply-To: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

The marvel_get_rtc_time and marvel_set_rtc_time are static, but they're
available through Marvel's machine vector.

Reported-by: Ra=C3=BAl Porcel <armin76@gentoo.org>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Ivan: I'd appreciate it if you could confirm that this is okay. It's no=
t
clear to me how the marvel_get/set_rtc_time functions could have ever b=
een
called externally.

 arch/alpha/include/asm/rtc.h |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/rtc.h b/arch/alpha/include/asm/rtc.=
h
index 1f7fba6..d70408d 100644
--- a/arch/alpha/include/asm/rtc.h
+++ b/arch/alpha/include/asm/rtc.h
@@ -1,14 +1,10 @@
 #ifndef _ALPHA_RTC_H
 #define _ALPHA_RTC_H
=20
-#if defined(CONFIG_ALPHA_GENERIC)
+#if defined(CONFIG_ALPHA_MARVEL) && defined(CONFIG_SMP) \
+ || defined(CONFIG_ALPHA_GENERIC)
 # define get_rtc_time		alpha_mv.rtc_get_time
 # define set_rtc_time		alpha_mv.rtc_set_time
-#else
-# if defined(CONFIG_ALPHA_MARVEL) && defined(CONFIG_SMP)
-#  define get_rtc_time		marvel_get_rtc_time
-#  define set_rtc_time		marvel_set_rtc_time
-# endif
 #endif
=20
 #include <asm-generic/rtc.h>
--=20
1.7.3.4

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
