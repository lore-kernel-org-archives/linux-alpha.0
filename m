From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/27] parisc: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:59 +0900
Message-ID: <20210128005110.2613902-18-masahiroy@kernel.org>
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
	 bh=A1EZ9iyVLs9SNT3ui+gM96QoyqMDUQbl58fCa5D/v7g=; b=PWb2JdvffvJfeOm/wCzNLI/XN
	HkigEi2MbVRWdwGYrUYwG1WhUDGyzYBo2LOQnioA9qc+7BBiNjqSk/gZUzInMeaQ9jmbJbdZd9sS7
	I+38H4YrTyMnngpdl63gwSQONTycqwLAlugxCKtZAQrHBWGTQTWG4e7WcP/0Gjw7yVnSICQ2pADmB
	Va6wlkmlGafaQbYE+lidcuwpfbwr7LdVGhXLA4FfFzOKHDhjMBEEHbjFM9XVh/aa0nk5miumfyX5B
	rhiMSaoyXU/4+hUkKzYGMp4nknoCNj5OWhEHw6NbDRixKZ7vdQh3ukurJz1YdvvpBegvjSyVYmf8Q
	Ot5y5tYuw==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIm024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795128;
 bh=wgcDkGkr+fADFw2acutcJVav26gpalK1ucrzuPe9fvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0AvOpll9V5c4Wf1O6fqeg3J7C9F3lt+q7XKBF2KkSBs6k2Ilf/U2wJeNmLrwDxKUo
 WLJbdWdGaZtbeckWqkDZOFXOwWNqe/4V8KHT39AYVDSQNMIIRWdYZJhxJE3qzyL4ay
 ru/SQXe0kblt9+P2dTAQW5kNEK8b6Jzev+i3eqP1I5M9QKYljmLjYmdT8P04VgWlJD
 ZBuJBy1+tvrRETQ9PuRnRBD+/lTlarj/RgGeaHcoi2z9Mou4Gjihr0pErICkYgVzpk
 orLr65FqhO7iQMz+CUztP0jFaQM2jdaGkA6G9n92NU3FBYzG/a8DpS9CXn3llIKHFP
 5Jfif5BQVNUtw==
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

 arch/parisc/kernel/syscalls/Makefile | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
index c22a21c39f30..556fe30a6c8f 100644
--- a/arch/parisc/kernel/syscalls/Makefile
+++ b/arch/parisc/kernel/syscalls/Makefile
@@ -22,24 +22,24 @@ quiet_cmd_systbl = SYSTBL  $@
 		   '$(systbl_offset_$(basetarget))'
 
 syshdr_abis_unistd_32 := common,32
-$(uapi)/unistd_32.h: $(syscall) $(syshdr)
+$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abis_unistd_64 := common,64
-$(uapi)/unistd_64.h: $(syscall) $(syshdr)
+$(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 systbl_abis_syscall_table_32 := common,32
-$(kapi)/syscall_table_32.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abis_syscall_table_64 := common,64
-$(kapi)/syscall_table_64.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abis_syscall_table_c32 := common,32
 systbl_abi_syscall_table_c32 := c32
-$(kapi)/syscall_table_c32.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_32.h unistd_64.h
@@ -47,9 +47,10 @@ kapisyshdr-y		+= syscall_table_32.h		\
 			   syscall_table_64.h		\
 			   syscall_table_c32.h
 
-targets	+= $(uapisyshdr-y) $(kapisyshdr-y)
+uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
+kapisyshdr-y	:= $(addprefix $(kapi)/, $(kapisyshdr-y))
+targets		+= $(addprefix ../../../../, $(uapisyshdr-y) $(kapisyshdr-y))
 
 PHONY += all
-all: $(addprefix $(uapi)/,$(uapisyshdr-y))
-all: $(addprefix $(kapi)/,$(kapisyshdr-y))
+all: $(uapisyshdr-y) $(kapisyshdr-y)
 	@:
-- 
2.27.0
