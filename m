From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 4/4] alpha: Fix uninitialized value in read_persistent_clock.
Date: Sun, 17 Apr 2011 13:05:26 -0700
Message-ID: <1303070726-32155-5-git-send-email-rth@twiddle.net>
References: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=/w+ghpZAl2meNHVousGAp/B1sCMmYRQh5BGotz4FLTA=;
        b=nr8dOZlrhRO+C6whOi0ViHlCaSkV1EWKpG0yub2FB0XAbFkLco4hrlhiRpkUoD10My
         2+6NK/g3Zb0RAAqagiQe6F2R5TcZPssNONoKiYaLqVKVl7hn7FXmgayFXyi/4cD2CZRb
         LNbUZGeQTpK5Uii2rWRizCFzh8pyARN4GKryw=
In-Reply-To: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/time.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index a58e84f..918e8e0 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -153,6 +153,7 @@ void read_persistent_clock(struct timespec *ts)
 		year += 100;
 
 	ts->tv_sec = mktime(year, mon, day, hour, min, sec);
+	ts->tv_nsec = 0;
 }
 
 
-- 
1.7.4.2

