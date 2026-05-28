Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D533BBD0
	for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009849; cv=none; b=qcPP9LGhld28OwqWabiF9qWlTCb6mdO60s8uiyyz5xVr2DOqYcW61u97ObkiZubiROvGqndowCOYBzgL09JFAIxYqVVG8BUVY91BC0Qe1AE5AKBuj6im/kGDyUAhlGRcY6xrcJn6+IcgRA0nzP7J9mc+dpJGGtDiCs9jolIrrEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009849; c=relaxed/simple;
	bh=fhdDODqpR4chdblBJU8fdAmz1DLGOrwpgf0lUaM2PoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEmhg3HXV6mXvfW/E2LPunP2BmleFRjSBqpX6xHWYhxU7cEbM8UiSiZc34gFZ8BZ3fMZA6jplfQv/9FBGYhwCpE9SiDKDhSfck8DehERzU6VsKSi6LbbN0bFWpoZejxlluXlw6ozrEzzacMrxDjj14KueuTOqIRsTntfh8K2iNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6uB1knX; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6uB1knX"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7dc93d02916so12424257b3.3
        for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 16:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780009847; x=1780614647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9S3g84A5WnXh4iXXrEMsVPJdFWPARrWB1WQLZWJngA=;
        b=s6uB1knX29QnqkLhm8Fz32YH6HqwHQU0VyFZsjGSvbfJcvjlW/ABX0DlUATj1RmXWk
         rN0dxmgZJWDMrIe4fwKxgZyopijeDreRWbOdVSIK8bepkLo3RyyS34euy/2VUCKUHOTX
         6w92nc+FglHq6wPf/RH66bl2tv/4vCxnvIjsqQ4ac2srDRncE0V+VY1UIUwcbacIOWBO
         U2qUvibWUxaJ8tj1AA+vK6FGt67kIF+Vz88SD9Nxvb15owHsTaLBYg7YYTkkZgghc1sM
         Czm6+6BUFy5IUJFKpgnK06T8Gthfj49HrU8lUjHsDKZXVg07V2BwWgSuJf5fugr3DWMr
         mkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009847; x=1780614647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9S3g84A5WnXh4iXXrEMsVPJdFWPARrWB1WQLZWJngA=;
        b=NhLEgWu9lg89HYgMa4EDVZMeF8L8t4z3OiY0gZXt7rg7v5Js0ScGO4jBjTtYI6ymP0
         dY8+bHmOlA/oAOCNXbeIS38fHpGl+JDG0iENo40WWGP+v5Y8uMz3ZFcuqIJCI3mVPZys
         jLtK1mYshdyc1Dj3igOSJtTW++EeRNPguadH/y/knlsO7PC70qgBf5RWqNY+xCl863e3
         d6U32bcNC+JQSj5JQAMzc9YmyO12feRBJKeXQ47ZDDhgzp2HDqaKu9fTFOMJgubp2HvI
         1WkznAGInzwGbozfmUPs9d+A2TsagxHW69NV0z05KBf6ly/3zbugWWAXpf9pOl6hppE0
         noQg==
X-Gm-Message-State: AOJu0Yz8qEmY+F2LnuOe7xIIOPZhTXw0haHVAqaBsqSAs8RTcy7LQzI8
	rhVw2HcYIIY6rQVUeAy8xt34GgpuUNh+EpSWCB8a4YvvGTyskxBwxvDEVyXFkAqg
X-Gm-Gg: Acq92OE7I768f0dGL9Td84I2kwItRj/UZfZAoRCHenF0U0o6Ahb1sS8flBEqf0ZeSNX
	N311MYW06FcJ3Q+rpzW1uJ6fdeSSt+1HMycL5nJCGJLcSht/Vff4/r8Wg2RrS+P93Q/6/hjzy8M
	XUhR7Ia1/i2NoVxmNuc8a+G7Ug2tI0vpWfDgXZjyNYjl/jwiOgj1BhTtK08xdZSQJuKKYRDlwEM
	GbK4XopqzoFi1BKFRWRKVvXL16qdcibt+0PRG6QST529JoAyr54iUARuBCy/Rjk5sET0J9wGPjQ
	hiO2GbCXTmSkyTPS7p9uV3FXi5ch9neeRobuqjr5viD+isFKveNP0ShsTtRL07TJ72eZ74BtTqr
	DesCY96GbYaR5NZjics1hwijmGhADDBI5X8I2T02N0CAZkq3W3CY929ZmTW1mcLAp8Dmzvh5Hj0
	eCaXyojQl8xqNfpiYSWRmPrgNkAN8pR0PMyJ/Vh/XmL01HmjqqNWfOvcKBgs3zIZ8aTLR9lczPn
	DzSO+ZVqcrmj/bWC6hhA7B1
X-Received: by 2002:a05:690e:1904:b0:65c:5b88:84a2 with SMTP id 956f58d0204a3-66052cb1fb4mr144652d50.4.1780009847107;
        Thu, 28 May 2026 16:10:47 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6604e6a5b44sm261601d50.10.2026.05.28.16.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:10:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] alpha: Fix SMP shutdown hang due to missing memory barriers
Date: Thu, 28 May 2026 19:10:43 -0400
Message-ID: <20260528231043.1842326-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha has a very weak memory model. halt() makes no guarantee that
pending stores have drained from the store buffer. If set_cpu_present()
stores are still buffered when a secondary CPU halts, they are lost,
and the boot CPU spins forever in the cpu_present_mask wait loop.

Add mb() before halt() on secondary CPUs to flush the store buffer,
and use smp_mb() in the boot CPU's poll loop instead of the
compiler-only barrier() to ensure it observes secondary CPUs' stores.

This avoids a deadlock on shutdown on EV7/Marvel platforms.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git ./arch/alpha/kernel/process.c ./arch/alpha/kernel/process.c
index 06522451f018..d50f9cfd8333 100644
--- ./arch/alpha/kernel/process.c
+++ ./arch/alpha/kernel/process.c
@@ -99,6 +99,7 @@ common_shutdown_1(void *generic_ptr)
 		*pflags = flags;
 		set_cpu_present(cpuid, false);
 		set_cpu_possible(cpuid, false);
+		mb();
 		halt();
 	}
 #endif
@@ -127,7 +128,7 @@ common_shutdown_1(void *generic_ptr)
 	set_cpu_present(boot_cpuid, false);
 	set_cpu_possible(boot_cpuid, false);
 	while (!cpumask_empty(cpu_present_mask))
-		barrier();
+		smp_mb();
 #endif
 
 	/* If booted from SRM, reset some of the original environment. */
-- 
2.53.0

