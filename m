Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040D442B0F
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390836; cv=none; b=ql2m8P10GDPtg8Nt23F81yOXYD9uoXaabDJ1a/J/kI2r1tpeYUhuia1giBF8Y6qiGuhsYi9A0s4OJwMeUJ3lVTDiAHWUOlwgW+hPbv98CsPHF3qs6c98xH7t9haFCMGOjfn2ybo3NykGZ1rEkNQYwNxea46i/3Y4vONQmVLKcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390836; c=relaxed/simple;
	bh=fkhO9HAymugVq4OmMKfG9p3rUYCS/g1mLTnUWI2PGI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg/r2Xf2dXYr6JeZUO+V+PXe03sZhOWB+e0oitX4rqnKUgn8r2HM8fNCL0y+OTGo2rJEH19oE8IT+hJ/PFWQrYzxflQ+0UsQJiJE8f3P22N3ojF/i7T1LkPw0Wz+5RNd7K4BCSdV74xTXoSwzp2EapyTU2BF/XI5dVpvJPRW4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwWxG+ev; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwWxG+ev"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2074710751so309828066b.1
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390816; x=1786995616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFDzrFtlZRT9MfM2jyoJYH75f+Nc89HfWr6+v0kWxgs=;
        b=IwWxG+ev8YDZEsCEDXJBnR5/l6cz4mbv74B/iq98c3ZcAuoiP00/PA5BOLg7BQn4Tn
         qPddw/Ix2PaZt074WVfsmR2fksdDCQ8yDbirZxyVEw+i2RZA15DqL68YTEHJpeItuFul
         XH2dC6Yr69uIYQUP8KOKij21Z46aIzhTcM748+yOPmgc4vda1UIxZI5IxpmqQktDHOfG
         Gs/i5vO5xl4jy6byUqSXaHQFCtpUCrwjVGcxgpsf9xWNPbWfE+3LB03N6dWAAGZAnXh+
         CTUOg054XnOfwzaySoibLU90b6eH/P7esVC1EoOwOQCqg5Rl1lSbMVqJSgwnqsM964/G
         aJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390816; x=1786995616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFDzrFtlZRT9MfM2jyoJYH75f+Nc89HfWr6+v0kWxgs=;
        b=GCm7VbzryNdFaS6sN6AAIFfMHLqstCUYJbMrGz2OZ8/DQnxCLMvvukUaNqf5sYOVRK
         2OoNH8FLSlLHjG6kT0HgNgIrKpgkm25LH5yVX8GnUGjKjVPVo/QUZtQJv9VeklODd2Rz
         MO5+T88/fTurVgRb6pXB4PbO44btVsQp9eHC7c5L8x/ub+Ki5DjQPhBQG2OfOzq8fdcX
         2Xsan613iFWUvdof2Esfe0fn7VBCNrxsyJKy97OF0VSsVABcE2cPA5U6Pd0oKiYZ5G3g
         IJPx6FyNekcC5u8Ixw+SJJYPawdEEtTNoD4I+FuiYnmSYvW5Goo2zibxmZ/68cZvRzQB
         73Jg==
X-Forwarded-Encrypted: i=1; AHgh+RqxQqf4gdZSGcShFAnuy4ObpLDEMjzVk5J4GAtLjecxq0fflId6Rlb2VX05oo4qSkuvl6yKglqaZARj8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQ9EbDvyqNx4hNrYTn8UJ3nIFOatmi10GgFf2M10dUqlN8/rN
	sZwyfEo/sjHIkrp192SRtJwo/hDwMFMwwuJLLV/S2Gmm0MOlTvAPNTkK
X-Gm-Gg: AR+sD12XotsFJT8Li4F1/ClPohetTfVZdMlzVSJfazbUbfACbdPCPNQBlkj9jy5JUmw
	H5oZd5GHkdgulJEkmGe9i/Go9C8/Sm2FK8b19O4uLhUU/V8xC3l6jQW7qRcL672dle0wrPqZsEm
	48UhhYC5z2dldJUX3FXI1jH3djIUTovedDJPFGbTgYIeraN4kNXNs3Y8zn0XLHHN85Nw1CKkLtY
	tpmiZMOaghwgaflTQCX23GbY8TcMNgpVYWFrA6ZP2JirKanPkx8ieJf2zBuma40BAST9MGvqqfo
	atdkH9+E32kKPHaZQ3P0vrvFQ9E2Sar8HQc3tlt4DXE6my54eZc01ojpoYpm3LR7rol+CkENLy2
	hbyXRkpdBUuilW2poIQPvJwXoOSlJgLcly29T1dvkkROvWtzlNcedHPK2IebaPRs5HYeBrSYdGZ
	iYsMFmdeSNRkHPqn/z/O/X+ZYgVxcBRQyipAJLDezT4gGnr/NO9pXI9WeE6fCWB+R5fhwCA8emd
	FfHjFxYgLDLHwYf1vdfAweou8mdWBQ=
X-Received: by 2002:a17:907:7245:b0:c20:899:b8bc with SMTP id a640c23a62f3a-c20c672433dmr236286366b.6.1786390815810;
        Mon, 10 Aug 2026 12:40:15 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:15 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/7] alpha: fix the local TLB invalidate in flush_tlb_page()
Date: Mon, 10 Aug 2026 21:34:54 +0200
Message-ID: <20260810193902.3286353-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810193902.3286353-1-linmag7@gmail.com>
References: <20260810193902.3286353-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_page() invalidates the calling CPU itself before asking the
others, and gates that on current->active_mm. For a non-executable vma
that means a targeted tbi(2, addr), which acts on the context currently
loaded, so as in ipi_flush_tlb_page() it reaches nothing when only
active_mm names the mm, and nothing forces the old ASN to be retired
afterwards.

Test current->mm instead.

Reached in practice by folio_mkclean() from the writeback flusher kworker,
which has no mm of its own: about half the calls during writeback of a
shared mapping, and none at all on anonymous memory.

The caller-CPU omission in the same function is fixed in the next patch.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 1ad448105201..7856d23b3384 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -684,7 +684,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 
 	preempt_disable();
 
-	if (mm == current->active_mm) {
+	/* As in ipi_flush_tlb_page(): a targeted tbi() needs MM current.  */
+	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
 		if (atomic_read(&mm->mm_users) <= 1) {
 			int cpu, this_cpu = smp_processor_id();
-- 
2.53.0

