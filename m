From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 0/3] Linker script cleanup patches for alpha
Date: Wed, 16 Sep 2009 12:38:36 -0400
Message-ID: <1253119119-18956-1-git-send-email-tabbott@ksplice.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Tim Abbott <tabbott@ksplice.com>

This is an updated version of the patch series I sent in late July
cleaning up the alpha architecture's linker scripts.  There are some
fixes based on comments from Richard Henderson; it has also been
rebased on top of Linus's current master.

This cross-architecture linker script cleanup project is in
preparation for adding support for building the kernel with
-ffunction-sections -fdata-sections, which is a prerequisite for
Ksplice.

Geoffrey Thomas (1):
  alpha: Clean up linker script using new linker script macros.

Tim Abbott (2):
  alpha: use .data.init_task instead of .data.init_thread.
  Optimize the ordering of sections in RW_DATA_SECTION.

 arch/alpha/kernel/init_task.c     |    5 +-
 arch/alpha/kernel/vmlinux.lds.S   |   95 ++++---------------------------------
 include/asm-generic/vmlinux.lds.h |    4 +-
 3 files changed, 14 insertions(+), 90 deletions(-)

