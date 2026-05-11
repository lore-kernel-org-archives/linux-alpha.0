Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C643D5662
	for <linux-alpha@vger.kernel.org>; Mon, 11 May 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489698; cv=none; b=Nj18KL+YxMv/e5Isz9qWIiLoDGJKSnBNMlu5H9MDdJ/kM8DHCChG5eHx9cb1XSQx/N4cII6kuXIx5wpORtqD0gvHAp1+MGwm7JXWP9CebfphOOxsOGRbg+HAcNJtuWfE275klvSohm8TaI0jeSQCzP0S/MsH5Wg9a+AInW5bxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489698; c=relaxed/simple;
	bh=xVZpENOTPSkcCw9H72WToBvwV1ZsJAWZkigdtcUbLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfrk5tNROLTM+vpZGv1lQmkxPIKmoIJsSBNsx5Q8mN02DCz48s0yLrJtcQjdSoQMSgFZ6X5gIz45b/Hh8wEQoFxkxND1CJRyZP6gbXRj3EqMN/9RP2Lc6eBzBUAqVx1LHpaLzCj6ktXvGgn3AvyL7lGqJC4VoBHlpkXH6ghJcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ILfbbzDH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kDHRQF/d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ILfbbzDH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kDHRQF/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778489696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
	b=ILfbbzDH+y3CDGVYMb9Cq/LTFDiIVMY+rpbSFOvLJYJoTy7tK9SeD09RTzOXgmIOGqEnr0
	YcLmG1BhAvQL+B6kznXc8R6Ppg8MpfJd+jatq9Bl2uK0ctHfLGDQyCfyAf1Z3lPHPt3uZm
	PrUuzdnM+UuxtL2RBvjbDXBu3fFRBCo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-tAVYoJN4MWCIphYzKUBSlQ-1; Mon, 11 May 2026 04:54:53 -0400
X-MC-Unique: tAVYoJN4MWCIphYzKUBSlQ-1
X-Mimecast-MFC-AGG-ID: tAVYoJN4MWCIphYzKUBSlQ_1778489693
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-44ffa15dc73so3680122f8f.1
        for <linux-alpha@vger.kernel.org>; Mon, 11 May 2026 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778489692; x=1779094492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=kDHRQF/dOmNzIAhcGmS9Wn1QckUrx0zY8goOH5wfUlJ08AeXpDeCK8oHPHK+JhioS4
         1v37C+LP8oO8dLDkXo/kU9ofp9tABD6FAbLSHmPxAoNsXx6YMoGRx7luUUJcjN1PPSfS
         KwmWdRQsdB/dAEdI15XXDGhFTJ05Uq3hkKBQofMN8EkbsxZ+xLnRFpZH1oP+8TZnUXTc
         np3v3OIGMD7K7VIu2ipdFHXVa4NpI2w16Z/ug8X1GpDVYSMvg4CZ3MCxufC78F/Kwn1U
         TH11uyKD3paTZ+3cex+w9mjIr6WT54P+aeBJA1GWjTjYIOQl9WxhQ10F5pNJkLkWcKFD
         1/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489692; x=1779094492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=WlPdIKCxKSppVY3yhrRJvTO25sPyTAdCz80zFLHFeWA1y3+F4d1EEpVoUbX1OjoYri
         jtyBktNiwVhNpHHnYMCOe2YOblr/ZlGo6zDYtUacFVs+1N5D+JMwBMf06TP9Y2maw2eY
         8Tanrlf3Moc4aeaS6xja5DszHL8MK55Tvug0pJqYEWSmzq279Un/vfoPHWMs4o7pqmEN
         PV3WsAM3r+6U5u0H34UtG41S9ONhfeUQGiPI2wzyn9Q1Mc83bdDtenBNdnOCAzvyFqaH
         gB0xLdy7o8wCQi7PS/66kz7ICVOgCh5yML9MoxC+WXDD0Ul/Wc6dlMUyDcSCSblBQP2m
         gOww==
X-Forwarded-Encrypted: i=1; AFNElJ93n39cZCJEvVkJ/rMghy/+0A3EX6qtg1gOpBkul/RReNberHlxVOZAMfDT/t9ARZklWQ+8HXjITVS0rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDA74uV650IiP1qAv33AOxwIqLQgqXiEcJsswtEKeQUaAQx9i
	5U0jxzmCl85cU2PeSpMDGCDpNnYI+ZV+qvh7/4HZUwOVaiP4fubzp13cWBO20u9fX+iNAHcHxpg
	s4YUTeJT5eGoDF0y01QO5ONVufgAMYUaowQ3jAbR+eTs33tKCFTY2BwYZIr+hZZy1
X-Gm-Gg: Acq92OEeQ+uLcQxs6TjXqgsl3ZPjuV/PYFlVe/CQAE9CUspW/U48griLbjG6PvYKV7Z
	YmEFmFFkDx+EaA8dR0Zeh26STwMRkW+VafqSwLTMBnozZe1X4XFTGxY4pOvqU6GssECk4tOrKtf
	8nat7c/PgGTBBwvpU1hot/ApYV5LqBmKWZQZRjf40tSR0rlTZgy+wdjK6swgHbnzqg945QUNVvz
	Ba2zy1iQzj9X2U6iA8tro+Cd4Z6yDheZAGNC2pVa99Z5ZPceWV/FyhsdtJEedagYPYjSvyFv4/K
	H58zpaHAZ1Rrs9mP7xEgZRRG+QfHTH4Ep8eRQgqOKBgkpGKRJdbnnol9W18QxZg/zVp5xJZlO1j
	9+vZhYkD3/ZwHj+r80rdn3yJSYjUheWc1Te7JHoPt
X-Received: by 2002:a05:600c:1da8:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48e635a1ba0mr253243805e9.0.1778489692277;
        Mon, 11 May 2026 01:54:52 -0700 (PDT)
X-Received: by 2002:a05:600c:1da8:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48e635a1ba0mr253242975e9.0.1778489691662;
        Mon, 11 May 2026 01:54:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454919c13c9sm23822939f8f.27.2026.05.11.01.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:51 -0700 (PDT)
Date: Mon, 11 May 2026 04:54:44 -0400
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
Subject: [PATCH v6 15/30] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <64e3432a5982607dc886f5943f556f54c0612e3e.1778487000.git.mst@redhat.com>
References: <cover.1778487000.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778487000.git.mst@redhat.com>
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

