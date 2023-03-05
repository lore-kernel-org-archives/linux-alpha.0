From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 4/7] alpha: fix R_ALPHA_LITERAL reloc for large modules
Date: Sun,  5 Mar 2023 08:54:45 -0500
Message-ID: <20230305135449.1794083-4-sashal@kernel.org>
References: <20230305135449.1794083-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678024501;
        bh=uK+ef2YNaL/8nHoWhWxVzFQp5/xsZI26cmKsOwW7KEc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yj7JEtF38ZCtqTgx3S2moTlfrP4/zPZN4QLocGMec4npr5JPp8+SX7LHEzyhhsODl
         QRvhOKBq6G+8EIuEamM+eTzo6yD6Ogmq2AWyXzp3LMvzfje4k+mawvxYAvAasAfgmt
         dwKE0FAMPMUBbTDA/keCv7WrugI5NNvAK6QcVGmUTVm9mh8GPutCiCA8c51S6czkqH
         q9xGwNHN7oaE9nxjt6xCxhXUJcm8vJBOr4KkKjjpErfDxi7GiSLu+UvF1up8+zzMWW
         KUZ0dysYbBIGVp8u25CMWryoi26801goyNTSqofVJklWG4Pp6QH+l9V0QH7gYrhdKm
         +R6DdC56F0Yzw==
In-Reply-To: <20230305135449.1794083-1-sashal@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Edward Humes <aurxenon@lunos.org>, Matt Turner <mattst88@gmail.com>, Sasha Levin <sashal@kernel.org>, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org

From: Edward Humes <aurxenon@lunos.org>

[ Upstream commit b6b17a8b3ecd878d98d5472a9023ede9e669ca72 ]

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
Signed-off-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/kernel/module.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index ac110ae8f9780..b19a8aae74e1f 100644
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
2.39.2

