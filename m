From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [PATCH v2 0/3] various strscpy fixes
Date: Tue, 6 Oct 2015 15:23:46 -0400
Message-ID: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Metcalf <cmetcalf@ezchip.com>

This patch series fixes up a couple of architecture issues where
strscpy wasn't configured correctly (missing on h8300, duplicating
local and asm-generic copies on powerpc and tile).

It also adds a use of zero_bytemask() to the final store for
strscpy to avoid writing uninitialized data to the destination.
However, to make this work we had to add support for zero_bytemask()
to the two architectures that didn't have it (alpha and tile),
because they were providing their own local copies, but didn't
provide the zero_bytemask() that was previously only required
when building with CONFIG_DCACHE_WORD_ACCESS.

The series can be pulled from:

  git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git strscpy

Chris Metcalf (3):
  word-at-a-time.h: fix some Kbuild files
  word-at-a-time.h: support zero_bytemask() on alpha and tile
  strscpy: zero any trailing garbage bytes in the destination

 arch/alpha/include/asm/word-at-a-time.h | 2 ++
 arch/h8300/include/asm/Kbuild           | 1 +
 arch/powerpc/include/asm/Kbuild         | 1 -
 arch/tile/include/asm/Kbuild            | 1 -
 arch/tile/include/asm/word-at-a-time.h  | 8 +++++++-
 lib/string.c                            | 3 ++-
 6 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.1.2
