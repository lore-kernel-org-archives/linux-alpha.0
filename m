From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/27] ia64: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:51 +0900
Message-ID: <20210128005110.2613902-10-masahiroy@kernel.org>
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
	 bh=8DpM3IqntKyeH5qxUxcm/+8gF+cmyF4HoHB1uf2zBBI=; b=ByUtHdoMmX3CptAtRpidGSVUF
	o7wTqZrMNUrB3gXynx/NHX+Dqp2MvrDxQSn9S9ri7cPL5bcC7eyWt68eYuM2qhZjEDZ15O/K9KnhY
	EeBMvZB4xNN8QTtSxpzgCdqMziCcRA4VTs/mRQSVUWxJhS2hfL/zqt84LlkMCbku1CyLf1yu0yVtc
	+QTkxGnf4dYUwX3KqQy4pIb9HewQXdi3hvCm/jkhoNOQDcKJisZnSZxS+RiIXeKPGJU9/LvMuZg24
	zrTnvdM9d4Rh3DZdErbFhNl6CsS2pta+0eLRy4CgmBUX3+6Q2wivaxjQ6ETz0DD8/6lebnRRU74m4
	qFaZDBCxg==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIe024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795118;
 bh=FojGohQMvoWe5iE5Yt4baOE1CWG8dNc79QROwTH9qhY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j9U0JaxidB0o6qBXroAVaKd0sdkkQbgCI/EwRPzbAbdzh4XhnCsx/Jee861JQUiTV
 bb/hpxk2HblluNoKwc0KExK6i8tyDq2h8EEGgQYS4495mKOtqLZ2IUas8l9araAevv
 r4TNxiKYG2su8pht2l9vNL09bEW08F+wGV5qi14HICXEs57hKDgC9pr0pIhh9j63te
 s+lRlK5vcgLVaRFhfwnKqUXGLWCAWXjJkBWia76hQk/XSxlrMknlmhL3ENPZuvIEkA
 yg8D4TPMR+sPjg0l7oDFu0zvOcADod5kHvCd9Ji2TFraoQCYfaBVN5wOkLg4Btg7cx
 zBeqpnpebKa5g==
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

 arch/ia64/kernel/syscalls/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
index 813a58cba39c..b9bfd186295f 100644
--- a/arch/ia64/kernel/syscalls/Makefile
+++ b/arch/ia64/kernel/syscalls/Makefile
@@ -22,19 +22,20 @@ quiet_cmd_systbl = SYSTBL  $@
 		   '$(systbl_offset_$(basetarget))'
 
 syshdr_offset_unistd_64 := __NR_Linux
-$(uapi)/unistd_64.h: $(syscall) $(syshdr)
+$(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 systbl_offset_syscall_table := 1024
-$(kapi)/syscall_table.h: $(syscall) $(systbl)
+$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_64.h
 kapisyshdr-y		+= syscall_table.h
 
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
