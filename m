From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 26/29] x86/mm: Remove redundant &s on addresses
Date: Tue, 29 Oct 2019 14:13:48 -0700
Message-ID: <20191029211351.13243-27-keescook@chromium.org>
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
	bh=S+bPBlZoW++2qT9FA+YUDQkcYAzczudO58PkRpXBgXg=; b=CrItsNoIlYGe9qRnpar6wgthpT
	fjhKE6Jc4oO69Omajg8ZsmuL0JzM25wJaBxGUQRindaQ5lABmE3nzu1LFnu4nawtGyfweoZX8OE97
	VvDgOiv9oLnVxjtJAGZODFr84nwF9Z29d/hfLRKNWsNFQ8v5SMWhSFtfKzet8O2EZxnENqIU9sm/D
	SH8FXD1SsLck5zwoohNH31FZLT3O8AK2ETP7JX/P72C3QItOfALYNREHe1VrzlZKhCjj2TnThcPkg
	BN7Jh3O6tkvhR59MEy0GJbKbhBHZbXrX529j7jSaEkwVvQRVo68w4jUYZJTTkgTVV9eWAdjHc4Ygf
	jYlN4Spg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8/x+eaVk+ss1aFRFRC2BuuTBFLP58LLEcIBPNJoL2cs=;
 b=E6/biqz3RgqOQZPzeBNo/5tlnkftQUoW2mf9CE298XsO5001NCPklzzOKT7E9Bm3jX
 WYxXOa5pUZ578xzGENT4FOXN1yp+4ICP9ASH5NBrudMTG4WbEhivqJqu8m13wiyzO8yL
 cP3ipZ2zK8zGQCNcxdhBWtwypbIJDVwNy8VIA=
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

The &s on addresses are redundant. Remove them to match all the other
similar functions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/init_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 26299e9ce6da..e67ddca8b7a8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1300,9 +1300,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
-	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&_etext);
-	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
+	unsigned long end = (unsigned long)__end_rodata_hpage_align;
+	unsigned long text_end = PFN_ALIGN(_etext);
+	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-- 
2.17.1
