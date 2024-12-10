Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E931D7E3D
	for <linux-alpha@vger.kernel.org>; Tue, 10 Dec 2024 02:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798504; cv=none; b=mVWniw08+KFUiT76y/Y2bcKNxydOGwgDcnaBbr3j0fvVP6nnM0JdUwBfcPWU3LeexSBx4uo49y6qimb++hydlhY3T/xVmn54GBudyj8JYoXexSGHJ88lgpJXH7+UU9W8tf9CQfPF/Xqm3QnBRtkUV0spId8eHBMpEimGHK1XDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798504; c=relaxed/simple;
	bh=jqs4liHINbUXCx3VZQbaX3q5Ukg9r2Vl+j0VT/phcys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jQZ6QEJn4pqr7CJgslFbFbUsBiljlSeuEsA14uvjcBT6Ud4WPOhF2R4UXKrB/fzsIHkliMhNi9giMyqu7Xz2Zi1pYCw3lz1KmQwmTkHIYig6fXXsgBjNqHpuQd5f20uQ8X+11YNqdrloafDujHAgKNlmV0XtqGhb7cv2dnUz8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xscoi4nT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xscoi4nT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725cf25d47bso2144710b3a.2
        for <linux-alpha@vger.kernel.org>; Mon, 09 Dec 2024 18:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798498; x=1734403298; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnsK0Z+Vsck1DKfgwLToYEVTibYJ9G64XT5/R8jJ9Xw=;
        b=xscoi4nTRqQgcGGmfcKrCqKjKvP09VOI2PndKJb+rsZTRiWE1OmyLGv4nAwSMueLQ7
         tBOiBAhm+fRRfvseMEJiSVQQ7Mej6LJUrRi9vvDVXtnGrcfGLzalYHar87CKzozW7pGI
         BBIylLkZhzvsdqZYNw2tCKkMC2o73lRXRTZFo3WEHfNcnZWPdiGg6iRL7eWwRguYSq5l
         1SE1gT7qMUguCsItr0n4D6muHGSZ5eoU1aNgXHL4olErzDBTgas3bpbDGfYHojXe/QsM
         B6i14ADQJ8glIWvYOX28yIDC/OfWkT+b2H5TGr58AGut6t1yYEnteHDI9r3vTxigdhth
         ptmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798498; x=1734403298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnsK0Z+Vsck1DKfgwLToYEVTibYJ9G64XT5/R8jJ9Xw=;
        b=AJHWfAjAkvJNIvq4wk3arDxG7hdF52K412HsP7FiV/5Sx/QiP91MuVbTIrP7MYb23K
         xYbk/xrCmCUK/FQtW5m1oQIgLNkfzrJ1W7mvPaQa6sG8ri7jZGdauKnksjV00C76qJnZ
         224CsDTWKveNC5bzdlF15jrsRgSquaeIx4zonnEYzcYAo7J4rOl4PpsmZ5kr6a6uYOy/
         XBo9v9cBaRbI+ingC9c5iQCMRJe8k6wN+D8ElUHhPcvZq6zEHgyX/u9XuiTsdy6XMOEK
         Nk5Xw1yUtZQJ71HbpT65BBSDhQE8hYvw0aQcKe0R6dndCHIMIQsebU3eDgdFYTPjtwkv
         curA==
X-Forwarded-Encrypted: i=1; AJvYcCXqRb0O4W5NrL+CMJpkoPiRMlIlOp9pAEXTPHZgHIW7Fblg2khYT5pugeJK2Lmg89FD35xFjI5LwAfGTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKGZRkz0Lec4te10PspeskaERn3pOv/b326UAGV599seUR/Bc
	KMz3faFevg6tC/DrfUMTlyIe0E9jSa4eWoZXRBxsNne4wVZLqsc8jIk6H24q7NvO/kOJkUKFGcx
	WKePNj4k/9Jh5ED2mjoiOaw==
X-Google-Smtp-Source: AGHT+IEQiVamF/zzJ8w1wfz7OIeUdP3OCsWBSWfXEHphl91Ep+NYy7TdX+lfoJ5W29b7fSm/JmmQj8+pvlj7NXOkkQ==
X-Received: from pfbio2.prod.google.com ([2002:a05:6a00:8e02:b0:725:936f:c305])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7283:b0:1e0:d380:fe71 with SMTP id adf61e73a8af0-1e1b19d4512mr4863730637.0.1733798498297;
 Mon, 09 Dec 2024 18:41:38 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:10 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-9-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 08/17] mm: mips: Introduce arch_align_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce mips arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/mips/include/asm/pgtable.h |  1 +
 arch/mips/mm/mmap.c             | 39 +++++++++++++++++++++------------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..837f25624369 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -766,5 +766,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ASM_PGTABLE_H */
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 5d2a1225785b..cd09a933aad6 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -26,12 +26,31 @@ EXPORT_SYMBOL(shm_align_mask);
 
 enum mmap_allocation_direction {UP, DOWN};
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	unsigned long addr0, unsigned long len, unsigned long pgoff,
 	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	unsigned long addr = addr0;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -54,23 +73,15 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
 	do_color_align = 0;
 	if (filp || (flags & MAP_SHARED))
 		do_color_align = 1;
 
-	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
-- 
2.47.0.338.g60cca15819-goog

