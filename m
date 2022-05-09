From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 3/3] termbits.h: Remove posix_types.h include
Date: Mon,  9 May 2022 12:34:46 +0300
Message-ID: <20220509093446.6677-4-ilpo.jarvinen@linux.intel.com>
References: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088983; x=1683624983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JULdTGBTfThIZcRLutbTwErm+tkVZJR7XHUyFQtfHus=;
 b=fGFmP3bWFW6EF9qQxec9A7BdEmbeoJOFonypeJl/d3x+ATXBmaV3qHd8
 1MV19RZbDW6m3maYdtdmROp78qb2sqffWMD4MdsukiXmxG/xOMmZa28j7
 pU7vRgFb9QeHWVQ1LCCbnsP/J7SBieVFYvA/QtfB/2A9f5z8V6H95MFbx
 l767yFj2NYSYNU1QL7FXfntpYKs9rnGwgHYjmZ8j2PVDobt9dB1W6YPQh
 k81MVw/D+W3hpe4wsfeclxQ9VLYsGS3qjFxxwnED6/GAv17dRpEfsmt4I
 M7aQVPAG91sTvCmbJOSTZZT9zXOo8GOgQe0aJC4MHdyFVNjCf3SWM1TNf Q==;
In-Reply-To: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

Nothing in termbits seems to require anything from linux/posix_types.h.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/include/uapi/asm/termbits.h  | 2 --
 arch/mips/include/uapi/asm/termbits.h   | 2 --
 arch/parisc/include/uapi/asm/termbits.h | 2 --
 arch/sparc/include/uapi/asm/termbits.h  | 2 --
 include/uapi/asm-generic/termbits.h     | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/ua=
pi/asm/termbits.h
index 735e9ffe2795..f1290b22072b 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef _ALPHA_TERMBITS_H
 #define _ALPHA_TERMBITS_H
=20
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
=20
 typedef unsigned int	tcflag_t;
diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi=
/asm/termbits.h
index 8fa3e79d4f94..1eb60903d6f0 100644
--- a/arch/mips/include/uapi/asm/termbits.h
+++ b/arch/mips/include/uapi/asm/termbits.h
@@ -11,8 +11,6 @@
 #ifndef _ASM_TERMBITS_H
 #define _ASM_TERMBITS_H
=20
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
=20
 typedef unsigned int	tcflag_t;
diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/=
uapi/asm/termbits.h
index d72c5ebf3a3a..3a8938d26fb4 100644
--- a/arch/parisc/include/uapi/asm/termbits.h
+++ b/arch/parisc/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef __ARCH_PARISC_TERMBITS_H__
 #define __ARCH_PARISC_TERMBITS_H__
=20
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
=20
 typedef unsigned int	tcflag_t;
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/ua=
pi/asm/termbits.h
index cfcc4e07ce51..4321322701fc 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef _UAPI_SPARC_TERMBITS_H
 #define _UAPI_SPARC_TERMBITS_H
=20
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
=20
 #if defined(__sparc__) && defined(__arch64__)
diff --git a/include/uapi/asm-generic/termbits.h b/include/uapi/asm-generic=
/termbits.h
index c92179563289..890ef29053e2 100644
--- a/include/uapi/asm-generic/termbits.h
+++ b/include/uapi/asm-generic/termbits.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_GENERIC_TERMBITS_H
 #define __ASM_GENERIC_TERMBITS_H
=20
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
=20
 typedef unsigned int	tcflag_t;
--=20
2.30.2

