Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418D47FAF3
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277903; cv=none; b=EYyI43IomWTVTyjb8eIpDxbzCyT3qj743KH5rb9bvmnfzsgNrS2JVKOpDgzz0U8dUTezQuBUrQRT3XcpQxZuEjFvo4quH7QiA6CXfykx/NQ+y6eHWdVirW3l+T/hejo3TtgvILz/3Lq2cw6LT+2sOu6EdWEbCdSTTIF9u7aTy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277903; c=relaxed/simple;
	bh=TYg9qH5ILBnknqUMuSWUo8TnTLf1mm8pUfjGjUaP7hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd8KhNoj8w4FB6mY8hVk+YBFmGytgxU1nvcXxYG1lJSgJ2iiB/qxXFzkQWtUtoHzHoKQc3jwiH1DHWnPJL6esCAE0R74QOCPPytWaHOj3T/ZcBkuiOU9brTuEY/9KvFNKvqM9MK590wy5USFQZO5D/LulqYjHXriLnY2MzwkFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd9s35d0; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd9s35d0"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ed2a06b9eso827857b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277901; x=1788882701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Js2bbMDNgWHCeTkCKmLJXPFgzdnKQnr2VHntpZ+iEMs=;
        b=Nd9s35d0jeB8U2/DBOygTaJXqL9jvxIyDrrkz9LjhaCkhOlKIGUKMZDllp0B0vIuOr
         EAsPyTFCJD44QBkGDncztCfrb+eJKpRNAXHgQVzjey0f9xazii+laBQRZN4lvkDBWP+L
         +bL7z6cSI8DclguP88XHosx1qU4siRnkBlEoBHWAs8nI8QurVn8HBAuJ0PILrrvXAuRX
         Q8bcwFbqqAPMmkXwbwZKP9tnrdbTKjAfIMo7IVBsY+dODYQvv0zh+ZoVgYN6VUMJ77bW
         mE+SwXnLALKcqZ9D6k1r6u4BHAqOAMkZKZkS7OjjEaOwccPn6nwPVtzYcukZfcdq7u/3
         b0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277901; x=1788882701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Js2bbMDNgWHCeTkCKmLJXPFgzdnKQnr2VHntpZ+iEMs=;
        b=GIe0Si1UayZMu2uo+h5iHk7Dd12Sr23Oq5wJ3Y8JoV49lfhth6ttaZzS/eieCpRpta
         j2rLzQMLFNVbKveQu1MlBQ9AqwkZq5B8ii783l2OvNghGhOIPUbovNX1+FJt6ArgzsAF
         ZIuFiUyLYagrKyfJkwqe5eMrQzgeXAm3iWSn6TuGfG+QsGif3HQ1dDeEV//obuqbh1BY
         yBESXcB8ZemmNNdLIi0eBIGeAjU0wtlsGwGGBlW5qx9/JN7xG5LDtvKXzR0TSS10U7Ts
         nxfGxu2geVkGpA5o81fuu3vosf4XyBtOdzGBtHz+B0yS4a2s+A9xO5NoYU5WWJZNufN2
         KWhA==
X-Gm-Message-State: AFuF++nNz0cib/P1Dn2fcTlhIZWghoJevegMbWc490HL0blIasb/qXlW
	W6lQlJeQ9ty0zukfl+c7l1nyG2l0IL9iyYvaboISAkFv9zMGYiF0vdFZ40AZ9g==
X-Gm-Gg: AYBFou2PvBI+2EgpAwolyVw9FX7iZAtETNwXi+BhpuZKPg3eGeFLcuzb7ExgbNG+OCS
	+p1aT07ZxTuHU1oSCLNyIQihsrwQK6y/NYt399Gr5X+RBts26TQJFzzAa701uNt8jRIWXFtpG9F
	/FG5jysqO6jBu9akdSn9bV5fQj+bpkWp7j+f7NWWn9Nx8GKD4Ex4Z933CUQa+/hDHGpWHMln5va
	jjLEVMqFo0bKF4qSQ43w+FIkN1Hhtp5TZipnshWQ4SuOcIJLam9lKVWh5NZaDmhCcw4fmxyeAmY
	daJMYOZTG0qxLrPlfwzXFTBz12Ah2UYj/2IXflsv0iuyH630PtwOqFlTyVLsSfGaZ9DC3cBiqvP
	RBzWw0Iy/4je3hf+urNzs8b0f5hqDrFRyVMnd7liVt5L8ZPY7/h3YkCH6w82KPOp60IkOm/Oxce
	nb7YPRV1J2o9U0m2t+sEuGdJQ7Lsb9dzj3cF+bEK/uwIEXcDWGmjYtYVdnTTiy0nWYRwOewFQG5
	kSkqm8+SYCHnQZKg8RxwIvtQHmFep7bWOqOGDCD
X-Received: by 2002:a05:690c:e3e6:b0:81e:6a10:f90f with SMTP id 00721157ae682-85d6a2e13f3mr136074517b3.17.1788277900889;
        Tue, 01 Sep 2026 08:51:40 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abc938sm76373567b3.37.2026.09.01.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/24] alpha: select ARCH_USE_MEMTEST
Date: Tue,  1 Sep 2026 11:50:30 -0400
Message-ID: <21e157eb4865cb6d2d9388941d5d1dfa2e0fc42c.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up the generic early memtest from arch_mm_preinit(), which runs
after parse_early_param() has picked up the memtest= command line option
and before memblock_free_all() hands the memory to the buddy allocator.
paging_init() would be the natural place, but Alpha calls it from
setup_arch(), before the option is parsed, so the test would never run.

The test range starts at the first DRAM address rather than physical zero
because low memory on Alpha is owned by the console and PALcode.

Tested under QEMU with memtest=4: all four patterns pass over the free
memblock ranges, with no bad memory reserved.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig   | 1 +
 arch/alpha/mm/init.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 352615956b1e..c4b4a9b8d770 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -20,6 +20,7 @@ config ALPHA
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_MEMTEST
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
diff --git ./arch/alpha/mm/init.c ./arch/alpha/mm/init.c
index f4d65a60c869..6c28947d6e2d 100644
--- ./arch/alpha/mm/init.c
+++ ./arch/alpha/mm/init.c
@@ -226,6 +226,11 @@ void __init paging_init(void)
 	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
 }
 
+void __init arch_mm_preinit(void)
+{
+	early_memtest(memblock_start_of_DRAM(), PFN_PHYS(max_low_pfn));
+}
+
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
 void
 srm_paging_stop (void)
-- 
2.54.0

