From: Edward Humes <aurxenon@lunos.org>
Subject: [PATCH] alpha: fix R_ALPHA_LITERAL reloc for large modules
Date: Sat, 27 Aug 2022 02:49:39 -0400
Message-ID: <20220827064939.461790-1-aurxenon@lunos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lunos.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=sgDOOatof3X2oIuMz8I1+gDbeFzYNyzibUS1dRt2DSc=;
        b=bcsicaY8pXlNaayCCVnZslTWbAp22NSagtOxPIXIQf5rfZm/Qc+lzUaoy4cqQ6CPsz
         fkNYNlPJjPXW87KHJreIHIvY3dAVtBUWK1m32GJHAWaPvjyzaNgET/k0DGKtQGIUYXFR
         SlCmxhnOZic3n029LN0RxN1Y+/BlXE+AAHqx+FiaRHV32ov2Ol6mA12aT4Gnfb73ocR7
         8WUYsIOhHOA9BHctmTL8HXo89yhvY74GfkgZgD7Deozhwcj/KpbnnVsIIH6qUBhg/HNe
         JWF8CxcpZ01zwOMR0H5gf0ZEndGDc/IHwlOLOv+ba+uaLM1Pv/qHib39CuEVV1Jv4cVl
         AYUg==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: mattst88@gmail.com, ink@jurassic.park.msu.ru, richard.henderson@linaro.org, Edward Humes <aurxenon@lunos.org>

Previously, R_ALPHA_LITERAL relocations would overflow for large kernel
modules.

This was because the Alpha's apply_relocate_add was relying on the kernel's
module loader to have sorted the GOT towards the very end of the module as it
was mapped into memory in order to correctly assign the global pointer. While
this behavior would mostly work fine for small kernel modules, this approach
would overflow on kernel modules with large GOT's since the global pointer
would be very far away from the GOT, and thus, certain entries would be out of
range.

This patch fixes this by instead using the Tru64 behavior of assigning the
global pointer to be 32KB away from the start of the GOT. The change made
in this patch won't work for multi-GOT kernel modules as it makes the
assumption the module only has one GOT located at the beginning of .got,
although for the vast majority kernel modules, this should be fine. Of the
kernel modules that would previously result in a relocation error, none of
them, even modules like nouveau, have even come close to filling up a single
GOT, and they've all worked fine under this patch.

Signed-off-by: Edward Humes <aurxenon@lunos.org>
---
 arch/alpha/kernel/module.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 5b60c248de9e..cbefa5a77384 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -146,10 +146,8 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
 	base = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr;
 	symtab = (Elf64_Sym *)sechdrs[symindex].sh_addr;
 
-	/* The small sections were sorted to the end of the segment.
-	   The following should definitely cover them.  */
-	gp = (u64)me->core_layout.base + me->core_layout.size - 0x8000;
 	got = sechdrs[me->arch.gotsecindex].sh_addr;
+	gp = got + 0x8000;
 
 	for (i = 0; i < n; i++) {
 		unsigned long r_sym = ELF64_R_SYM (rela[i].r_info);
-- 
2.34.1

