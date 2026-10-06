Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F146D579
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295473; cv=none; b=QTbJNPlK35YMAceIb0sr2lbIuVHioGvWuknGcN6htOfk0Kcjz7mpjJyq1LxEhSFVL5KoF54PevG1MyaMTHI/4D3X5Wcm9E9Q+Z/eKLnwqXnZhNx59Zp0O0plxMoEbq7/FCdhA9s4crZbeUSplbCCnggNsHi8qyjNnZ1w38j9GoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295473; c=relaxed/simple;
	bh=MiFPU9lrhta2jlZDQ4WwmxRH3nctYsBunMHXU/gm56c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFhYmSKFj8UOkzQAn9lOeC9JjxxNt4XJ0V61OI02cZXi42wam4bgp9TseFpKzPZPAVS4rXDYASfjtPPg4S1j6rPNfsXGhV7wgl4lM5g2zZVrKrpb+BkMiTvo11JEnKg+GjOOxifsrIXRftq97nlFNyn5Fpfk4pA/7L26zZASIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wu7hX4xg; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wu7hX4xg"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6740e7ae219so638357d50.1
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295471; x=1791900271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SNEI4/hYcmaNShKsx5mBvAKtdKDEEPpFtEzNGhh48Q=;
        b=Wu7hX4xgwkVv8lbuUxoNJtwqjahwfgrUz7RCFiH3yhlWCStVQyPl4Ggnl8SLzqPYZL
         fMDzF8nFeJGiPEhoS7jP/aWVgipMXRTSMOMD0Rbj5UJUC+nqGIpKr1mS9WxABzPxVnN9
         VYszGwNB7VhcPqj1+f2fC9EvdkBSMuxgQ7EsVjMwrajLDcBGdbmltx/Q3C/iX12HLuCk
         Rtxgdm4xiH50o6JcemtO/oBmnwrr8ygGW6OoAt71QvXMxAJV+o52YyGstYFuADTU04qb
         aEyya9w/v/9LoFzbADLxTsccaMRPkoV0RXk8BrWGdEbq/iph36VTBjTsqojrS4JCUPCh
         7L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295471; x=1791900271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SNEI4/hYcmaNShKsx5mBvAKtdKDEEPpFtEzNGhh48Q=;
        b=V1jwt5aXPkyheVj7f+2uMR1dIa7rXOt+S5OSgb33Kl70Lt1RwNxNy3sqE+xEtCr9ju
         +ooLEl93bdxeRz0HQ50SyXUqPI7YtBtnWa4fuS/vJAzIlLfsJAsGNUApVsHXaZ2st8Br
         dEjIhxHcnAfCBXV9wmNN+rkabN//AwciXQ4ebz0isQyEgBFMpsQqQjdSf6moBWAVtIgt
         yHVKVi8mkNpcAGj3yQV1mubnRUvxB3gxRPmeEnK2+13Jmm75w5hsVp+qXDeXH9mNQKPK
         poE2Tjiqn7VxpM8/tXX+rcCd+UHAL50bCxuMY0PSDdUFRv2VFQqChxAQhYPCiVHIJGD6
         kMlg==
X-Gm-Message-State: AFuF++liN5BE/y471tLgWDvKf8JqSglPQjPZ2N7TTIE8h/1mV4JSbSLF
	ehxVLQ1/7bt78eh7xMTlowc89lgrdXhCicublUdYYJ9WtXc+V7itGkc8QPUjww==
X-Gm-Gg: AYBFou1pok5nr14gSXULypwZdhlE3sfeS4BPfzB5fdpgEB6XLyZ01yMzibJhPT7mv2Z
	Bnc7fAqdf2StUJtApjA9OiEL2UF3aWQhmB7w6mptlWdKoojd7CeLaO6+k5uGCMjwOJy19UEU9HX
	eOuhmTQsH6z5CYZYE1rKLYhdj5AvpNff7w3HUs8yhKSfW+zzEH3D112A47VNuB67F+KaNY/6fDd
	3Pa6qQP6lL3jAOZsDP1sTE+Jxfw+KZOapVUj04nsSoSpB2xBWwZ1E8aoFWm8h+6ANqrKiBoRlv7
	VLKQu90zpLP1BT1rExFa0iw0RYRoTc+mUBM+IjO5YKRcBs5uztR4pjqmfYoDIZBT/j1iA3DJFAl
	bN9YGMGNK4fLJ9jRhS2+BHYhR0HHKp++VInaeR6XHphwDcJDhZkscbpvdlHy0RSgJHMYYtCl1KS
	9dkZJjtTh2G84kp+fJs5Xl2iv7ag4XyE6BWU6vOHEKYczIvfc9wqg9yyucJTAKdluHMnhN2xw=
X-Received: by 2002:a05:690e:4887:10b0:671:2b28:4aa0 with SMTP id 956f58d0204a3-678fce1ec1emr450419d50.87.1791295470581;
        Tue, 06 Oct 2026 07:04:30 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b86093sm4209796d50.11.2026.10.06.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:29 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:17 -0400
Subject: [PATCH 5/6] alpha: align hugetlb mappings in
 arch_get_unmapped_area()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-5-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=MiFPU9lrhta2jlZDQ4WwmxRH3nctYsBunMHXU/gm56c=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L+7Slwr8NOysIspqi8v+K874NN1ImNJZcpjb2fhy
 L0fc+0WdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1H48z/K9kSNzpfU
 Wz9ezbGdqTfaaz1TlJ9ix2frXwL8vc+5kmkkcZGd4z+z4vdL3Y0tTEEWv4IMgga9qFaP03s394s
 JolS7EyMgAA
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

Pass the file down to arch_get_unmapped_area_1() and set align_mask for
hugetlbfs mappings, as x86, s390, sparc and loongarch already do. This
is a no-op until alpha gains hugetlb support.

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
2.54.0

