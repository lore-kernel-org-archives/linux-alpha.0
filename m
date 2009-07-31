From: Tim Abbott <tabbott@ksplice.com>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of
 .data.init_thread.
Date: Fri, 31 Jul 2009 19:44:17 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0907311746020.2539@vinegar-pot.mit.edu>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com> <4A7360C3.2060507@twiddle.net> <4A736460.5070509@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4A736460.5070509@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On Fri, 31 Jul 2009, Richard Henderson wrote:

> On 07/31/2009 02:23 PM, Richard Henderson wrote:
> > Similarly it is *not* a bug that the page_aligned sections were before
> > data, because we already knew we had 2 page alignment from the end of
> > init + 2 pages of init_thread.
> 
> Indeed, I'll go further and say that the common definition of RW_DATA_SECTION
> is buggy.
[...]
> Given that we align the entire .data section why have interior padding to
> re-align for page-aligned data?  Surely a better ordering would be
[...]

Agreed.  I actually commented on this issue in one of the drafts of 
RW_DATA_SECTION, but forgot to check again whether Sam had addressed it 
when reviewing the final version.  Fortunately we're talking about a small 
inefficiency, not something more serious.  Below is your proposed change 
in patch form; I hope Sam will take a look at it.

	-Tim Abbott

Optimize the ordering of sections in RW_DATA_SECTION.

The current RW_DATA_SECTION macro doesn't place the various 
PAGE_SIZE-aligned sections next to each other.  This could result in up to 
a page of memory being wasted realigning to PAGE_SIZE twice.

Signed-off-by: Tim Abbott <tabbott@ksplice.com>
---
 include/asm-generic/vmlinux.lds.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 6ad76bf..146815d 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -706,12 +706,12 @@
 	. = ALIGN(PAGE_SIZE);						\
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {				\
 		INIT_TASK_DATA(inittask)				\
+		NOSAVE_DATA						\
+		PAGE_ALIGNED_DATA(pagealigned)				\
 		CACHELINE_ALIGNED_DATA(cacheline)			\
 		READ_MOSTLY_DATA(cacheline)				\
 		DATA_DATA						\
 		CONSTRUCTORS						\
-		NOSAVE_DATA						\
-		PAGE_ALIGNED_DATA(pagealigned)				\
 	}
 
 #define INIT_TEXT_SECTION(inittext_align)				\
-- 
1.6.3.3

