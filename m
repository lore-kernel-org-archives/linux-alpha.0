Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F339A074
	for <linux-alpha@vger.kernel.org>; Thu,  7 May 2026 22:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192592; cv=none; b=Sww2Y/U7LZNKRtlhZ7NbkC4Z6UpiuCppjigPp7l/ujhiK/qVTj4N7PCTHO/csD1Qcq6pIz9C1Rk4mF4OL4AEdHqsCyiHKEQQqzKVm6SQ+J9BNOrOc7OsQKGMYjgyEc3Qd6NPZiVKi3HTuMC0+/ch5t8ZYIE/bA6fekpeFGIMBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192592; c=relaxed/simple;
	bh=o+vhOTjLhvS47fv9tom+Yt3TM9vgXV0mo+tAnh6qa+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwwOe18090XlMG0/laa11N/mexY+HafouvgBBZgGptEKq0ZK/IDAOHji+FkettjVgDLctED3E6wGqOfl3kJLi3+qg6a74YjK5iZD5BzNt/f1iSi543RXgeh++27Q3OYUnfgrcqgSUVGjMAeigjw5EsinxEfUgkyNoEmK8FyhMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kxn/7SRT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+cB4XwQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kxn/7SRT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+cB4XwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778192589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
	b=Kxn/7SRTVg+1y11F3weI900bT53eSmNN/IZfbKom9F+w5LBFqwnxAZPo/9elyIOm0uLSHt
	l5UsvJQOFSWe3Lvc2eP45z6M5dMvMVHukBk449fL93SJlH+IfI3MQXZ87/qtW8ve4lRj6X
	Vs8j6xQ9hCtOdYbzFjbcDUAuH3WKYcM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-xLgZ18t3PnmaTa9lX4yDRA-1; Thu, 07 May 2026 18:23:08 -0400
X-MC-Unique: xLgZ18t3PnmaTa9lX4yDRA-1
X-Mimecast-MFC-AGG-ID: xLgZ18t3PnmaTa9lX4yDRA_1778192587
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48a7994e8ddso8976225e9.0
        for <linux-alpha@vger.kernel.org>; Thu, 07 May 2026 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778192587; x=1778797387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
        b=K+cB4XwQKShvaqBdKcldswwmuDkaf431z7P2oI5KuH9wWoQw7UVnkM4nmfcRQNE69P
         xAIVztalsE7+yaC2+YoHpT7wM7dInlVJWIx6VN3SUz7tly8plrFGTfz78Bn6UuUKEckT
         05tWgrgdoNqrwkO8nTgkkbGPpKSwLkQHpZbPCYb5RIxim5FjXilDYT5G7fKHFdE6g9fW
         etuixKtwd6ZUJAu6MmUYJrIpHm10FtQAyqXqK+Px0/Pc25wzmxZ/6AYP8QzgHn4EN783
         HKUg+ocLt318X5k88aEAFhm9CxXj1oCpT/AvgmcyoC6ayHxl1vRHodMOibhGrehcN157
         p5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192587; x=1778797387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
        b=jbddpUtVByIbWyEWeHnzBh2SX0LaP8BkiQ040XDnRreuqv0pQDydd67ufwKFTRo7KM
         nbmRzrhLFIZpE2S8hBp39Owe6drj5/3zpPMAsV/GM3n1cnvOpVuppP7WlIDmT9JBYn1F
         xe+qlo9YskPgoTw1HRu0+PBZ5IVadKlcyiRhaCgUsHHSYjIPzbpmAnFKkXSihYwRlIpe
         QsES5Wo51Q2ZZczUH5FiSOWHpRak1y9pjVRHHGarHG7TNGTLNHI5ZzqFpgOsDH4DeEAj
         wVhzeKaWs7UYrp9jR8/3qo1trjmAVoySOqUb/TbMihtEJs9GRoXdI7UqBLV9oZS5joxE
         xiHw==
X-Forwarded-Encrypted: i=1; AFNElJ8g99lPGzOV2f5lnRo/Fq0rWiuBwcJmxqPdiND2PCkmwNa1yvE9CESCF9bBmB0i4/ZhjYnip7Kyg9XjKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhz4fgI5L+PoXnIJfCcymNUYOmujcZfpKU7RpqkhQhk7zT3wPY
	FtvyWNknQxCUvkggjlCVyM1+IlBtIIKrOL5xyZNhcAinXwd2DJo1pm0SzD4VUCqQpU7Jb3AXthh
	k7yFN0K0glteAgYYLElVd/rG7L1ZcrPluJNhtlsS+9qNspZWvFlJmxzg9HR1h3dmZ
X-Gm-Gg: AeBDievL6UX0YifnFL3riRaP/8hgq4FkdWTePBQtD1rEHtlHLJhK7k70kTBQZHKGVyT
	f0OhSBzPRihx0MVp0f7L++kpD0U1v5RYHGtEImAW9lBUtBHzbDCy2sQU72MDK8+DIQvESFgtc5h
	0oTeuh1CE2+dNL3RqxcjRxyaD+sWzHLoZo/JaCTZcArMr9hwShIS+ZFO6iKcwPMd/ymzqWTtfeV
	XLsMgxmjSaSHO6jvd39owompFDlWk4t64Vig2+7grh0VZ4jM3oxfL9BJOd9YLthFMF2DOzBOoQG
	z+JgFYdYBr/vuPhOE9kXPsSoaHtsw8f3lq9bSV9kqFPZ0AGGqxJvyJd2lYuflo3GENNRPi2scjT
	Rra1ty6cWyS8tXqmFkKz5A/ywDVRAFqFvx9Uy010I
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr177389045e9.21.1778192586766;
        Thu, 07 May 2026 15:23:06 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr177388435e9.21.1778192586184;
        Thu, 07 May 2026 15:23:06 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820303sm2289369f8f.4.2026.05.07.15.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:23:05 -0700 (PDT)
Date: Thu, 7 May 2026 18:23:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Subject: [PATCH v5 13/28] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <44d46ba982b39e53a2b5f978dd7239836e535196.1778192416.git.mst@redhat.com>
References: <cover.1778192416.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778192416.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Now that the generic vma_alloc_zeroed_movable_folio() uses
__GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
x86 that did the same thing are redundant.  Remove them.

arm64 is not affected: it has a real function override that
handles MTE tag zeroing, not just __GFP_ZERO.

Suggested-by: David Hildenbrand <david@kernel.org>
Acked-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/alpha/include/asm/page.h   | 3 ---
 arch/m68k/include/asm/page_no.h | 3 ---
 arch/s390/include/asm/page.h    | 3 ---
 arch/x86/include/asm/page.h     | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index 59d01f9b77f6..4327029cd660 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -12,9 +12,6 @@
 
 extern void clear_page(void *page);
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 extern void copy_page(void * _to, void * _from);
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index d2532bc407ef..f511b763a235 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -12,9 +12,6 @@ extern unsigned long memory_end;
 
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)((unsigned long)(paddr)))
 
diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
index f339258135f7..04020a19a5cf 100644
--- a/arch/s390/include/asm/page.h
+++ b/arch/s390/include/asm/page.h
@@ -67,9 +67,6 @@ static inline void copy_page(void *to, void *from)
 
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #ifdef CONFIG_STRICT_MM_TYPECHECKS
 #define STRICT_MM_TYPECHECKS
 #endif
diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 416dc88e35c1..92fa975b46f3 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -28,9 +28,6 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
 	copy_page(to, from);
 }
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #ifndef __pa
 #define __pa(x)		__phys_addr((unsigned long)(x))
 #endif
-- 
MST

