From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:47 -0700
Message-ID: <20191029211351.13243-26-keescook@chromium.org>
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
	bh=nZLC3HwluYG760xRkEz4XsZjxuBM0OK6XHxoCJ0YdFk=; b=kyuTJGe9sl0vw/w+fueJo2eMEy
	V+bj8oILE9DMB+fsqGMrlP9zEZmXpTSWxuoenZgsMl1JT2NlYIha3t8vWaX83WLFUdiVl2CYUj7Go
	XnWIXFV/bOBFZwkk/+ZHGhMlG6+ikh9CbQLfUApz5fxcB+aXyDI8Ysz+w907oDzcD2/IUuB7xWrtZ
	3xvs+prBeIDu8olbq5tdILI8pJBoZYlwyKlc29olviIcpPvKCtjv9+xx12qUcjV3xZS5R+9YAcQT7
	5/1Z4L5nKTyisWGi983S+C8JlFf2QUHw4wE5sKY+buR6Bp08Ag2I2Pg08keZz1WjurYD15CbODrX2
	y8RsD0kA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6NYi1SpcPEk1nAcODb6GN96JVcdeHOxwVojV0owHqow=;
 b=dNy1CZ6LVOC5Xwy361W5/FOiLjIeZ1a3UnC8UVfqNFHlsVQ8qbaqjGnKLGJCwZ4kjW
 R9OofJoUgLk3AYwWdNoTsAeWT8lvKhX3jyPzcDsVrpYn7dDwO7ngiDpQ9N4Jp5AybLbF
 IvOGqmpRh0nWfHe5uyqSfrp6ttnHKPg3vSxs8=
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
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index bdbd7c4056c1..0043d5858f14 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -14,6 +14,8 @@
  * Joe Taylor <joe@tensilica.com, joetylr@yahoo.com>
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -130,7 +132,6 @@ SECTIONS
 
   .fixup   : { *(.fixup) }
 
-  EXCEPTION_TABLE(16)
   /* Data section */
 
   _sdata = .;
-- 
2.17.1
