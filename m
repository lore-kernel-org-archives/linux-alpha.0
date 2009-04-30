From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 0/4] section name cleanup for alpha
Date: Thu, 30 Apr 2009 19:00:12 -0400
Message-ID: <1241132416-7055-1-git-send-email-tabbott@mit.edu>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

This patch series cleans up the section names on the alpha
architecture.  It requires the architecture-independent macro
definitions from this patch series:

<http://www.spinics.net/lists/mips/msg33499.html>

The long-term goal here is to add support for building the kernel with
-ffunction-sections -fdata-sections.  This requires renaming all the
magic section names in the kernel of the form .text.foo, .data.foo,
.bss.foo, and .rodata.foo to not have collisions with sections
generated for code like:

static int nosave = 0; /* -fdata-sections places in .data.nosave */
static void head(); /* -ffunction-sections places in .text.head */

Note that these patches have not been boot-tested (aside from testing
the analogous changes on x86), since I don't have access to the
appropriate hardware.

	-Tim Abbott

Tim Abbott (4):
  alpha: Use macros for .data.page_aligned.
  alpha: use new macro for .data.cacheline_aligned section.
  alpha: make THREAD_SIZE available to assembly files.
  alpha: use .data.init_task instead of .data.init_thread

 arch/alpha/include/asm/thread_info.h |    4 ++--
 arch/alpha/kernel/init_task.c        |    5 ++---
 arch/alpha/kernel/vmlinux.lds.S      |   19 ++++---------------
 3 files changed, 8 insertions(+), 20 deletions(-)

