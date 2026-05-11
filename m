Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BD3C9454
	for <linux-alpha@vger.kernel.org>; Mon, 11 May 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489621; cv=none; b=nh+Amc/ycE1CqqGrF7o9zVP2ee12BOzGCz6kNDF/W14XuTESReGb5GT/9Xin1FWWTMzYCACg1uJs4dv+92KyjZxeYPGRavQVn12IIGJmlWVNKwoqu4+LBSD0nze1I/eqi/FNAHypZPJ7oUyZvxgqQSlG4zThxi0F6+MUY0c7e+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489621; c=relaxed/simple;
	bh=xVZpENOTPSkcCw9H72WToBvwV1ZsJAWZkigdtcUbLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szYC3pdxREUwNgU9bu87hL7mf+evS9yD/MTQXTDOzaqJDHs/U9uQp+4311CGgEKSSN0s/OoOtabYrQHl2HHyY9mbBjkcHYTouVpmsTXorC3+binXGGJZPJSlRVExxoL/XXH/q3iF+Xn9yl0wQT6899q75/vckQDuh3A3l/2fWy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0D1+xGL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0ROFLLZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0D1+xGL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0ROFLLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778489619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
	b=R0D1+xGLOr82seal6woH1VRZj849Csj64YvQnT9nUFpb6Xt+X3ycX1ihYTGXxzfW5gcWJj
	BeibQRXG7IqytQH+cy/qeqE6UW7SxWtPxNfUQVlA57Agr9nGiEQN92TO4E/f0IbS7NdS6s
	29x241JjWOXgcUCby15QG6NZL2rkcc4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Iv_ZhNl2NCe3Cd6d10rqMg-1; Mon, 11 May 2026 04:53:37 -0400
X-MC-Unique: Iv_ZhNl2NCe3Cd6d10rqMg-1
X-Mimecast-MFC-AGG-ID: Iv_ZhNl2NCe3Cd6d10rqMg_1778489616
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488dcaf2f2fso31771325e9.0
        for <linux-alpha@vger.kernel.org>; Mon, 11 May 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778489616; x=1779094416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=c0ROFLLZAjtzUQh0C7V/vwJAA1fPKJ6u/Zej1oamUTHaibdFBeTiGMKWmZ+8Ijl6Am
         K1ul+w0cmMXEUynLMsa1+jzqlsJWsu7yDl94ILnr86xw06XWkxCySIvOmSUworXYQzev
         P2so3ggOapfO4iimvEuhFAJttvYWQxBNZIwOdN4iDxyVcH5DyJW31uZussuZcrqg6Lp8
         U0bMTobykLgwxR7Ag1xzYf42FvvFvl9piVcjXrHj6S4HFtDO9ZlvK6zxVzc/UpHlDOOc
         vQM8ZxhneXlR+x4dJA6Ttqg2NFE6on8UwONOecQxX6BGnbiEtbAzff7ydqpY0TrbDGis
         qbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489616; x=1779094416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=Zak1M2OrRdsn82JiluIFy0N9DYeUwAIKtrXYQKexCtnV7tkPQ0tZ0XTNswhIvsHUSN
         0paZEIBvzvlWzXS/rGSDtgoQeIgCOL03fBBKi/ZePsvBxc9obiLXomY2Qj+4KeZ2R4Gh
         9XPI60dHIQFG2ngP4BnAfs0EB7JUNQAPwhusw/JU7xcJUtoyeJXkEnhglzjZjg6zuqKI
         xstxtO/2j6auNrYDhUMep7h7jWX8E3/9a23+sieXWKfu+WTzwPT5L8v1ZmAOTv9eAMQi
         oudwdOKrwFmtc+liGN3rkin0fh37p887QBX+abobJqqDD4rqZ79Gjc6LOPrYS9HLnu+K
         eQvg==
X-Forwarded-Encrypted: i=1; AFNElJ+U1JXissUULKiOjzqdP7g0J9UnZ06qdeWs+gJnx8gldfwRO7/OvZM9UHxXvqS8nrZGUAz+Xhx8WPq3uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nNbprPUCwKc62eKKvFryPsEg86ZO6gaivxV3TRC9E/wcUVW3
	RSApd6GXXvT5FlCdmFtMjPgurN7EBDrEvGWuZFAwwUMLf47BzJrIzfoLuS4RN1RSdr/UEVIvBi2
	wlG78ltO2iNtBIUOim5BnxQu1vbHYA0GsZOAcRA1KlXH8Qf/xRDgPYiowbnW9lXbG
X-Gm-Gg: Acq92OGhBngCykpwYzaXLbcW+st202I2qK19ccH8xURj2jUCMrSqiS8Uhw2Q53JqZ8L
	filfoqP9a9gKqHVfGSh+UAsvzv6o5F1g9/GWk4lpXnSkiD5rr/8AJm3cwBYS/tkVnem7D7n7a1z
	GSeIEg9yaYOI/lbz0F+r/3+V4IsO4J+1CXUr5AeWTbXbiIxlBGR3XXleOiwUCifhLo+loYWb9XN
	puiE0xkXX4HGeffNyjIm75G0/tYe3HLP0qCPfveq0qlm6iadoukrzQlA7byz8bwEFHCJy69tGFh
	zOJuUQU4c3olH6EVNCqC+xLJd8wUjfk0mgOsDT3KLuJNIMeLaY0wNjKNpv0c3kaT9QHF0fHEa87
	BYP/qBN9Mwa+gSTZukw/2+1eVCXKqE2LMhG8iQqKm
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr385229875e9.27.1778489616189;
        Mon, 11 May 2026 01:53:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr385228675e9.27.1778489615481;
        Mon, 11 May 2026 01:53:35 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7041c4e8sm166061275e9.14.2026.05.11.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:53:34 -0700 (PDT)
Date: Mon, 11 May 2026 04:53:29 -0400
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Subject: [PATCH v6 08/30] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <24a1b25f4f1cf31fc5bc053e475958ed5e1bf8bd.1778488966.git.mst@redhat.com>
References: <cover.1778488966.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778488966.git.mst@redhat.com>
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

