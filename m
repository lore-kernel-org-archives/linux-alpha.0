Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E53B14DE
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 03:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429864; cv=none; b=E8PWDvt7ufcuQAWn6tyI81WFItmqdt0lDRp0hbECXcnhNq6BorsEVDozurnY8D8hdao3PwNWBs0t2MT2ZZmoJwJD91HE9vjnJ9DIyBuRMcLDJTDuQgqoUkpPro8pFsolU0p0T9cntALT7KgB/p4d5htJWNIVEWc+tQeXL/9mUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429864; c=relaxed/simple;
	bh=2kMyDbAGY5vdX4Q8C5boz5BouESaSfNKdivc60A8OSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRRrAj80REmzfuJZZ0YWvMKTD6RdPxIIqxxYwLRak3GIu3fD1Q8uZ5prNdaOjCiIcX9/Jf0Pf90fP73vq/mA+xOHQDWe6MdRQ3mUnPbkYWoapd7H6cMyP4DOi4GjIDaDj96iXEgpGJC+tAKhrdSziqazvD0n9yYSlU6hhA6a3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKLMmjun; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKLMmjun"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6776efd4ff1so2839507d50.1
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429862; x=1792034662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goo/UYUNzJJGzS1feJQqHd4WDFi+DYK+JC7jIr2lovE=;
        b=JKLMmjunA2AcOPFNPmg1s2wdgaTi0qUzY33wmfSar6aGzz0vCBSInX0SW5xKeeA6QQ
         V1KImWOCMnC5V37M3cry8fY9L1BkEP/JYG8R3U5k0gjPrUiZzwVOk3BnFQJwsDP2nExz
         p6VGO2fhMm5sL7CWyGHZL4ScdcNfJg5qHwZC5kIaDc2tsgNyssj1vJjvIpO2M9HDpmTS
         FX5wVUvl4mhDAxC6RrKS+v3c0w7DV1sfqFmqzecNyk35qlGYprlFBqZpnE55HS5nkNF1
         st5pkcOM3tpdF+3wQD169wz556Fshe+uzUArX1xzotC1ndLGHsVtTl6CWTB6+eZ01mVl
         LHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429862; x=1792034662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goo/UYUNzJJGzS1feJQqHd4WDFi+DYK+JC7jIr2lovE=;
        b=0r9jx09aL0zxUfK3dEAunYQW5AmK/tk0o9Y9EEzpIcedFPVjz+vbrCtFry+G56haa6
         E8xblA+BYFZt1zPTq4YIrjtOkJn9ej5NwtOWa3D77ZSOqmXbuQiZPBZDP8MoTFDwWVdX
         Duq5Iawx81gbU+bH7Ky8h8t1JrvqYnBVUd1n/uZJR0lKUYwxZswTJWv40tWRsKAdWsn7
         3z1zsUtS8WgWINIjTTgmy539UJmL69JC64CR37SHn2NluXYs/iOc4HoKYWe8B093q7IP
         D75zAqQ9c5fmP8FsFEDQlXR8F/8FVV7md6KGHIgVGhpGNGKSTc/eTu59btIlpXmWAlvE
         YAoQ==
X-Gm-Message-State: AFq9FYJlR24I4cPSuMEbl7rLKmSB130EsWM1HYzLl4wpYYMZxUO3tG6y
	/Lwd4t8teCX2qCwlSR0o0paYEusuupuMngGBvLGW9vK69NsQb/AgHhMH
X-Gm-Gg: AYBFou2z3uCP4HQyBjdS0AWcCUhOKQ0uhDnw7sHvJlsJ1NqeZrKO2ESLq/nrXqzPcZK
	IgPxOjZLX8PRgzXiIR54CGeN6AyHa1qsTPTwSeLVTEZIuWPJJo4mMhT7ucJ4OvSWjv+1wjndDGY
	m0SCpQx3eScKWsKgjMW1U4z+Mmpjn8oF+ZvxcLtRAT2+sebHwm1nxkNfOhNLiKOh+K3SgrduQgV
	1/PMHDj3i/ofkbriBTuCvAdtob3xGO5eIxtVDMLoqcK8v64b/MtLTge1u9GU22JXnJOiCVepOVz
	a8oRoGcVkkQALAevzOVq3GS+jFPKMP2cM/3GXfQ993xZ13vb6aJdGPHzHesiupSH+yjysk1CJX0
	le8gsATKbRw8cY6AyxmLfWVWnce0SSxgclI6cD4yKdvNUH/YxA7kAhtUuCp19jIHPH9r5gBN3fx
	Pdh0htXBdXg0jrZJlx90DDgZZRB3U3V9sV075VpmJ4xL28bLbsoFqrBgqmHnSDBuuHDQx7oqFQx
	DEWVcXxmA==
X-Received: by 2002:a05:690e:d5c:b0:677:bf80:eb55 with SMTP id 956f58d0204a3-6790a412b45mr1876449d50.52.1791429861591;
        Wed, 07 Oct 2026 20:24:21 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6791b06a7a5sm727770d50.9.2026.10.07.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:20 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:08 -0400
Subject: [PATCH v2 5/6] alpha: align hugetlb mappings in
 arch_get_unmapped_area()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-5-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2kMyDbAGY5vdX4Q8C5boz5BouESaSfNKdivc60A8OSU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81wRnxW2SznMjp/znOve36o89WcSw35cdJ94+b7I/
 EkLfGsLOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYanfUM/zNnzvd/bb
 Pb9u/6hvi6x5a7C40OznGJecv2Tvajd938NdsYGR61r/Molbhre1QwwHTrpMDEGQ8qHP6+4+E30
 NRa2XXhKw8A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

hugetlb_get_unmapped_area() does not align the address itself; it
delegates to mm_get_unmapped_area_vmaflags(), and the huge page
alignment is applied by generic_get_unmapped_area() and
generic_get_unmapped_area_topdown() via info.align_mask.

Alpha defines HAVE_ARCH_UNMAPPED_AREA and supplies its own
arch_get_unmapped_area(), which never sets align_mask. An
mmap(MAP_HUGETLB) with no address hint would therefore return a merely
page-aligned address.

That has been the architecture's job since commit 7bd3f1e1a9ae ("mm:
make hugetlb mappings go through mm_get_unmapped_area_vmflags"), whose
series converted the generic code along with x86, s390, sparc and
powerpc. LoongArch, which also has its own arch_get_unmapped_area(), was
missed and hit a BUG in LTP's hugefork02 until commit 3109d5ff484b
("LoongArch: Set hugetlb mmap base address aligned with pmd size").

Pass the file down to arch_get_unmapped_area_1() and set align_mask for
hugetlbfs mappings, as x86, s390, sparc and loongarch already do. This
is a no-op until alpha gains hugetlb support.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/osf_sys.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 7b6543d2cca3..61d806176213 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -38,6 +38,7 @@
 #include <linux/namei.h>
 #include <linux/mount.h>
 #include <linux/uio.h>
+#include <linux/hugetlb.h>
 #include <linux/vfs.h>
 #include <linux/rcupdate.h>
 #include <linux/slab.h>
@@ -1201,14 +1202,16 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
 /* Get an address range which is currently unmapped. */
 
 static unsigned long
-arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
-		         unsigned long limit)
+arch_get_unmapped_area_1(struct file *filp, unsigned long addr,
+			 unsigned long len, unsigned long limit)
 {
 	struct vm_unmapped_area_info info = {};
 
 	info.length = len;
 	info.low_limit = addr;
 	info.high_limit = limit;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
 	return vm_unmapped_area(&info);
 }
 
@@ -1236,19 +1239,20 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	   this feature should be incorporated into all ports?  */
 
 	if (addr) {
-		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len, limit);
+		addr = arch_get_unmapped_area_1 (filp, PAGE_ALIGN(addr), len,
+						 limit);
 		if (addr != (unsigned long) -ENOMEM)
 			return addr;
 	}
 
 	/* Next, try allocating at TASK_UNMAPPED_BASE.  */
-	addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
+	addr = arch_get_unmapped_area_1 (filp, PAGE_ALIGN(TASK_UNMAPPED_BASE),
 					 len, limit);
 	if (addr != (unsigned long) -ENOMEM)
 		return addr;
 
 	/* Finally, try allocating in low memory.  */
-	addr = arch_get_unmapped_area_1 (PAGE_SIZE, len, limit);
+	addr = arch_get_unmapped_area_1 (filp, PAGE_SIZE, len, limit);
 
 	return addr;
 }

-- 
2.55.0

