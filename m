From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 23/29] parisc: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:45 -0700
Message-ID: <20191029211351.13243-24-keescook@chromium.org>
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
	bh=KUinusBQ6roiGZosJiJt5qzjYhh+inxjg0e7cCDmrjw=; b=vB6GWyno6HOBBreoAxEeaEXATd
	A8NVQp3sccCSVPRPgEDkYIFvoO7+LMOlWvu5YZUsSUbjDQTM+W+Bbb0HKd6gl0ZqL+zebitr1JLHO
	26psA7isfwv70Mz6ijhjtFOZk+BhyjsgjW9b6NTWxW6ktcYMz40JKZhBhM4IimQ5YtqEWFYzTMdF2
	1umccHwz9ZjjA9+6UILopaATKMI4FFVJRbJmGzONFjUz7Yj2xsHUt7844R/HBxvn5tS3911dzCjTu
	wHt4M0afTXi12T2pfgdFtmdrbuCN12qTApwTI79C9QU3gOrUpC1rPgP8TMPzxe2e6zjSlrGAaLEF5
	H/LMRVVg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k/Yn81zcF5guunRscdaPnRGMjDCCToSR8PmADiJbxp0=;
 b=FVaO6aO8ILysBPp4TcG6DRYTfhP64yNYK1NJln6frp9324XMFNpgsYZUbnEC1/BcNI
 d3y6HNjxwiZHSQPSgHJiVtceb3/6J9fduGv+Jcn399jZBSVy0f+CKF1R0ijDo77jPqTY
 64QP9FbsaOR6pmLh7yAYTYiylPerHQmxnysFQ=
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
Acked-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/vmlinux.lds.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 12b3d7d5e9e4..53e29d88f99c 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -19,6 +19,7 @@
 				*(.data..vm0.pte)
 
 #define CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define RO_EXCEPTION_TABLE_ALIGN	8
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -129,9 +130,6 @@ SECTIONS
 
 	RO_DATA(8)
 
-	/* RO because of BUILDTIME_EXTABLE_SORT */
-	EXCEPTION_TABLE(8)
-
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
-- 
2.17.1
