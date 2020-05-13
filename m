From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH 04/11] alpha: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:44 +0100
Message-ID: <20200513214351.2138580-4-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ZhpfY5SsXwRMXVq8oG2SQckFQ1KlcXnx8okrJoqKCA=;
        b=J9f+VXD35N9xl7mX+0T+f83yVVR/BgYM8RMEZCYaz1RSjI+MkVij2f44TNmQ9iGE86
         6etFqrZUffKYP1M1wze/ps4CpisiMrwWTnMSr2L2m5nhNa5DdRhGtiWzYXGCcH4SCHOR
         6bCmg4p+pF7wkc1n7vujJNPXgs88iP/adct8b8CQYCOEt+lQFy8tdVg3kvLTiy1MZ6jP
         f3tO1rfpK8afd0A1SGtKTrY4qsre9OxjLK3sQ7TXtxEP9Sff2EyVlkXtvXZteu5nRCWR
         lo+fGAss0/qYhP8AefeSr+vcsIXkj77mG7qPVT6Roqq2qA6M+07ju8yV/+hXTmOmBSQa
         zFnQ==
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dri-devel@lists.freedesktop.org
Cc: emil.l.velikov@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/alpha/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index dd7f770f23cf..6fa802c495b4 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -431,7 +431,7 @@ register_cpus(void)
 arch_initcall(register_cpus);
 
 #ifdef CONFIG_MAGIC_SYSRQ
-static struct sysrq_key_op srm_sysrq_reboot_op = {
+static const struct sysrq_key_op srm_sysrq_reboot_op = {
 	.handler	= machine_halt,
 	.help_msg       = "reboot(b)",
 	.action_msg     = "Resetting",
-- 
2.25.1

