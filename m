From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v3] asm-generic: Fix unistd_32.h generation format
Date: Wed, 12 Feb 2020 11:53:29 +0100
Message-ID: <4d32ab4e1fb2edb691d2e1687e8fb303c09fd023.1581504803.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCxaKYylUaTagw0CiACoN5PmGBZhgyb9phU3hhP0tOU=;
        b=cfEHKyCzPVV+G0Ct3fk+e76eZPGNTeImhNiFGDVimPzL4uYn8zjyFG9WyB0koRR2qN
         EwMnN8vjUGQ2wbhjgaIjph2vjfhe8yjFmu9ClTKqCx2OtRi5VsZHinaDNjSlIBmgdAxy
         wxZcB8m80XRXcoyEYhnoHyLx5c4HUKj1j5ketT2WaaEFRPaldEWGCoEuAfq2/3tjkHap
         8wX1V3Fo/iwSy3etqyDyJk14F8tfP9OcXDnIFVgeOxj2H0AcSvMFus1GiH7Bo5SBr38M
         +OGCJMD8zbYUhdsAjqZ8LRFVbVVV0cBL4zfH47rlbg/l3/sDFnDyyciz4KUYMzOvm7Ic
         iHHg==
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com, arnd@arndb.de, akpm@linux-foundation.org
Cc: Stefan Asserhall <stefan.asserhall@xilinx.com>, Max Filippov <jcmvbkbc@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Chris Zankel <chris@zankel.net>, "David S. Miller" <davem@davemloft.net>, Fenghua Yu <fenghua.yu@intel.com>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Burton <paulburton@kernel.org>, Paul Mackerras <paulus@samba.org>, Ralf Baechle <ralf@linux-mips.org>, Rich Felker <dalias@libc.org>, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-alpha@vger.kernel.org, linux-ia64@vger

Generated files are also checked by sparse that's why add newline
to remove sparse (C=1) warning.

The issue was found on Microblaze and reported like this:
./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
warning: no newline at end of file

Mips and PowerPC have it already but let's align with style used by m68k.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com> (xtensa)
---

Changes in v3:
- Add notes about mips/ppc and m68 - Max/Geert

Changes in v2:
- Update also others archs not just microblaze - Arnd
- Align subject and description to match multiarch change

 arch/alpha/kernel/syscalls/syscallhdr.sh      | 2 +-
 arch/ia64/kernel/syscalls/syscallhdr.sh       | 2 +-
 arch/microblaze/kernel/syscalls/syscallhdr.sh | 2 +-
 arch/mips/kernel/syscalls/syscallhdr.sh       | 3 +--
 arch/parisc/kernel/syscalls/syscallhdr.sh     | 2 +-
 arch/powerpc/kernel/syscalls/syscallhdr.sh    | 3 +--
 arch/sh/kernel/syscalls/syscallhdr.sh         | 2 +-
 arch/sparc/kernel/syscalls/syscallhdr.sh      | 2 +-
 arch/xtensa/kernel/syscalls/syscallhdr.sh     | 2 +-
 9 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscallhdr.sh b/arch/alpha/kernel/syscalls/syscallhdr.sh
index e5b99bd2e5e7..1780e861492a 100644
--- a/arch/alpha/kernel/syscalls/syscallhdr.sh
+++ b/arch/alpha/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/ia64/kernel/syscalls/syscallhdr.sh b/arch/ia64/kernel/syscalls/syscallhdr.sh
index 0c2d2c748565..f407b6e53283 100644
--- a/arch/ia64/kernel/syscalls/syscallhdr.sh
+++ b/arch/ia64/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/microblaze/kernel/syscalls/syscallhdr.sh b/arch/microblaze/kernel/syscalls/syscallhdr.sh
index 2e9062a926a3..a914854f8d9f 100644
--- a/arch/microblaze/kernel/syscalls/syscallhdr.sh
+++ b/arch/microblaze/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/mips/kernel/syscalls/syscallhdr.sh b/arch/mips/kernel/syscalls/syscallhdr.sh
index d2bcfa8f4d1a..2e241e713a7d 100644
--- a/arch/mips/kernel/syscalls/syscallhdr.sh
+++ b/arch/mips/kernel/syscalls/syscallhdr.sh
@@ -32,6 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/parisc/kernel/syscalls/syscallhdr.sh b/arch/parisc/kernel/syscalls/syscallhdr.sh
index 50242b747d7c..730db288fe54 100644
--- a/arch/parisc/kernel/syscalls/syscallhdr.sh
+++ b/arch/parisc/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/powerpc/kernel/syscalls/syscallhdr.sh b/arch/powerpc/kernel/syscalls/syscallhdr.sh
index c0a9a32937f1..02d6751f3be3 100644
--- a/arch/powerpc/kernel/syscalls/syscallhdr.sh
+++ b/arch/powerpc/kernel/syscalls/syscallhdr.sh
@@ -32,6 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/sh/kernel/syscalls/syscallhdr.sh b/arch/sh/kernel/syscalls/syscallhdr.sh
index 1de0334e577f..4c0519861e97 100644
--- a/arch/sh/kernel/syscalls/syscallhdr.sh
+++ b/arch/sh/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/sparc/kernel/syscalls/syscallhdr.sh b/arch/sparc/kernel/syscalls/syscallhdr.sh
index 626b5740a9f1..cf50a75cc0bb 100644
--- a/arch/sparc/kernel/syscalls/syscallhdr.sh
+++ b/arch/sparc/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/xtensa/kernel/syscalls/syscallhdr.sh b/arch/xtensa/kernel/syscalls/syscallhdr.sh
index d37db641ca31..eebfb8a8ace6 100644
--- a/arch/xtensa/kernel/syscalls/syscallhdr.sh
+++ b/arch/xtensa/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
-- 
2.25.0

