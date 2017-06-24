From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: support R_ALPHA_REFLONG relocations for module loading
Date: Sat, 24 Jun 2017 13:37:02 +1200
Message-ID: <20170624013702.18225-1-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>

Since commit 71810db27c1c853b33 (modversions: treat symbol CRCs
as 32 bit quantities) R_ALPHA_REFLONG relocations can be required
to load modules. This implements it.

Tested-by: Bob Tracy <rct@gherkin.frus.com>
Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/kernel/module.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 936bc8f89a67..47632fa8c24e 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -181,6 +181,9 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
 		switch (r_type) {
 		case R_ALPHA_NONE:
 			break;
+		case R_ALPHA_REFLONG:
+			*(u32 *)location = value;
+			break;
 		case R_ALPHA_REFQUAD:
 			/* BUG() can produce misaligned relocations. */
 			((u32 *)location)[0] = value;
-- 
2.11.0

