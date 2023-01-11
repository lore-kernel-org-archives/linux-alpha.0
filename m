From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] alpha/boot/tools/objstrip: fix the check for ELF header
Date: Wed, 11 Jan 2023 20:43:59 +0000
Message-ID: <Y78fj4jXf5MtLU75@ZenIV>
References: <Y78fXnVzitfpX1Tm@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8tRf9V7rx+PjAhpSXrbCvyrfpVCDE16dk/zcrYVGCP8=; b=cBFzir3qWNVTmJ76ZxUDd+sPYf
        HVdYzCT4oClwjAejek3Xa2x820DtvOfUkPrbWRGILQPId1Kl9j5gg6mJJ290swGwIZdu5a51t9gVO
        CClyGp4N26rA2nHXv3dlPtVeYijMdxpTQAfALJwlQ6AfL2mExb91zAvA70KUEMN3UVHJGwDA9Hc5E
        TkdDVwU/1QFxy3ZWNENA8zVZaUCCLfx+fPXux6LUZvQdYFDtRMLOpINXzXMC/W7Nej+c0L0V5+2uC
        SREn1yQ5HmC1/uHGSXbOB6LuGzifBkiP+i13qvJOS+V44DXt73Oior3YSkJCxCLALRYc3oTMEpoZo
        6pCztRug==;
Content-Disposition: inline
In-Reply-To: <Y78fXnVzitfpX1Tm@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Just memcmp() with ELFMAG - that's the normal way to do it in userland
code, which that thing is.  Besides, that has the benefit of actually
building - str_has_prefix() is *NOT* present in <string.h>.

Fixes: 5f14596e55de "alpha: Replace strncmp with str_has_prefix"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/tools/objstrip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 08b430d25a31..7cf92d172dce 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -148,7 +148,7 @@ main (int argc, char *argv[])
 #ifdef __ELF__
     elf = (struct elfhdr *) buf;
 
-    if (elf->e_ident[0] == 0x7f && str_has_prefix((char *)elf->e_ident + 1, "ELF")) {
+    if (memcmp(&elf->e_ident[EI_MAG0], ELFMAG, SELFMAG) == 0) {
 	if (elf->e_type != ET_EXEC) {
 	    fprintf(stderr, "%s: %s is not an ELF executable\n",
 		    prog_name, inname);
-- 
2.30.2

