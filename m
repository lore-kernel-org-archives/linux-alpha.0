From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 21/29] ia64: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:43 -0700
Message-ID: <20191029211351.13243-22-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J7q5MXenfhesd6CF0Ps9Yk46KNvn7XBw4hgmBQaWR0g=; b=gGEsnIkWJ9I4M8Dg7uw+XoJH5h
	mN3g3M3k1uNxc3taBo8j3Ej1nMwM7G89io9Pr0iwKkG443T/oiVufSCtY025IFYy65nu/TUTIX/DH
	8LlcUP8MG6WoNRT50KolzBj7z4ZwhNEsqXNx8aS9v7p83vPmIIBozIb/wZXUZDJFlB/4uUyYkCXhn
	pMeC2JUzg9PnUoXqg2d/kGu27uNFMltgpwe7JKh9Pdzx1IS7Vbk5pSHKi5wnG8vBN2xF3ebAZ2iI7
	D3U1Q6MRCkm5+im86xShWQOUVqSCgTYxeZQC/tg44IYGB7NRy88HeDRPQgRnucarsZpxgxKY6o/5Z
	5u0r+8Bg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BONbSwO3yUZE8RnSGxOUsa1O5SfUej1bEo+UUtcRz+8=;
 b=Oul5joLmyxQTlWFJ6A+hcl/iw8HGyCj6DCkGeyjgSJdywZcIXcCkpDkg/j5crt4EDF
 bhYDAsbHELzhL0Rn6NEATnn7EYUCy83UJjn7yKHmtUT0TnhtwYnlsa6tIjmvmGJHa6km
 Wea7MJXRJYBJmpaXEbKQvVL7Q/hNvQrtuzUmo=
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Dave Hansen <dave.hansen@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/ia64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 11d5115bc44d..1ec6b703c5b4 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -6,6 +6,7 @@
 #include <asm/thread_info.h>
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -70,7 +71,6 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	EXCEPTION_TABLE(16)
 
 	/* MCA table */
 	. = ALIGN(16);
-- 
2.17.1
