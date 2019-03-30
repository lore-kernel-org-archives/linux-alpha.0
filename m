From: George Spelvin <lkml@sdf.org>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc,
 and alpha?
Date: Sat, 30 Mar 2019 13:00:17 GMT
Message-ID: <201903301300.x2UD0H0C020934@sdf.org>
References: <201903291307.x2TD772v013534@sdf.org>,
 <20190330084346.GA3801@osiris>,
 <201903301030.x2UAUNOg026448@sdf.org>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <201903301030.x2UAUNOg026448@sdf.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: heiko.carstens@de.ibm.com, lkml@sdf.org
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org

I've been tracking down when "umulditi3" support was added to various
gcc platforms.  So far, I've found:

ia64: 2005-07-28, gcc 4.1.0
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=102463

mips: 2008-06-09, gcc 4.4.0
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=136600 

alpha: 2013-02-01, gcc 4.8.0
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=195668

s390: 2011-10-07, gcc 4.7.0
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=179647

ppc64: 2013-02-01, gcc 4.8.0
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=195667


Here's a revised s390 patch.

From e8ea8c0a5d618385049248649b8c13717b598a42 Mon Sep 17 00:00:00 2001
From: George Spelvin <lkml@sdf.org>
Date: Sat, 30 Mar 2019 10:27:14 +0000
Subject: [PATCH v2] s390: Enable CONFIG_ARCH_SUPPORTS_INT128 on 64-bit builds

If a platform supports a 64x64->128-bit widening multiply,
that allows more efficient scaling of 64-bit values in various
parts of the kernel.  GCC advertises __int128 support with the
__INT128__ #define, but we care about efficient inline
support, so this is a separate flag.

For s390, that was added on 2011-10-07 by
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=179647
which is part of GCC 4.7.

Signed-off-by: George Spelvin <lkml@sdf.org>
---
 arch/s390/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ed554b09eb3f..6ddaee6573f4 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -372,6 +372,7 @@ endchoice
 
 config 64BIT
 	def_bool y
+	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 40700 || CC_IS_CLANG
 
 config COMPAT
 	def_bool y
-- 
2.20.1

