Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB47441614
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390839; cv=none; b=JnWH/S8jNaGu5QfsmGqvUJXZhBGfd5g+620672lzzkiUDb/q3fT+LYpyzChRyCq3iaKt1MF5WlZlnAHrNjfZ6fX1DFb3L3YSbUUDSltwA+gVTqIE9tDSlKN7m80CkCbNU5SCOVQekqRaFZYkZscuOhVH2nHxfgnp5fqvLCHEgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390839; c=relaxed/simple;
	bh=HYvMhIHogsEmsh3zuOs4+nenCywngBzCFU9HdpqBDvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXiPvJdvkGH+nKrbgJCe3iBc7vSLyu6yOXUhMhp6GMq33EYsBIQtXTQR7nD4EaCSm1cxY8rMxk/tUJPyGQwZtFW4uXeq//1wCJscBdsRhEN938a7oSdtY6JBjG4PVPjDFTQyOcld+I78odwqBhifZatcZXcgtCZmaGX52ESxNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCEO7LfI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCEO7LfI"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c16794450aeso2982266b.2
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390818; x=1786995618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i+hFEyj9xNww6KQk9eCZA+gjMFJ8e7FKLAkoQOfyOE=;
        b=hCEO7LfIJyAfgqwVbXJTe02c0rGlsOStheZx4mKk8Mv1XHyWOHR2ap6o7+1lPNMekd
         Q52kXlZtS8LVqYw+S6oc/qnmG0lNxKjX5wW/EOVt8mOY0+USEypDjbtoFtEOg2tLHmTV
         X7NEPcVUpi4jZEWn0eG/KvToKPwswD60c8yyNzoDnSiX3/HwbWxbOKt1yoVxX7JeqHNh
         byv6hERL1sGmX68CWL6nEdNB6qmNNFvolnJXzkzem4lRYih0R4EfHcuKxDwV2ZM5I1JO
         a1X4fgaxsEgjx4Ak2ZL+sNeVRCsUEsFsDo4qVRbzohFJksRy0rX9SfRlEhZEYAD9MYpu
         Fb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390818; x=1786995618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5i+hFEyj9xNww6KQk9eCZA+gjMFJ8e7FKLAkoQOfyOE=;
        b=dOWVpn3ZR0IefSIOuctxJCBdY+W1jB3PGQmKme6F8Teu7KGCAKebanbR1vJIzRIp9P
         FE9nPawIr6iRENbKLLG+nKQ/iUmM5Z3cqtUaopohCAPZhJgqW6Au4ByU173Z9AxkK6XS
         Rqlkg3kPiZexWbVdu1Conu9lUW7cuJgcLYvzr4AgFU2jZ0BhMPiVXPMOJJgXN6bCbAGV
         4ZDttOe5rp1dzJkZvlm9bMVl2KneUFqWYMc28G84HCQJikFyIzWvCo5WshGz0bUPkIX1
         T4UWDjmtr6SiTKyMuNGE1plqxb2OCS+S12dLwue0WCWWBHJ0/I88gRAWm4TkPqvTNBD8
         eM8A==
X-Forwarded-Encrypted: i=1; AHgh+Rrr+B5qMB7Xd1+4woA8KmZDyVdJsprmEdzyNDYTcWe1c+OGxC+S7hLoCCLxCKmGgXIT0hMEpNQvh3xDOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxenjrm0MfomVS3K77YQdpYNraFd3rqKxDifwLnfvpeweBFBF1O
	icghgzgwPq6ZA18mj1lNeE9W7jY8/Ynn3pKyHZoBZ2R6SqyDnjgcxLWU
X-Gm-Gg: AR+sD100GFAMIXgk6rVWnNhcbBVKZhHvwVbUDwqin7ZHTNqlO1iqlZd0/KULODhTzQY
	gf1VBEA0eazsYJOkmlY6aTJDsvbiVKuwaUv2Qxbmqt1N8smxtw3NArKdw8/LfYbmqW3iKxLEKjy
	WP50Gg9IpkOz2aDaPsjqRIsG4GIm9sgliXhaJDUj/paz6A7JK4pf4fFZAxB+nPqBocdMJg/FuDE
	oQzeNwPfDTm7wUPrs/ON5c86d73x5uTHK6YiLoQdsQygcKMQSwt5Ey/hkGPpwPnKtIOTR7qLlsf
	YLq2DXB2jM72+2E7N1M73lGm85pmnNAQLfvHJ5MsrMBc0uqHKESTZUamjdx2ZsIKIoc5qByb54k
	Y15MUdKEMVcAGt071iP20VwX6itPeg8+yztDtCWQj1E38CMmOk+b3ezb2FcEQ7XTb3JMXildwfk
	bE5hb+NKcLvoheHuRnp42Vsk7gnCeBCS6SALZ1iUD/i7EwY1cAXdKimMiKJfSduksWXhKzXjlTi
	yO0LO+tARMT0kqwY0V8azs7ZyFaaab4HCJC+CXvxw==
X-Received: by 2002:a17:907:1688:b0:c15:ee0d:9a32 with SMTP id a640c23a62f3a-c2039dcde67mr2185271866b.21.1786390818037;
        Mon, 10 Aug 2026 12:40:18 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:17 -0700 (PDT)
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
Subject: [PATCH v2 5/7] alpha: fix the local TLB invalidate in the UP flush_tlb_page()
Date: Mon, 10 Aug 2026 21:34:56 +0200
Message-ID: <20260810193902.3286353-6-linmag7@gmail.com>
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

The uniprocessor flush_tlb_page() in asm/tlbflush.h has the same wrong
test as the SMP one: a targeted tbi() reaches an mm's translations only
when a thread of that mm is current, but the gate is
current->active_mm.

Test current->mm instead. arch/alpha/kernel/smp.c is not built with
CONFIG_SMP=n, so this is how the same defect reaches a uniprocessor,
where the flusher kworker necessarily shares the only CPU with the
writer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..9ae1902faf8e 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.53.0

