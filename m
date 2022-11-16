From: David Hildenbrand <david@redhat.com>
Subject: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:55 +0100
Message-ID: <20221116102659.70287-17-david@redhat.com>
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
	List-Owner; bh=My2y4pw7e4t1iXSksFdfQNXD27ucNXHm9Q5OY+N3WGI=; b=iMdLsCGrVeZHv7
	Dh2jwomb/4t7Ag5bxV/ee1Vr8YhVjaiAKbVZAqa2qjta3QiRgc+KHVDERreq7XfXx/ZnGLR8fyKoZ
	zyKJHjyZjsf1wiv0NJDdcBJDyW4v+TtxUVWiby40M1Ek7ttGq9pclnud1hXfEhK1rcLMWSHR+8nNA
	Khdw5jB/YnsN1lzfC6frsxQoXgXDz3oJVwrEtR01qw52adUhfSBERD9LgNQxfrc+o4CgfXSXZbzuV
	U3PPqUxaii8PZMJz8A1zsESqasBILj/FcBC3xr33csDCYtVROavQ/RgONBR3ndwq3KSebq6Uh8edb
	W0OnqER05a/MLKJtuNMQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0FpSSTO1Nfi3hHjZY1vs8kl28xrhbJvR/VmU2bZlrg=;
	b=QBzDddfY7V11x7Hf2GLg6C9hU2X9wWzeSIv9jWmXhTrk3Npp+wfCGvyF3JNBhdUnoX0aal
	8iY4vG/2Ym+nF4oWvBR6tEY6OFCT2zacWrb0Ju8Ild05xJePJiVVv+ZJ7IB5ZQG6jj9P6O
	aoTME2nThx0sHU5BautNfK3YY5kC94Q=
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

FOLL_FORCE is really only for ptrace access. According to commit
707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
writable"), get_vaddr_frames() currently pins all pages writable as a
workaround for issues with read-only buffers.

FOLL_FORCE, however, seems to be a legacy leftover as it predates
commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
always writable"). Let's just remove it.

Once the read-only buffer issue has been resolved, FOLL_WRITE could
again be set depending on the DMA direction.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index 542dde9d2609..062e98148c53 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	start = untagged_addr(start);
 
 	ret = pin_user_pages_fast(start, nr_frames,
-				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  FOLL_WRITE | FOLL_LONGTERM,
 				  (struct page **)(vec->ptrs));
 	if (ret > 0) {
 		vec->got_ref = true;
-- 
2.38.1
