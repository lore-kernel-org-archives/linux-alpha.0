From: George Spelvin <lkml@sdf.org>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc,
 and alpha?
Date: Sat, 30 Mar 2019 10:30:23 GMT
Message-ID: <201903301030.x2UAUNOg026448@sdf.org>
References: <201903291307.x2TD772v013534@sdf.org>,
 <20190330084346.GA3801@osiris>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20190330084346.GA3801@osiris>
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

On Sat, 30 Mar 2019 at 09:43:47 +0100, Heiko Carstens wrote:
> It hasn't been enabled on s390 simply because at least I wasn't aware
> of this config option. Feel free to send a patch, otherwise I will
> enable this. Whatever you prefer.
> 
> Thanks for pointing this out!

Here's a draft patch, but obviously it should be tested!

From 6f3cc608c49dba33a38e81232a2fd46e8fa8dbcd Mon Sep 17 00:00:00 2001
From: George Spelvin <lkml@sdf.org>
Date: Sat, 30 Mar 2019 10:27:14 +0000
Subject: [PATCH] s390: Enable CONFIG_ARCH_SUPPORTS_INT128 on 64-bit builds

If a platform supports a 64x64->128-bit widening multiply,
that allows more efficient scaling of 64-bit values in various
parts of the kernel.  GCC advertises __int128 support with the
__INT128__ #define, but we care about efficient inline
support, so this is a separate flag.

For s390, that was added on 24 March 2017 by
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=246457
which is part of GCC 7.

It also only applies to TARGET_ARCH12, which I am guessing
corresponds to HAVE_MARCH_ZEC12_FEATURES.  clang support is
pure guesswork.

Signed-off-by: George Spelvin <lkml@sdf.org>
---
 arch/s390/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ed554b09eb3f..43e6dc677f7d 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -372,6 +372,7 @@ endchoice
 
 config 64BIT
 	def_bool y
+	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 70000 && HAVE_MARCH_ZEC12_FEATURES || CC_IS_CLANG
 
 config COMPAT
 	def_bool y
-- 
2.20.1

