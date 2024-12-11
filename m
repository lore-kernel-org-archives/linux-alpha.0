Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B81FF618
	for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959708; cv=none; b=i4/999uuUao6WD2+L+TzuQ1oQvHRDEKoWsGLoia7oWjH9l985q+TkhFNySka+SrjNwqsncilYw+l+CBd6qwyBiqQHpMQlBMjdHB+uCvndw12vX1YNQ82q+9ZBmRLY2J8BxMIX+s7ZOPwVPZKaj9/D6bU/akiIeZSjU7oQ3wFen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959708; c=relaxed/simple;
	bh=IV94/17VU942v+SUppuhN1JByKB2U0oRaUQ8yQsFAy0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bJVKoPzDd+Ox4ipxSLpYhOEkG6fWQvl3oy2kUCEm6/1cM6I/CbcWSZ69WDVY4SxOhtoLccD67JsgKcJnE5TthOLwlPuzoaHc7vzh040P29jwtF3IRkFpZOnMaP/8IL8jFN8fLKfGHEHlvXly+sWXYudZ4P7Nudu15Yk96Wzq0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znlqGrEf; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znlqGrEf"
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-29e2bd938a1so3287421fac.3
        for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959704; x=1734564504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=znlqGrEfDteMQMEQMrHRT/VFZUJqKn13qlRAuc49AQewDWPfUKRhcvh6q8eYf00wJ8
         7sPyjtrzDi+CxOXMp/duiSD3d1jY4DXH9ebxKojNVFDc3+SEwUfGE3OiMi+QP20FKEGt
         2holzL4AGj+DC70nyIuNYc2N4lBHVQEi8aliBAlG7SZ0xqhHaeZOF9S2dg+catQMaPSK
         I84IL/pqaJlS2LFUpV8QkJUgiHNKSgRgGudxaAFuqH1EzEOWCe3h9LZIHxOpv6lxK2j2
         7SR3zJN7xugwyWxp9T8sg59b3Ak2UEuJKzODXNmo9EEETb2BaBYdZuLWz6UNCRHgdPzm
         fwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959704; x=1734564504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=tki989xISgEREPa8YFyiFDNLShaxde1uBHmvDqM9kaxTlRJ74RDrBKcDgBqp3OCGON
         PyEGFrC1HZ2OhbkFgqBxA59jUBoGqRmZ/4vSh9d5qHeiq/VDPmcpXB4njLQBaZl+OjU1
         hT31QQPoE+OKwkkYbwOw9kheEYwr+SpeUcAYtPHkSZ++UtbadAN1UBb5WX7uv7wc6vqa
         vf9sSZjej/M/fTFNSupzaZ/Hd/I0r7f5ERRF+cH57WD0ckw1kIIITLjVB6HK1l7K4A1k
         kD705UqR58EbJ+FTcrbZwgWvl79/QJdfZ/EA5ND8Oqohg0SlDe4h+aaBqZgyzQJ13cbi
         7zDg==
X-Forwarded-Encrypted: i=1; AJvYcCUlHUPFSuvGCcQdNxAg58bDIbxNHUjVidCzP+Ij9GmOJXfUeM00oewfKK72L+6EnqAKQxNubkNUeVy4+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UFgyKA65deKjAljYI0Z9JSpQ3aCUkoNmDk95+8jlVIORHUpW
	B+tsFqerSuRNkAxRVSEi91LsBWP74wfJccWIYxJx6Q/IH9yS8I2k69trhzEvquhaGXcTGT0KVmR
	3gEjCm+EpskGXGgLU4W90pw==
X-Google-Smtp-Source: AGHT+IGQDLulfLF8RwhcJUV0HutTvJeMfbYLu8JUEjKppHvTG+7VWlPJjZzjhgEci5/4OsV71lgRhbIjtjk4C1ysLQ==
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:296:1589:4069])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:224d:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2a38236803dmr971354fac.7.1733959704488;
 Wed, 11 Dec 2024 15:28:24 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:52 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 14/16] mm: xtensa: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/xtensa/kernel/syscall.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..6bbe10c2a633 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,12 +54,12 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_area_struct *vmm;
-	struct vma_iterator vmi;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -71,16 +71,27 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
-
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
 	else
 		addr = PAGE_ALIGN(addr);
 
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
+{
+	struct vm_area_struct *vmm;
+	struct vma_iterator vmi;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
+
 	vma_iter_init(&vmi, current->mm, addr);
 	for_each_vma(vmi, vmm) {
 		/* At this point:  (addr < vmm->vm_end). */
-- 
2.47.0.338.g60cca15819-goog

