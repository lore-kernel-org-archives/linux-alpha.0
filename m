From: AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [PATCH v2 0/1] audit: Add CONFIG_HAVE_ARCH_AUDITSYSCALL
Date: Tue, 25 Feb 2014 18:16:23 +0900
Message-ID: <1393319784-2758-1-git-send-email-takahiro.akashi@linaro.org>
References: <1391407232-4623-1-git-send-email-takahiro.akashi@linaro.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1391407232-4623-1-git-send-email-takahiro.akashi@linaro.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, eparis@redhat.com, rgb@redhat.com, arndb@arndb.de
Cc: catalin.marinas@arm.com, will.deacon@arm.com, dsaxena@linaro.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net, AKASHI Takahiro <takahiro.akashi@linaro.org>

Currently AUDITSYSCALL has a long list of architecture depencency:
       depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML ||
                SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT) || ALPHA)
The purpose of this patch is to replace it with HAVE_ARCH_AUDITSYSCALL
for simplicity.

Changes v1 -> v2:
* rebased to 3.14-rcX, and so added a change on ALPHA

AKASHI Takahiro (1):
  audit: Add CONFIG_HAVE_ARCH_AUDITSYSCALL

 arch/alpha/Kconfig     |    1 +
 arch/arm/Kconfig       |    1 +
 arch/ia64/Kconfig      |    1 +
 arch/parisc/Kconfig    |    1 +
 arch/powerpc/Kconfig   |    1 +
 arch/s390/Kconfig      |    1 +
 arch/sh/Kconfig        |    1 +
 arch/sparc/Kconfig     |    1 +
 arch/um/Kconfig.common |    1 +
 arch/x86/Kconfig       |    1 +
 init/Kconfig           |    5 ++++-
 11 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.7.9.5

