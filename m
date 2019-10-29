From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 16/29] x86: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:38 -0700
Message-ID: <20191029211351.13243-17-keescook@chromium.org>
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
	bh=wI6DcODXcog0rHPfEA/Eo0qNwMDFBV5X2a58BUYMqcY=; b=FiJ5GAHc3q326LB6jlNDP9c+TU
	xwtTPYFYLd4DIqc22i/T363mEeS88BoMtYn6hMwF/+k7Al47JICL553wyTTi+Y8awmYvRbe4o557v
	QIEdfFNrbUfTwt68v/1ec2wa8jX9bctjH0xX/KX7El0FJ8x8+ft/vkrrm5TDDePD8hYFfhcNftYX1
	iNELly+6jptLSTeeTpUamYT20slQAR6xJlxhsFycvVe5KnzRdUPrlUst9ItOQt5+ftFpGUYIC4bOG
	kjNyhy9jCluNA3Q0FlLgMnvovRe/67vp6SfCKB1TclMI6i6425w7zCOfJZ7Cj+64hIcRrWVpk7MOy
	1QJh1sFA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aFfN5juCtHu18am/Lscu0/nkwdENrYqqL+l/G+SE/2I=;
 b=BLxlII5rDGoHmuigiKEk7antvAdvT/j3giLp5TnKagC9nulTOKvHicMJhgLTJ+AKjt
 LLFa576ZnM7bbaXQ2jb97Idx+ncHmLJpJMLmr4o4toROhc1fZICnCkh73tOmvHe/0Lk5
 zMTVw0I0Iv5ESqJhCqUkt09+m+oXMu/pMXKQI=
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

The exception table was needlessly marked executable. In preparation
for execute-only memory, move the table into the RO_DATA segment via
the new macro that can be used by any architectures that want to make
a similar consolidation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a1a758e25b2b..b06d6e1188de 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -22,6 +22,7 @@
 #endif
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
@@ -145,8 +146,6 @@ SECTIONS
 #endif
 	} :text = 0x9090
 
-	EXCEPTION_TABLE(16)
-
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1
