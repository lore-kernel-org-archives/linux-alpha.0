From: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: [PATCH] alpha: kmalloc failure ignored in process_reloc_for_got()
Date: Fri, 18 Sep 2009 23:14:01 +0200
Message-ID: <4AB3F819.5020709@gmail.com>
References: <4AA6EB5A.5090309@gmail.com> <20090909151848.45db437f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KTpuz8qv1g/kD0K3ceMdoRVcm2+Jpk77APDRS8a7pIc=;
        b=mcXwDIZetzGaokuP+0c3uIUKI/nAutG7uAD8up5jhw1aaNJ3xGfYjm+xpZUUL/Buvq
         2YfCDbOtg4I2jeIv4EXLrt176+EkMPDfM2KOAqwRtwMFAocfvpmSQJT4K3KEVOF18ZVl
         PKRvX0YrwTHUywKGRM+JDeLdIheAAJfEwVmHU=
In-Reply-To: <20090909151848.45db437f.akpm@linux-foundation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rth@twiddle.net, linux-alpha@vger.kernel.org

Prevent NULL dereference if kmalloc() fails.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
> we should handle this failure properly - back out, clean
> everything up, return -ENOMEM to userspace

Is this better? I have to admit I didn't build test it,
I may be able to do that later.

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index ebc3c89..5132d98 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -51,7 +51,7 @@ struct got_entry {
 	int got_offset;
 };
 
-static inline void
+static inline int
 process_reloc_for_got(Elf64_Rela *rela,
 		      struct got_entry *chains, Elf64_Xword *poffset)
 {
@@ -61,7 +61,7 @@ process_reloc_for_got(Elf64_Rela *rela,
 	struct got_entry *g;
 
 	if (r_type != R_ALPHA_LITERAL)
-		return;
+		return 0;
 
 	for (g = chains + r_sym; g ; g = g->next)
 		if (g->r_addend == r_addend) {
@@ -73,6 +73,8 @@ process_reloc_for_got(Elf64_Rela *rela,
 		}
 
 	g = kmalloc (sizeof (*g), GFP_KERNEL);
+	if (g == NULL)
+		return -ENOMEM;
 	g->next = chains[r_sym].next;
 	g->r_addend = r_addend;
 	g->got_offset = *poffset;
@@ -84,6 +86,7 @@ process_reloc_for_got(Elf64_Rela *rela,
 	   42 valid relocation types, and a 32-bit field.  Co-opt the
 	   bits above 256 to store the got offset for this reloc.  */
 	rela->r_info |= g->got_offset << 8;
+	return 0;
 }
 
 int
@@ -94,6 +97,7 @@ module_frob_arch_sections(Elf64_Ehdr *hdr, Elf64_Shdr *sechdrs,
 	Elf64_Rela *rela;
 	Elf64_Shdr *esechdrs, *symtab, *s, *got;
 	unsigned long nsyms, nrela, i;
+	int ret = 0;
 
 	esechdrs = sechdrs + hdr->e_shnum;
 	symtab = got = NULL;
@@ -137,9 +141,12 @@ module_frob_arch_sections(Elf64_Ehdr *hdr, Elf64_Shdr *sechdrs,
 		if (s->sh_type == SHT_RELA) {
 			nrela = s->sh_size / sizeof(Elf64_Rela);
 			rela = (void *)hdr + s->sh_offset;
-			for (i = 0; i < nrela; ++i)
-				process_reloc_for_got(rela+i, chains,
+			for (i = 0; i < nrela; ++i) {
+				ret = process_reloc_for_got(rela+i, chains,
 						      &got->sh_size);
+				if (ret != 0)
+					goto out;
+			}
 		}
 
 	/* Free the memory we allocated.  */
@@ -150,9 +157,10 @@ module_frob_arch_sections(Elf64_Ehdr *hdr, Elf64_Shdr *sechdrs,
 			kfree(g);
 		}
 	}
+out:
 	kfree(chains);
 
-	return 0;
+	return ret;
 }
 
 int
