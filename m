From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/27] x86/build: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:45 +0900
Message-ID: <20210128005110.2613902-4-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wgWk0k4Nkv2lZ5fVldf8xYKP72pDx2g3bwWe8k+t+ac=; b=LZ/aqP9JMixbv/fdNaN7U7Qyj
	XP8xNF2Fmg88pu7GG4/rhTyQNnUGJMNLIASofn9R29I9hYgUJtvZl6lTNDWWreUr0zTOTT5MGCKBr
	FqW/N+jSjJDXtmQBt8qca9h3ZHLRj26KAhNnHwLQqxxxiRDq7IIlha4EN7D++axzuKEIVhZtEv7PS
	uezljPkwJD54xMH5eONgaJZK6kXdmy0V7iwh2nBJavrZej/7B/kZoeg7alAYdKWTyRJ4br4ZYjYol
	zKFS3FMuX0j1bVtUWLDCbBPfDvVQE7CjZbc37YcnTKLRETRd3tqApGdyq8FdPEp/59t6eaflJFJ5f
	zqemFUNQA==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIY024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795110;
 bh=d+/7doZEOPv1GMwh0J3MdPuks+/gdDt09tnPkcOGE80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHgoABCG/DLtFuPlboUdmsid9QOFdwj4Tf4PGzheip0c70k1znW9rHwDaVAm1ON9c
 MqujfDDvycEhQUC7c4A6EAS6XcIAN+RsPgZg5X4iVdsdNl9Ijhku5W1E2IB3RHnIHf
 PVi5uaMIr3ScOj/K206H/yZuaQRofL0r01hroLHoZkOIAH7k8bCVjqex4M7jHFsd7w
 33gPNSjwYmhXY9xmRZGWkWTY/bJWhubfFR5maBIJRAqhuDUIE8dR/O5ZmuTYZ6lCHz
 KufvyYi7nnMRU/ql91EaeR5YhQwmGuzj1a6eX+DwdGUvtDgwlx3gy7/iWUC78zcslY
 Ti9bulEqhkoFA==
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: linux-arch@vger.kernel.org, x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

The rules in this Makefile cannot detect the command line change because
the prerequisite 'FORCE' is missing.

Adding 'FORCE' will result in the headers being rebuilt every time
because the 'targets' addition is also wrong; the file paths in
'targets' must be relative to the current Makefile.

Fix all of them so the if_changed rules work correctly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/entry/syscalls/Makefile | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index 6fb9b57ed5ba..e1c7ddb7546b 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -24,34 +24,34 @@ quiet_cmd_hypercalls = HYPERCALLS $@
       cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$^)
 
 syshdr_abi_unistd_32 := i386
-$(uapi)/unistd_32.h: $(syscall32) $(syshdr)
+$(uapi)/unistd_32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_32_ia32 := i386
 syshdr_pfx_unistd_32_ia32 := ia32_
-$(out)/unistd_32_ia32.h: $(syscall32) $(syshdr)
+$(out)/unistd_32_ia32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_x32 := common,x32
 syshdr_offset_unistd_x32 := __X32_SYSCALL_BIT
-$(uapi)/unistd_x32.h: $(syscall64) $(syshdr)
+$(uapi)/unistd_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_64 := common,64
-$(uapi)/unistd_64.h: $(syscall64) $(syshdr)
+$(uapi)/unistd_64.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_64_x32 := x32
 syshdr_pfx_unistd_64_x32 := x32_
-$(out)/unistd_64_x32.h: $(syscall64) $(syshdr)
+$(out)/unistd_64_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/syscalls_32.h: $(syscall32) $(systbl)
+$(out)/syscalls_32.h: $(syscall32) $(systbl) FORCE
 	$(call if_changed,systbl)
-$(out)/syscalls_64.h: $(syscall64) $(systbl)
+$(out)/syscalls_64.h: $(syscall64) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh
+$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh FORCE
 	$(call if_changed,hypercalls)
 
 $(out)/xen-hypercalls.h: $(srctree)/include/xen/interface/xen*.h
@@ -62,9 +62,10 @@ syshdr-$(CONFIG_X86_64)		+= unistd_32_ia32.h unistd_64_x32.h
 syshdr-$(CONFIG_X86_64)		+= syscalls_64.h
 syshdr-$(CONFIG_XEN)		+= xen-hypercalls.h
 
-targets	+= $(uapisyshdr-y) $(syshdr-y)
+uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
+syshdr-y	:= $(addprefix $(out)/, $(syshdr-y))
+targets		+= $(addprefix ../../../../, $(uapisyshdr-y) $(syshdr-y))
 
 PHONY += all
-all: $(addprefix $(uapi)/,$(uapisyshdr-y))
-all: $(addprefix $(out)/,$(syshdr-y))
+all: $(uapisyshdr-y) $(syshdr-y)
 	@:
-- 
2.27.0
