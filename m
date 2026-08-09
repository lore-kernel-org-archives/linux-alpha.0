Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88083B6BFA
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265736; cv=none; b=FD/0++m6DNLcNGaeWkfNqmRiru2H8CR8LRLruuOSYzbsPCVJHs/QkMmhuUzktbkxf4K0xgyJ2UJdt7Z8vIe1copN22PuvlEImPUHkUP/aoyTrHj+ZqBNgnVHczY9vg9zVNrHzm2uVdApFW2Jyq7N1b27CAwAgSlcU8AqUlXwVPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265736; c=relaxed/simple;
	bh=uy/JgEKOMWzoHDf2mqKMd6Dn+BTDC04z+to1rJnyr3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTIOVOQyPgbbxym6fArQ0L3tFATgPvQyQUxiHxEqEqkkVzICl1ARmc418P386I9QkobHUgpkh0NCS3kG7aU+vm3EV4H2ZKkszSjvtOuxaJgR4O+tZFXOaPtodLswMKiNbLbLG6I4CX2NbGfrRyIr1Z14i/rq2wk0ufc+Zb4nsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDaTt//Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDaTt//Y"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a1ff91dcedso859572a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265732; x=1786870532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sehBMnNKu3HPbwKfQMPjHU1mwRo2NHUpCC+rEDi4C9g=;
        b=lDaTt//YxP12tp8RGMyciuTm6a7HMkok5wNxal3Y9Q8pjA+7ZjO5hnPeft2dKNjV63
         6KrS8pG2XZGTcNgHMVt2JURKwcIoSXu3mkNONVFiqw8Y+PeDBE3t6Ff8apST9ROAy3gs
         aphgYul4dpcgXsZt3a0MGAkhF3cFjXXpZv74R3Zobbli5OHL+fJJPCWwJQzodA+jfJv4
         TbF2WGw1ZkEoy1j/3higWHJD7NTGrdfsLUcSj+1OgCTag/ZVzZGOksqG9P16REOe5m/U
         JnyXLXGXU0LPxdMeELGoz3leeftLUHhLYtm51abUzg7hYpA8n+XbyVCIpvUc9vPiOQMC
         aMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265732; x=1786870532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sehBMnNKu3HPbwKfQMPjHU1mwRo2NHUpCC+rEDi4C9g=;
        b=KtFjVIHcU2m72wKSfIJofstgIY3z4rGIXSoxybOzplFzx07x+B4561KXj9InMggoN2
         9n0dPA5SVDJ2Akcs0LbgZ2a3Bj8w8cbHepN1CHm4LxJuRbCgLX4aK2ZbIXtKnOh4BgK3
         e0sWlf02ft1QV4sQmvBEJMQ3rsJJ5cxp//oc1RHpBXA7j/ja+NeNG4x3ERIrCjBg0CNo
         RYCxx34Xy1c3RRL+TURVmtm2VtVqCTCza2P5OYKA7EHKJNDaPqYKixsfu2gniJ4IEhaC
         O7SWYWc1Wi4FAcOU52aNM6/audxo0pSW5VbRAExnZ5++B95MUUPuBWyraGps9uZdw7lk
         jFSg==
X-Forwarded-Encrypted: i=1; AHgh+RrhSJ21cp4wvJsB3KzmeARMmEQihRfMNwp8K7j6dWMkNKXGHHP0i7kaQ/IeM83IZh6yV1ExJGhy4W6F7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywns29UzB+NmrHE9YeAiwhkH4oFbFiRFJQtZBaH6tqioeKJn67Y
	7vLcvfxzYKn12DKNFmUaAXqglEFB7oWAryxC/KX3UAHcTWb/NsN5Jbl8
X-Gm-Gg: AR+sD11h+iefcmdROhXumvjkNtU+aD/Pe96lsd2cCAo+wYe/4X3RHjlefnwptrdoEdJ
	AEObG7LOs5yTkS27tcYGwWUty471BFlpePmzGqssdZQzrV7fghTbW0GxH5rc4GjFXZ5RdeAOePB
	Vml4Oc9pZEp/Tb9Oje4i34+sXic7zbqVvyvZcaK1U6kvfCRyFyQN8WpySAtlZ1bCK9/DE9jXoXM
	FKnVwFBUaU3qUW+vQywDfZzW0AyQ5/ZIXSzVaDU2iGLziOdsv65smLeUCFFVYr07GPIfPuFdEJq
	+yxwUUFZNEk+4Mm/IMzYzX13xg1zPmcwApmwLncNcALj1Asae8lMxygmgvm0olChSqOeUn8OYEA
	XLe2xdPVI4GpZpc9Ol7DslXdQM/aSXsxetn7caSEScWcGTde/OtcyPsd3iKgeGRWW2zhnqNd8Kx
	QcXG71Z+3wqa4HxuTUu3eX4DVfovuVN2vTtvAqQSwEFzifBd5xklD0zsg2bCiTMZ99n/7jCbvo2
	ZAaODsc018CD6BVOQEtqv1GyCC+HqIZzezLdx8Yxw==
X-Received: by 2002:a05:6402:a5c7:10b0:6a1:f7cf:642d with SMTP id 4fb4d7f45d1cf-6a1f7cf674emr2763843a12.17.1786265731942;
        Sun, 09 Aug 2026 01:55:31 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:31 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 4/6] alpha: only use a targeted tbi() when the target mm is really current (UP)
Date: Sun,  9 Aug 2026 10:49:36 +0200
Message-ID: <20260809085208.3262799-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809085208.3262799-1-linmag7@gmail.com>
References: <20260809085208.3262799-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniprocessor flush_tlb_page() has the same defect the previous patch
fixed for SMP:

	if (mm == current->active_mm)
		flush_tlb_current_page(mm, vma, addr);
	else
		flush_tlb_other(mm);

For a non-executable vma flush_tlb_current_page() issues tbi(2, addr),
which acts on the address space context currently loaded, so it reaches
the mm's translations only when that context belongs to it. Under lazy
TLB an idle or kernel task keeps the mm as its active_mm while a different
ASN is loaded, so the tbi() invalidates the wrong context and the stale
translation survives.

Use current->mm instead, as for SMP.

This is not theoretical on a uniprocessor. folio_mkclean() runs in the
writeback flusher kworker, which borrows the mm, and with one CPU that
kworker necessarily shares it with the thread holding the translation.  A
test that writes a small MAP_SHARED file while background writeback cleans
it loses data on every round: the mapping holds one value and the file
another.

flush_tlb_mm() and flush_icache_user_page() need no equivalent change
here.  Both use __load_new_mm_context(), which allocates and loads a fresh
context rather than relying on a targeted tbi() against whatever ASN
happened to be loaded.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..6593a64090f1 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,14 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/*
+	 * tbi() acts on the address space context currently loaded, so it
+	 * reaches MM's translations only when a thread of MM is current.
+	 * Under lazy TLB an idle or kernel task keeps MM as its active_mm
+	 * with a different ASN loaded, and a targeted tbi() would then
+	 * invalidate the wrong context.
+	 */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.53.0

