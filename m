Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1C146C826
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295465; cv=none; b=XlobtBklWkzPXRYooKTqZeqryza2aALJ/o222Zn28GLp7uuCf877oNHTLYhT07hIy5YmyQMuS+ejZnSA5JXFVM2IwkNIkEl4XLHXB+7cU75TCimc8/Y88Upnk9Yi6OYA+isEM7U4hD6zby9zezKJ1SuCwbJ0gQ10uF4Kvv+FcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295465; c=relaxed/simple;
	bh=IZZtRHJr+e42CAizBt8VTtUypllcIwka88XR1oYPtDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVn0QYCjOP/O9J5Gxr2mGeWPyn73DFhz59N0JjcVd7Hw44WN8SgygjAD1jZxXhBTic0wA6XEFp4hS2dFQKYy5xOJE46hNobb7m9A0W5A4nTwoiwt+73VrgRH0lMkl3CHwVJBX4zo/zk1lhXMTdSCZEQrPtYOKPPZxqjDTVJQ0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpqNEVxE; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpqNEVxE"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8565d77c277so8050447b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295462; x=1791900262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S0guEw597JkjZhCyocLM7RkGqnoXsc1m6z3K9esQi4=;
        b=XpqNEVxEfzTWdjLdbszXKW7xPbdBcSqBWHy/bRDr72bhAbh/8QZuE3nhm/Gp6bixao
         ZNdT4bEc5o02ZszHUD9qCceq9XD8CPvL2uEa5JhUXnbWrHxEvqY2rAUKLb4XvhvAsfdQ
         jM5zlpar/rDEdrpCdwjDpa4/VdpYpWUeTWO70oUswNhG5Q9QH2uATj59I5F8UEygHyO8
         KHAv94cRhk7FMljgxF/zSbMXe1PSb7TL02zWThp0VgO1Qm5WfNkxFf65LpOTsuqdyYrG
         5BQ1Nnjuje+B9y3/kKhkZ6jZ0vmEWN4XmxaVPV6avueyD4hYj53xseuDPvsDM85i6iOh
         /6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295462; x=1791900262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3S0guEw597JkjZhCyocLM7RkGqnoXsc1m6z3K9esQi4=;
        b=YLoGi00LaDKN4C+59x0eRG6UCYdiuzTV4+ml4aEBsQUR602xiBWpb9lAeqWJPfrl8F
         hAWZeoMoygaQYXTrdS5fB4LnDeGq1Zmrbm38xtS6zeomN9lco7F9tCwhWj09ZBCUYNd3
         EZNvLLHWyR3PE02pu5Zg7PEDfincqQFItqfemrureeQSMfCYmOt5dgUylb7GPKdaYuh2
         xS5GuZ/klhorG5vTvKeqO3nt312+NnLdc0212EiwVsw+FDiMuIOhnbrdukvhhm1e6NwJ
         FByFGvXmHKgT7DRr/H2I/4LPH/8wBnWxxoosIuDT0Evq+Hay7J6lEq0BFp46vFS8p7E7
         fJ8A==
X-Gm-Message-State: AFq9FYLg4p7+9l3Y6M/fS0QOiV7XLK2kkBdTuaDph7HyVQgKI6tTDrjd
	uXfhydEcvNBkwzpuzRc1TTUJku7+Nk4tWdFhf4psO6yosDxpKasLXa2G
X-Gm-Gg: AYBFou3gyej22S821hBKLN/y5nK7RX40ZLvSqgaMyKzeY+a339iZJiKXhhlDQzIHcrF
	BOcyKo73D6R/V/EsYYBqh9L1Uh76Fhmgx+YqKz/rl7/dIBn30d5Luu3z6FICGlykE0cvYQNZaox
	z6hXytociaCgAAVRBcfY0OAR7bbq6z8/lZLenEugQ7Db39u5GigtNL4TmK8ORRe6Wst+0BZtYyT
	3HHAHIS6gCW7ezm9GAKL0fIFJXqnQyhcIcylv8L6+7Ywb+eJfsBPuC77dcKIOLckGwt1IuGtV9Q
	SFZrgw8z4C+YWLLOLEV9y/YGiWA19BREwgDU4OD3UBeBoIrnfZ2gnmmUMEb3aPCYZC9hF5eDAr0
	qx9R8grT+0CzZtVNgXchqOrox2VCCkHhwhCyrVbGC74oHrFLnIaWNe3zMjr51J/w5heONjqaUMV
	a95j13jIJ5v+7xDpRzRqDVFJmGIeUaV/x5eTaoPyuNSn4ABlRhBOnu2jZvXud+B0YODrWMozc=
X-Received: by 2002:a05:690c:d8a:b0:88f:df4:1c7d with SMTP id 00721157ae682-8b04f3b5c59mr5561367b3.14.1791295462208;
        Tue, 06 Oct 2026 07:04:22 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af19328814sm29028457b3.13.2026.10.06.07.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:20 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:14 -0400
Subject: [PATCH 2/6] alpha: handle VM_FAULT_HWPOISON in do_page_fault()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-2-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IZZtRHJr+e42CAizBt8VTtUypllcIwka88XR1oYPtDs=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L/L+Tl41dkdz29cFficvi7IyMzWa8qt/Uca5K9c/
 rNG0ep5b8dHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBcs3oaI8O0bS+E81
 lLzwXPmH/zehqjOXvFzbOrzO5WCR9ZsUxJxnMVw/+6E5WSa26mztW/uYx3X5aA+rxpfi5Sxus++
 NgnenlEtzICAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

do_page_fault() handles VM_FAULT_OOM, VM_FAULT_SIGSEGV and
VM_FAULT_SIGBUS and then falls into BUG() for anything else in
VM_FAULT_ERROR. VM_FAULT_HWPOISON and VM_FAULT_HWPOISON_LARGE are in
that set, so a fault on a poisoned page takes down the kernel instead of
delivering a signal.

Alpha does not select ARCH_SUPPORTS_MEMORY_FAILURE, so the machine check
paths cannot produce these. UFFDIO_POISON can: it installs a poison PTE
marker without any memory failure support, and a subsequent access
returns VM_FAULT_HWPOISON. Registering an anonymous range with
userfaultfd, poisoning it and reading it back reliably hits the BUG():

  Kernel bug at arch/alpha/mm/fault.c:188
  poison(50809): Kernel Bug 1
  pc is at do_page_fault+0x4e8/0x550
  ra is at do_page_fault+0xfc/0x550

The BUG() fires with mmap_read_lock() still held, so the faulting task is left
unkillable in D state holding the lock, and shutdown stalls behind it.

Deliver SIGBUS with BUS_MCEERR_AR instead, reporting the size of the
poisoned area, as the other architectures do. That is the huge page size
for VM_FAULT_HWPOISON_LARGE, which becomes reachable once alpha
implements huge pages.

Tested on an UP1500 (EV68AL): the reproducer above now takes a SIGBUS
and the kernel logs

  poison[373]: hardware memory error at 0000020000030000 pc 00000200010007ec

with no oops, no wedged task and no taint.

Fixes: fc71884a5f59 ("mm: userfaultfd: add new UFFDIO_POISON ioctl")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/mm/fault.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index dfe427d93072..24408b53197c 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -8,6 +8,7 @@
 #include <linux/sched/signal.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/hugetlb.h>
 #include <asm/io.h>
 
 #define __EXTERN_INLINE inline
@@ -113,6 +114,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	struct mm_struct *mm = current->mm;
 	const struct exception_table_entry *fixup;
 	int si_code = SEGV_MAPERR;
+	unsigned int lsb;
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
@@ -185,6 +187,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 			goto bad_area;
 		else if (fault & VM_FAULT_SIGBUS)
 			goto do_sigbus;
+		else if (fault & (VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE))
+			goto do_sigbus_mceerr;
 		BUG();
 	}
 
@@ -248,6 +252,21 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 		goto no_context;
 	return;
 
+ do_sigbus_mceerr:
+	mmap_read_unlock(mm);
+	if (!user_mode(regs))
+		goto no_context;
+	/*
+	 * Report the size of the poisoned area, which for a hugetlb fault
+	 * is the size of the huge page that could not be mapped.
+	 */
+	lsb = PAGE_SHIFT;
+	if (fault & VM_FAULT_HWPOISON_LARGE)
+		lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
+	show_signal_msg(regs, address, SIGBUS, "hardware memory error");
+	force_sig_mceerr(BUS_MCEERR_AR, (void __user *) address, lsb);
+	return;
+
  do_sigsegv:
 	show_signal_msg(regs, address, SIGSEGV,
 			si_code == SEGV_MAPERR ? "unmapped access"

-- 
2.54.0

