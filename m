From: David Hildenbrand <david@redhat.com>
Subject: [PATCH] madvise.2: Document MADV_POPULATE_READ and MADV_POPULATE_WRITE
Date: Tue,  8 Jun 2021 18:00:49 +0200
Message-ID: <20210608160049.24685-1-david@redhat.com>
References: <20210511081534.3507-1-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623168070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ny0GQOcOMIJ9f9GtQNBSHCKyJm/TZJpAh/jRCTYyLxE=;
        b=IvXUmP3ziGgphFSY30Wb2ZoQ4EwuIBF3MSjeOa1xl4rG+2aB0/eAYS1mFzTVjXo/QWUSuu
        6g3VwIvxmOgfdVS8gSGxBsEfQnQHLa+8E2MfmUYsucOxJaGXDMg7xGsia14UsUI750YnKe
        FwNaPcBXdLUek8126TnmJPtgjof6daI=
In-Reply-To: <20210511081534.3507-1-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.f>

Let's document MADV_POPULATE_READ and MADV_POPULATE_WRITE behavior and
error conditions.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Rik van Riel <riel@surriel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: linux-alpha@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-arch@vger.kernel.org
Cc: Linux API <linux-api@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Not for upstream man pages yet, only for linux-mm and linux-api review
purposes. Once/if the linux changes are merged upstream, I'll send it to
the proper man list/maintainers.

---
 man2/madvise.2 | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/man2/madvise.2 b/man2/madvise.2
index f1f384c0c..3ec8c53a7 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -469,6 +469,59 @@ If a page is file-backed and dirty, it will be written back to the backing
 storage.
 The advice might be ignored for some pages in the range when it is not
 applicable.
+.TP
+.BR MADV_POPULATE_READ " (since Linux 5.14)
+Populate (prefault) page tables readable for the whole range without actually
+reading. Depending on the underlying mapping, map the shared zeropage,
+preallocate memory or read the underlying file; files with holes might or
+might not preallocate blocks.
+Do not generate
+.B SIGBUS
+when populating fails, return an error instead.
+.IP
+If
+.B MADV_POPULATE_READ
+succeeds, all page tables have been populated (prefaulted) readable once.
+If
+.B MADV_POPULATE_READ
+fails, some page tables might have been populated.
+.IP
+.B MADV_POPULATE_READ
+cannot be applied to mappings without read permissions
+and special mappings marked with the kernel-internal
+.B VM_PFNMAP
+and
+.BR VM_IO .
+.IP
+Note that with
+.BR MADV_POPULATE_READ ,
+the process can be killed at any moment when the system runs out of memory.
+.TP
+.BR MADV_POPULATE_WRITE " (since Linux 5.14)
+Populate (prefault) page tables writable for the whole range without actually
+writing. Depending on the underlying mapping, preallocate memory or read the
+underlying file; files with holes will preallocate blocks.
+Do not generate
+.B SIGBUS
+when populating fails, return an error instead.
+.IP
+If
+.B MADV_POPULATE_WRITE
+succeeds, all page tables have been populated (prefaulted) writable once.
+If
+.B MADV_POPULATE_WRITE
+fails, some page tables might have been populated.
+.IP
+.B MADV_POPULATE_WRITE
+cannot be applied to mappings without write permissions
+and special mappings marked with the kernel-internal
+.B VM_PFNMAP
+and
+.BR VM_IO .
+.IP
+Note that
+.BR MADV_POPULATE_WRITE ,
+the process can be killed at any moment when the system runs out of memory.
 .SH RETURN VALUE
 On success,
 .BR madvise ()
@@ -533,6 +586,17 @@ or
 .BR VM_PFNMAP
 ranges.
 .TP
+.B EINVAL
+.I advice
+is
+.B MADV_POPULATE_READ
+or
+.BR MADV_POPULATE_WRITE ,
+but the specified address range includes ranges with insufficient permissions,
+.B VM_IO
+or
+.BR VM_PFNMAP.
+.TP
 .B EIO
 (for
 .BR MADV_WILLNEED )
@@ -548,6 +612,14 @@ Not enough memory: paging in failed.
 Addresses in the specified range are not currently
 mapped, or are outside the address space of the process.
 .TP
+.B ENOMEM
+.I advice
+is
+.B MADV_POPULATE_READ
+or
+.BR MADV_POPULATE_WRITE ,
+but populating (prefaulting) page tables failed.
+.TP
 .B EPERM
 .I advice
 is
@@ -555,6 +627,14 @@ is
 but the caller does not have the
 .B CAP_SYS_ADMIN
 capability.
+.TP
+.B EHWPOISON
+.I advice
+is
+.B MADV_POPULATE_READ
+or
+.BR MADV_POPULATE_WRITE ,
+and a HW poisoned page is encountered.
 .SH VERSIONS
 Since Linux 3.18,
 .\" commit d3ac21cacc24790eb45d735769f35753f5b56ceb
-- 
2.31.1

