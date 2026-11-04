Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804618;
	b=p7BFl57cWggsWpvl9FyGzYRjMU9YL50Zw/A19sHLF3cDu8LTJFevUTJjJEEpc+Hua0mx
	 wXz5COniUYyuVT/9MN1qOxS7QvvjZR53nQ7zkCU6PH4zUTYOW6QzMeC+DSooEI1cgYetw
	 JZNrhRyhCeCPfeaZI0fgqeSJ66tee6VCgxJdZbHvAHfQFDhX23/B20ZSPpil0IaaNw2Mq
	 PLOAuY/+x/sFRdJ96fXPM8DorTwy0QdGacHkSD1yuKIrRV8s5Qr5DfhyF82oECVEGw+Ao
	 FUF7kY+lraM2F0UWl+EBHVJRBCfbd9WL75cuOQkjTWoBrOcwG/kBTy2eal0V+gt+Uyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
	b=3vCskbAorBoKC2jl0oL1sxYWa/kGQSNIuXvg8RPk6TPY/7dhnDmZ72q5RYS/egV19gp1
	 XwiPZSSFGox+gmUYsLNMyaBuEvpi4mZfEDtyv0HYN2jUdUVR6dth8wXMl+rkOjFtJ3Qrv
	 TZTG6BGnwCnAH4+74lWddRQlw50oXQ4PW2skKh6e8R4pbklm+4saCRD4r5xgUqVPXBqSt
	 o1kcP+oHYyyV/LB9P8AD/dS1+y/8eWrehYSOQ1YT7h2R+hXU3HMNhCg1Z6Vb4AKxb3Oss
	 mmck8Y8LN5JSTecbLWPGXwZqB1osYHoGlGEz0xt6lsd8wrzAos1353a91yImDnB1gSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk5J2toY;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188ED606D813
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 15:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188ED606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk5J2toY
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1280701eec.0
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804617; x=1794409417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
        b=wk5J2toY9fRlni4nSjngWFeIdYhzk9B4vAMbGkcAaYVmPvs4oJxlGaAiWuxpih/KS4
         5TNfYGJbcJmSDmvYY0nCQn0Ncgib9GTZ3cS31doE678LPA6pVTw4nHrQ8yHUBqZeoQt0
         C/M0YOeKQggDUm3AkkXVZa6EyiReL4muBlkKa9N6kxabiNjRSk52H/b5bdnbuAD74mlv
         3ChZcknw51DYO4khI/A6GiaNHbsWs0gv7qlJhaeQp2htaRW3ldi0kPd84I5Yo8s3Z6uy
         GfCeTfkSzolI1/+8DyQelZJN0R07NjcmrLUm4OPCGMZBvW/jrB6+Z4TDS2ScMgMqkPHY
         ROlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804617; x=1794409417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riKhaylCbDlpVRlcWx+ke8rGc+IoyU2HKm4r+6p+j+g=;
        b=mSsxsrDzGUK9gZXc7szqoa9l3iCdrK0p7w97BzIU2J7cZ5p1DrC3Cd+cbEDcAFAKgv
         BUjEB8+WsctTGeoSDoARkJ4HruAe5j8xzGVrAm6mdfyToBYOi6j2ANizdjHYlE50nfMj
         5uQQm9eQyhfCYCf7Q8NNaNLY+c3m1/gsIDKhLaVEfsBnmfcVObZJEsKuo+LEdG0MnFVA
         f+D0ziZ8XM1KDoNWHtbhkh3A+AWi4ShLQJNNrGaZtk9AXqkc1YG7mnDmXpMn6MA+wYNg
         FPrzNcG3T6Qq5RPAXO8HkMhK6uNpZunqOQO+5WJStxQjAA7KL5Y7Gmqub2i/Q0HP3Gmm
         tzoA==
X-Forwarded-Encrypted: i=1; AKwUvBy/8bKg6MhBxd4lavx0kestqRUzxcd1R7w7n9+wAclcpGy4aijWTZc3rcfuwTF9soM2dPr3LOU9OvbxeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hvBsy+yoD5XNADrEo93Rg77DDCFlCIjh5bchH2iyP94v2y7ia
	20Pbkh64tN765skYq9nolfhxqyhFJ1+knk+rro1kivw++O4B6DIhfkNC
X-Gm-Gg: AYBFou0F5t+yvek2GbQ3Z2poaVoPkXeOoQRa2jMmvpQ+NwOuz2n5G/aMzqNd0VAi2Ef
	njbz/K1wPQA+RSLhhvj+UFNdcUaylpNB1YdJDZzEhH8IvqeIiZXbtz7DdKfd3L6sIS6oJbtBYyX
	Q69bwADL2pFxrfqNHqVYV2lG9kgF1a6L1tl5H8JcZkDtNLQi4prLWynGOOlHkmmr1fXWG+Z/qGn
	I5Z/v2FEBwVDgKFJMEPQI02/OjWCUZkzh+DSVx5Ui5qMaO9RFMl5oMvdDsLsEdksK9hpAbbLUSU
	eCpUp+rO6TwZHegiC8d9jLVixaLV8+9tIewiIX6W4MTImqlJSTaE+AhCFv0rWSi5xQ7NTimejss
	vhkQ7oDlt447gjkURV7CbJTaHrxAItsAmuOMLvTBbtq+465082yHVO6GiztabLGvniG62RH8wUE
	Zi/cha55wRksalP5k6pwyuEpgGZcNVWC3LjdqGZViLUgusLH3cIZxLqjSO2jHU9qoi0X9GDVmhm
	tErRRm3UO8GN7Nc7YCBHb8ecz5fqJY9EL+Xn3QfaSNJE/eVICrpyWar0SiFs0daVXbQFpLpWvlC
	Tpei4Xp1CbUgb2ERJza2dlZ1c2h7a6MDtODY7Mwn7JSj4j02yGXkL6daai3mkHd2nWbJNHy678m
	K/6Rhk1uhllSKRwfyokGZg8Qf3aE=
X-Received: by 2002:a05:693c:638e:20b0:366:703c:5ef8 with SMTP id 5a478bee46e88-36a423935f0mr25717811eec.7.1793804616731;
        Wed, 04 Nov 2026 07:03:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm9351643eec.16.2026.11.04.07.03.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:03:35 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] alpha: use min() in tsunami_console_data_log()
Date: Wed,  4 Nov 2026 20:33:24 +0530
Message-ID: <20261104150328.33387-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dump length is an open coded minimum. Use min() instead, and include
minmax.h for it rather than relying on it arriving through another header.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202610201902.6BG70hxk-lkp@intel.com/
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/alpha/kernel/err_tsunami.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index dacf91d95..97e85237a 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -6,6 +6,7 @@
  * Register definitions: 21272 Hardware Reference Manual, revision 4.0.
  */
 #include <linux/init.h>
+#include <linux/minmax.h>
 #include <linux/printk.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
@@ -650,7 +651,7 @@ tsunami_console_data_log(int cpu, struct percpu_struct *pcpu)
 {
 	unsigned char *data = (void *)(IDENT_ADDR | pcpu->console_data_log_pa);
 	size_t length = pcpu->console_data_log_length;
-	size_t dump = length < 1024 ? length : 1024;
+	size_t dump = min(length, 1024UL);
 
 	printk("%sConsole data log for CPU %d (%zu bytes):\n",
 	       err_print_prefix, cpu, length);
-- 
2.46.0

