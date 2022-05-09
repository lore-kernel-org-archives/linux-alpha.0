From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/3] termbits.h: Further improvements
Date: Mon,  9 May 2022 12:34:43 +0300
Message-ID: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088963; x=1683624963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D/x1ycw0QvCLLhMcVpaUSr9cP6MhaUOF3dS7CsbLTm8=;
 b=HA9dSIJTLeFPxPBHw4+Jf71ReFYZpkfxCuDJL6Qs/pwIN2uV3RiV8AX+
 cWDHBYv5RDFSta0SlVeVcvKqx8vp9D38TDOtYePgDX8tSV78Nu1q8fe1L
 xL2HGgPRwo5ZsUbKsGFWbUcGEJBtOjALhjKkHa7+9uXQDdfqZAgm/Vm+U
 DVVMEPbejtfD0XdrsYBe5HdpP1GGFXU1fNRp9nQ1/NlyfFYukgkWlCVQj
 cqoSRXrf4iN1PaJGzs7TosxqkTNvCaqI0TrDWuRd0ovkf3pOMGufvR2QN
 dL1RjO/el+XMCaN88c8lAUbX+31qHJOhJN/DbdMmTPfybmenBKwIPhJ03 g==;
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

Again, I prefer Greg to take these through his tty tree.

Changes done by this serie:

1) Create termbits-common.h for the most obvious termbits.h intersection.
2) Reformat some lines that remain in termbits.h files.
3) Don't include posix_types.h unnecessarily.

Please do check I got the uapi include things done correctly! That is,
that including using asm-generic/termbits-common.h path is the preferred
approach for a header file that is not supposed to be overridden by the
arch specific header files and that mandatory-y is not required for
termbits-common.h.

Unfortunately I couldn't move also tcflag_t into termbits-common.h due
to the way it is being defined for sparc. However, by the looks of how
the type for tcflag_t is being chosen there, having just unsigned int
might work also for sparc?

Ilpo J=C3=A4rvinen (3):
  termbits.h: create termbits-common.h for identical bits
  termbits.h: Align lines & format
  termbits.h: Remove posix_types.h include

 arch/alpha/include/uapi/asm/termbits.h     | 182 ++++++-----------
 arch/mips/include/uapi/asm/termbits.h      | 209 ++++++++-----------
 arch/parisc/include/uapi/asm/termbits.h    | 131 ++++--------
 arch/powerpc/include/uapi/asm/termbits.h   | 152 +++++---------
 arch/sparc/include/uapi/asm/termbits.h     | 223 ++++++++-------------
 include/uapi/asm-generic/termbits-common.h |  65 ++++++
 include/uapi/asm-generic/termbits.h        | 129 ++++--------
 7 files changed, 418 insertions(+), 673 deletions(-)
 create mode 100644 include/uapi/asm-generic/termbits-common.h

--=20
2.30.2

