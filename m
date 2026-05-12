Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A5A3C5552
	for <linux-alpha@vger.kernel.org>; Tue, 12 May 2026 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619978; cv=none; b=oeiVBuLVgcFFJ77hMzoe20p1nbPcUQ/7hph3fDw3DOhIdtGsvu2ASnpohJKaPF02zLaF9SGGloCny/EEYi4lH/hyw4qXunFYv+0ci48UD2db/WOMER8xo3Dgr18Mw+VpRa6SiLYKOx+hfLIZsevVEgf2oaenTubcy2brEq8yqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619978; c=relaxed/simple;
	bh=xVZpENOTPSkcCw9H72WToBvwV1ZsJAWZkigdtcUbLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2tG5tunRMiIZQE/hu3XAxyru3kx15jZ+qQWNVZxxpdQh10JbPNjgfsnEIFRNOcnuV/FgD/+9QcFWnluUhkurDinkgOFh3z32auwyci5PkXlKTwBMkZKVbp52iOi3/6Gg3SAkvFeXvrRIz1JuHzCQPKbUaRayZfScySSdaoGLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcVQVzuY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lWc16jQ6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcVQVzuY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lWc16jQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778619975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
	b=DcVQVzuYCTrcvesS3JVrcfd2PbyBVgeqBHbxST2Dp8ZdRN7SswyLX+4q4BwyIvzFaunaca
	T7872FdoOKgw3kuwR/UqJwbRlKlwYa0Auj+sZ+c27Wr1TTUQF0AC6rWez2PJq3hhLYMgtK
	Xn5AV9H3pJPNarlK2wpiTfiFuZrJmiQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-Jzg2ebGGMCqgyqX2rXdGAw-1; Tue, 12 May 2026 17:06:13 -0400
X-MC-Unique: Jzg2ebGGMCqgyqX2rXdGAw-1
X-Mimecast-MFC-AGG-ID: Jzg2ebGGMCqgyqX2rXdGAw_1778619972
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48e89faa62eso11468305e9.1
        for <linux-alpha@vger.kernel.org>; Tue, 12 May 2026 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778619972; x=1779224772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=lWc16jQ6JJ1S6F427WzZqfe9mV3nGCuLtjxhxznbGxuQegURYU35/KwZCfFiUeaet5
         OGZp05NqLEfpQZCpYD8pE6s0RNz0kDCgX7DYaM33hX67OcsoiNiyF7K5gRtIAP3OpnYs
         myx5/10bEG3e3u5451qpV8VYMsGPXMBHUcmsVsuhhFECTVwLzZY2Fy+SEn/J5C55Skze
         wp1PFZfkQLebNlAx/W50jIX0ZyaQo5hUT5vHrCu2d2Qo8XWx/gSVFLCjKQR4wkwMJxD/
         YlzIBc9nMl6jFJYnK8uCv4E3+oBxfrtqmn6jhElRPNvgzrMhWylBUKA3LTdVfmpf1vsa
         yaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619972; x=1779224772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=l6bt5vHJRfhDymzyJWo6TlrG9WXPyDdHDQ/cq239Te1MSFhthP1FTU+TqzBEkj80UE
         TSd3X7F86eCnCWwgnUs4HsP7b3LEF3VHfg4YxP7M0Y4N/Eo8DFcuGDTNgxHKbW4bg8n5
         +UWKJcvvVUiO270TtwGtBpl6C71DjTf0QcD9UoWaxk3yk4NCOucox6Qgi5BOpUAOL5gc
         c1q6v7vZSG91wgEgj4eaTFGR7SobkSvxd/+ad/PaOEHLxRR+C5woGRCaYMxC1xo6cdJp
         tMRInfjYRwS+qYk2htiTIyHe6LfABLNGT5ieGe6Q/TQBwM3qtMOuypvkOUf6w9wqf41+
         8SCg==
X-Forwarded-Encrypted: i=1; AFNElJ8qkhR17YIB341qpy4jF3Bt4+ODYCMlcwiEBj0TBhcNH10X//nlZqB/nmP9DbjVzG/MVIUXhiKMLeE7vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwdQlGPEk9b5+azQ0lgkkSibDN5sDo9Fuhq48HfnxK1Yn+nIb
	ItwibkLDyuTgCsgDWQbnKr5I5WwK9blhv+UiiUWTp1MvXNGG8xU08ZI8qK2FCVlAkQsB0g6BbSe
	4H9KoDoQiictlAqiFChB8jb7/xVso6TUMmZGM0SMk1YIKlIxD2f3tlIUauMoz7+KRz5vdcWd1
X-Gm-Gg: Acq92OHkkPcPf6n4czZDAEF6CFTE1lJ2PBtFSFTo2kv1WZ7gGzdfo+qR6hlDx7dI0+d
	JRtDCtUoxV5krQRbfQvKOawp3H/S7Opk01AnaHOiopdw40NUVrZZLn+fJoI+5mjwVrMnrQDB3om
	ax2b/l1KD7tmLnm40wpD9343xuLA9iv0I5lalsG1rSUebMY8eibBZqwrYMM50K/q1p+NB32IVH4
	BSq7Elwjus9z8pGi58b5UkyDY/O88mquv+viH0rHCcXnYeWCwsfeKi+NSi73MOkN7LtUO6jQMSp
	+ZBCeF42twv+30IB18hoO+nxcHRhpZhkZZlvFj2aZKJMZjjUgPELe9hyOsa5kAHpDtgiqkCps/k
	dLegTeoJrbwtqYX0LUcWkAegQzF5FBYqWnF/MbK8F
X-Received: by 2002:a05:600c:3f1b:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48fc9a50d32mr5862785e9.29.1778619971824;
        Tue, 12 May 2026 14:06:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3f1b:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48fc9a50d32mr5862425e9.29.1778619971141;
        Tue, 12 May 2026 14:06:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm36066581f8f.13.2026.05.12.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:06:10 -0700 (PDT)
Date: Tue, 12 May 2026 17:06:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	virtualization@lists.linux.dev, linux-mm@kvack.org,
	Andrea Arcangeli <aarcange@redhat.com>,
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
Subject: [PATCH v7 11/31] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <7d637bcac4bb5705388136a75f0fdfe2881e5f20.1778616612.git.mst@redhat.com>
References: <cover.1778616612.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778616612.git.mst@redhat.com>
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
index 56da819a79e6..e995d2a413f9 100644
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

