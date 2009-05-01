From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/6] macros for section name cleanup
Date: Fri, 1 May 2009 16:21:10 +0200
Message-ID: <20090501142110.GA25236@uranus.ravnborg.org>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Abbott <tabbott@MIT.EDU>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@kernel.org>, Chris Zankel <chris@zankel.net>, Cyrill Gorcunov <gorcunov@openvz.org>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, dev-etrax@axis.com, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, Hirokazu Takata <takata@linux-m32r.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Kyle McMartin <kyle@mcmartin.ca>, Linus Torvalds <>

On Thu, Apr 30, 2009 at 03:54:07PM -0400, Tim Abbott wrote:
> (this patch series differs from v1 only in the CC list; some of the
> architecture lists I sent the previous one to are moderated against
> non-members; all replies should go to this version).
> 
> Here are the architecture-independent macro definitions needed for
> to clean up the kernel's section names.  The overall diffstat from
> this section name cleanup project is:
> 
>  96 files changed, 261 insertions(+), 503 deletions(-)
> 
> The decrease results from removing a lot of redundancy in the linker
> scripts.
> 
> The long-term goal here is to add support for building the kernel with
> -ffunction-sections -fdata-sections.  This requires renaming all the
> magic section names in the kernel of the form .text.foo, .data.foo,
> .bss.foo, and .rodata.foo to not have collisions with sections
> generated for code like:
> 
> static int nosave = 0; /* -fdata-sections places in .data.nosave */
> static void head(); /* -ffunction-sections places in .text.head */
> 
> Sam Ravnborg proposed that rather than just renaming all the sections
> outright, we should start by first getting more control over the
> section names used in the kernel so that we can later rename sections
> without touching too many files.  These patch series implement that
> cleanup.  Later, there will be another patch series to actually rename
> the sections.
> 
> I'm hoping we can get just these macro definitions into 2.6.30 so that
> the arch maintainers don't have to grab the macro definitions for
> their trees while reviewing the patches for 2.6.31.
> 
> Shortly, I'm going to send one patch series for each of the
> architectures updating those architectures to use these new macros
> (and otherwise cleaning up section names on those architectures).
> 
> 	-Tim Abbott
> 
> Tim Abbott (6):
>   Add new macros for page-aligned data and bss sections.
>   Add new NOSAVE_DATA linker script macro.
>   Add new CACHELINE_ALIGNED_DATA linker script macro.
>   Add new INIT_TASK_DATA() linker script macro.
>   Add new READ_MOSTLY_DATA(align) linker script macro.

I am about to apply this part of your patches.
I am doing some additional modifications and
will most likely apply them as one patch.

Will post to linux-arch for review when it is ready.

	Sam

