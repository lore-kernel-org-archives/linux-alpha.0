From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/6] Add new NOSAVE_DATA linker script macro.
Date: Fri, 1 May 2009 11:21:14 +0200
Message-ID: <20090501092114.GC18326@uranus.ravnborg.org>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu> <1241121253-32341-2-git-send-email-tabbott@mit.edu> <1241121253-32341-3-git-send-email-tabbott@mit.edu>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1241121253-32341-3-git-send-email-tabbott@mit.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Abbott <tabbott@MIT.EDU>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@kernel.org>, Chris Zankel <chris@zankel.net>, Cyrill Gorcunov <gorcunov@openvz.org>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, dev-etrax@axis.com, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, Hirokazu Takata <takata@linux-m32r.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Kyle McMartin <kyle@mcmartin.ca>, Linus Torvalds <>

On Thu, Apr 30, 2009 at 03:54:09PM -0400, Tim Abbott wrote:
> This patch is preparation for replacing most ".data.nosave" in the
> kernel with macros, so that the section name can later be changed
> without having to touch a lot of the kernel.
> 
> The long-term goal here is to be able to change the kernel's magic
> section names to those that are compatible with -ffunction-sections
> -fdata-sections.  This requires renaming all magic sections with names
> of the form ".data.foo".
> 
> Signed-off-by: Tim Abbott <tabbott@mit.edu>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  include/asm-generic/vmlinux.lds.h |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 3d88c87..f5ebd2b 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -124,6 +124,13 @@
>  	. = ALIGN(PAGE_SIZE);						\
>  	*(.bss.page_aligned)
>  
> +#define NOSAVE_DATA							\
> +	. = ALIGN(PAGE_SIZE);						\
> +	__nosave_begin = .;						\
> +	*(.data.nosave)							\
> +	. = ALIGN(PAGE_SIZE);						\
> +	__nosave_end = .;
> +

You need to use:
	VMLINUX_SYMBOL(__nosave_begin) = .;

Otherwise architectures such as m68k wil break as they
add a leading underscore.

See other symbols that is defined inside vmlinux.lds.h

	Sam

