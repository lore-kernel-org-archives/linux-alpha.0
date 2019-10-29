From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 04/29] alpha: Rename PT_LOAD identifier "kernel" to "text"
Date: Tue, 29 Oct 2019 14:13:26 -0700
Message-ID: <20191029211351.13243-5-keescook@chromium.org>
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
	bh=kF99M32f5ai8H6vNoNsfnkrybMiBNCtES5cP7r9/HMg=; b=cBr9X1l5qvom2cyMoUifZ36S1d
	EvB+LM682XOhsSBBYr0UBn0MO1NDOizVtfKez+0hbY/nNLvunV93/91KztoKTfKGZzKzlM8D/0o0m
	yCbj2gRaUc/TlH+xlieGCUv8SblsmGLrxCZ+pD3WMPvDeLP0Ks4ckU1UO2FIvfHkq426aYovcsAYM
	RcjcuxgXzxHYFRJRQRzi+/nB/pcI/EjdHWODxMckLKQ9AtWi0//Zvx9GpCmGwGdi4ybM1mlNttKrv
	UQpTTNUPRwy5eEghEIKbs0rLNss830O5LHqPa5i8plMLp3Bsh7w5qqkj9TnAFfrXQFsIfjVqZtqKG
	HE/OaIAQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7MxClQbH59XRrbTRajW1Gh8uACzcU2+htsVcXyM7D1g=;
 b=LQy1OlzqoHregmX7oWg1J+GCiPB+DnhcNeAFzNXO6O9s9wLhpCBsF0jSKzXlK9lP/k
 SDnj0o9+xZ39dyE9cCQWqZxyjuoHNyl3rdCu/xiTRCFpDNUVVX7tFk5VZETqdUPMammV
 NH8kU7Tb11dukK+QDn0fvxLsZMYk5M8Ahi8aU=
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

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "kernel" to
"text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index c4b5ceceab52..781090cacc96 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -8,7 +8,7 @@
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
 ENTRY(__start)
-PHDRS { kernel PT_LOAD; note PT_NOTE; }
+PHDRS { text PT_LOAD; note PT_NOTE; }
 jiffies = jiffies_64;
 SECTIONS
 {
@@ -27,14 +27,14 @@ SECTIONS
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
-	} :kernel
+	} :text
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :kernel :note
+	NOTES :text :note
 	.dummy : {
 		*(.dummy)
-	} :kernel
+	} :text
 
 	RODATA
 	EXCEPTION_TABLE(16)
-- 
2.17.1
