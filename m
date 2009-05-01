From: Tim Abbott <tabbott@MIT.EDU>
Subject: Re: [PATCH v2 1/6] Add new macros for page-aligned data and bss
 sections.
Date: Fri, 1 May 2009 09:54:34 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0905010951100.3955@vinegar-pot.mit.edu>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu> <1241121253-32341-2-git-send-email-tabbott@mit.edu> <20090501091848.GB18326@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20090501091848.GB18326@uranus.ravnborg.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@kernel.org>, Chris Zankel <chris@zankel.net>, Cyrill Gorcunov <gorcunov@openvz.org>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, dev-etrax@axis.com, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, Hirokazu Takata <takata@linux-m32r.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Kyle McMartin <kyle@mcmartin.ca>, Linus Torvalds <>

On Fri, 1 May 2009, Sam Ravnborg wrote:

> On Thu, Apr 30, 2009 at 03:54:08PM -0400, Tim Abbott wrote:
> > +#define __PAGE_ALIGNED_DATA	.section ".data.page_aligned", "aw", @progbits
> > +#define __PAGE_ALIGNED_BSS	.section ".bss.page_aligned", "aw", @nobits
> 
> It is my understanding that the linker will automatically
> assume nobits for section names starting with .bss and likewise
> progbits for section names starting with .data - so we can leave them out?

I believe that is correct.

	-Tim Abbott



