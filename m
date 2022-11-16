From: David Hildenbrand <david@redhat.com>
Subject: [PATCH mm-unstable v1 12/20] RDMA/siw: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:51 +0100
Message-ID: <20221116102659.70287-13-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaZ8lDT66OjU5mfpX+7w/ZVQ8ighV47r7cnFpFhTg2E=; b=Sf4hEcTkdrJopn
	Pc+D+Ag6jk0VWWeRZBFfflJW9vZabHSXMqs8rDAm46tJ8JfIq/giZunsiyF0sbEmBetOnHs2djXdV
	sH6aU+qb4vNUuAoIMemVI8FcMj/fX1Az0K3tTrp1JZXWwTa0yUbLwnExy5qVZP7qUvR2clKoXjShm
	kSkRJ+o29dVhhlXS88Zufn9nFKsJFiyZ5ikx1cb5v8c5xP3v/RfkmvPbVBGRuRZtT2YyZaJhPfyJi
	1W6J3ieWs9pirvXdjP1PVT1xtwnHK7gpp5uLMMt0UT5BPyrMHk6gWlSm/NKsTQSaTajsgyHgFTc1i
	pHuIHjdO0hy3mCgASqdA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Os9mhvYmMDrU7oRu07Gt40tRhtITIyLN3UTJWIxCBGQ=;
	b=Np5mjxEQ6nkEvC55WFc+8lnTQduUxuP+2dfPKZNeS2rk/mVM8fhjpQwnWucL2zS360O6zL
	RbnP6kXzyBTFlhakIQvJ8B2E+axaTZrD34u0z2BLjSCx9ZqeftT79MQqpx70HDKLanLY2+
	qjkb3nFkqOTWvmQeLXWZKPOlbxCxVc8=
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <>

GUP now supports reliable R/O long-term pinning in COW mappings, such
that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
far in one corner case (DAXFS file with holes), which can be ignored
because GUP does not support long-term pinning in fsdax (see
check_vma_flags()).

Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
using FOLL_FORCE, which is really only for ptrace access.

Cc: Bernard Metzler <bmt@zurich.ibm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/infiniband/sw/siw/siw_mem.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/siw/siw_mem.c
index 61c17db70d65..b2b33dd3b4fa 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -368,7 +368,7 @@ struct siw_umem *siw_umem_get(u64 start, u64 len, bool writable)
 	struct mm_struct *mm_s;
 	u64 first_page_va;
 	unsigned long mlock_limit;
-	unsigned int foll_flags = FOLL_WRITE;
+	unsigned int foll_flags = FOLL_LONGTERM;
 	int num_pages, num_chunks, i, rv = 0;
 
 	if (!can_do_mlock())
@@ -391,8 +391,8 @@ struct siw_umem *siw_umem_get(u64 start, u64 len, bool writable)
 
 	mmgrab(mm_s);
 
-	if (!writable)
-		foll_flags |= FOLL_FORCE;
+	if (writable)
+		foll_flags |= FOLL_WRITE;
 
 	mmap_read_lock(mm_s);
 
@@ -423,8 +423,7 @@ struct siw_umem *siw_umem_get(u64 start, u64 len, bool writable)
 		while (nents) {
 			struct page **plist = &umem->page_chunk[i].plist[got];
 
-			rv = pin_user_pages(first_page_va, nents,
-					    foll_flags | FOLL_LONGTERM,
+			rv = pin_user_pages(first_page_va, nents, foll_flags,
 					    plist, NULL);
 			if (rv < 0)
 				goto out_sem_up;
-- 
2.38.1
