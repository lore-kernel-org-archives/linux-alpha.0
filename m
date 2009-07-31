From: Tim Abbott <tabbott@ksplice.com>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of
 .data.init_thread.
Date: Fri, 31 Jul 2009 19:56:34 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0907311933360.2539@vinegar-pot.mit.edu>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com> <4A7360C3.2060507@twiddle.net> <alpine.DEB.1.10.0907311739040.2539@vinegar-pot.mit.edu> <4A737EB1.1000602@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752009AbZGaX5D@vger.kernel.org>
In-Reply-To: <4A737EB1.1000602@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On Fri, 31 Jul 2009, Richard Henderson wrote:

> On 07/31/2009 03:02 PM, Tim Abbott wrote:
> > 
> > This change:
> > 
> > -	. = ALIGN(2 * PAGE_SIZE);
> > +	. = ALIGN(PAGE_SIZE);
> >   	__init_end = .;
> > 
> > removes the now-unnecessary (2 * PAGE_SIZE) alignment for __init_end
> > caused by moving .data.init_task (it should have been in the first patch).
> 
> While it's technically unnecessary, it's also very much desired.
> 
> Think about it.  Suppose we have 9 pages of init, followed by the
> two-page-aligned INIT_TASK_DATA.  So we get a page worth of padding
> added.  It's better to have the two-page-alignment within the init
> section so as to get 10 pages of init followed by no padding.  In
> this way the page of padding gets freed with the rest of init.
> 
> Are you following me at all here?

Yeah, okay, that makes total sense (nice optimization).  New version of 
the patch below, with the alignment changed to THREAD_SIZE (and I added a 
comment explaining why).

	-Tim Abbott

From: Geoffrey Thomas <geofft@ksplice.com>

alpha: Clean up linker script using new linker script macros.

Note that .data.page_aligned and .data.cacheline_aligned are now after
_data; it was probably a bug that they were before it.

Also, some explicit ALIGN(8)'s between various initcall sections were
removed; this should be harmless as the implicit alignment of
initcall_t was already 8.

Signed-off-by: Geoffrey Thomas <geofft@ksplice.com>
Signed-off-by: Tim Abbott <tabbott@ksplice.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 arch/alpha/kernel/vmlinux.lds.S |   90 ++++-----------------------------------
 1 files changed, 9 insertions(+), 81 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index a4bb75e..a4f9001 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -32,84 +32,21 @@ SECTIONS
 	} :kernel
 
 	RODATA
-
-	/* Exception table */
-	. = ALIGN(16);
-	__ex_table : {
-		__start___ex_table = .;
-		*(__ex_table)
-		__stop___ex_table = .;
-	}
+	EXCEPTION_TABLE(16)
 
 	/* Will be freed after init */
-	. = ALIGN(PAGE_SIZE);
-	/* Init code and data */
-	__init_begin = .;
-	.init.text : {
-		_sinittext = .;
-		INIT_TEXT
-		_einittext = .;
-	}
-	.init.data : {
-		INIT_DATA
-	}
-
-	. = ALIGN(16);
-	.init.setup : {
-		__setup_start = .;
-		*(.init.setup)
-		__setup_end = .;
-	}
-
-	. = ALIGN(8);
-	.initcall.init : {
-		__initcall_start = .;
-		INITCALLS
-		__initcall_end = .;
-	}
-
-#ifdef CONFIG_BLK_DEV_INITRD
-	. = ALIGN(PAGE_SIZE);
-	.init.ramfs : {
-		__initramfs_start = .;
-		*(.init.ramfs)
-		__initramfs_end = .;
-	}
-#endif
-
-	. = ALIGN(8);
-	.con_initcall.init : {
-		__con_initcall_start = .;
-		*(.con_initcall.init)
-		__con_initcall_end = .;
-	}
-
-	. = ALIGN(8);
-	SECURITY_INIT
-
+	__init_begin = ALIGN(PAGE_SIZE);
+	INIT_TEXT_SECTION(PAGE_SIZE)
+	INIT_DATA_SECTION(16)
 	PERCPU(PAGE_SIZE)
-
-	. = ALIGN(2 * PAGE_SIZE);
+	/* Align to THREAD_SIZE rather than PAGE_SIZE here so any padding page
+	   needed for the THREAD_SIZE aligned init_task gets freed after init */
+	. = ALIGN(THREAD_SIZE);
 	__init_end = .;
 	/* Freed after init ends here */
 
-	. = ALIGN(PAGE_SIZE);
-	.data.page_aligned : {
-		*(.data.page_aligned)
-	}
-
-	. = ALIGN(64);
-	.data.cacheline_aligned : {
-		*(.data.cacheline_aligned)
-	}
-
 	_data = .;
-	/* Data */
-	.data : {
-		INIT_TASK_DATA(THREAD_SIZE)
-		DATA_DATA
-		CONSTRUCTORS
-	}
+	RW_DATA_SECTION(64, PAGE_SIZE, THREAD_SIZE)
 
 	.got : {
 		*(.got)
@@ -119,16 +56,7 @@ SECTIONS
 	}
 	_edata = .;	/* End of data section */
 
-	__bss_start = .;
-	.sbss : {
-		*(.sbss)
-		*(.scommon)
-	}
-	.bss : {
-		*(.bss)
-		*(COMMON)
-	}
-	__bss_stop = .;
+	BSS_SECTION(0, 0, 0)
 	_end = .;
 
 	/* Sections to be discarded */
-- 
1.6.3.3
