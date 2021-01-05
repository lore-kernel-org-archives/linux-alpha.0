From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] alpha: Send stop IPI to send to online CPUs
Date: Tue,  5 Jan 2021 10:16:27 -0500
Message-ID: <20210105151627.579336-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609859794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=s7UoX0Y+ikwYQJjKfgdSrYJLrwW4Gbhf+F7iH9SWWeM=;
        b=eaxNhVM+XC6AKceREAPM6zqT4/qNcvMdkpk5HMJDK2zIpW1VU/hBm0O260Os5vYAe4Dloz
        8L3vlwbcdVqtc0SnxvREotit7tNdD2aQopgH8jPAGeqbCm+BbsCkRm434eYQRYDvGLzkv2
        VLbX+00pzrbyd9/5vKAS69NT20Td9WE=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Unfortunately I do not have any HW to test this patch.  Hopefully someone on
the cc list can help me out?

P.

---8<---

This issue was noticed while debugging a shutdown issue where some
secondary CPUs are not being shutdown correctly.  A fix for that [1] requires
that secondary cpus be offlined using the cpu_online_mask so that the
stop operation is a no-op if CPU HOTPLUG is disabled.  I, like the author in
[1] looked at the architectures and found that alpha is one of two
architectures that executes smp_send_stop() on all possible CPUs.

On alpha, smp_send_stop() sends an IPI to all possible CPUs but only needs
to send them to online CPUs.

Send the stop IPI to only the online CPUs.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>

[1] https://lkml.org/lkml/2020/1/10/250
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index f4dd9f3f3001..f3a58c1fdd55 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -583,7 +583,7 @@ void
 smp_send_stop(void)
 {
 	cpumask_t to_whom;
-	cpumask_copy(&to_whom, cpu_possible_mask);
+	cpumask_copy(&to_whom, cpu_online_mask);
 	cpumask_clear_cpu(smp_processor_id(), &to_whom);
 #ifdef DEBUG_IPI_MSG
 	if (hard_smp_processor_id() != boot_cpu_id)
-- 
2.29.2

