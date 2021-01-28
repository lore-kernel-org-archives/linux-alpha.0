From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings from
 COND_SYSCALL()
Date: Thu, 28 Jan 2021 09:50:44 +0900
Message-ID: <20210128005110.2613902-3-masahiroy@kernel.org>
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
	 bh=/7RBGZSshXe/yFwTR+ZIzpEhaMtbCnT3s0pZLy5iGqA=; b=Rh5fHr5zQsrPSdNyFK8M7iX/8
	Tc/2NWMlzTwLpGQfUgLTjh7NyE2Rr1Y33EsjGzmczaRBz0h9gErdCoW+SbkVZ1PMSm9P2j5cw7jV5
	fxTiFYjs9pXfysT3r6RnV+8vsXeo3jiIc8QmZlj56IuhMLpmmHiKq9vUcSCFP29KJkXCz9pn42GVf
	2KeX2dTTbJ4aTr5E6MtX7yNaOlmVAEQL+nUdFzr7+S2bw+Xn4/48laaHqe7eZx/Ci8w7H+Pho3axZ
	kAAesonzMYut+A8r3iXBjFaYkrqLLQn0AqO1wcilPTimNJNGUvEuRGazf78dY4txhbmfmC29Ugwod
	uQr46Fl6w==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIX024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795109;
 bh=gbMbtPrd1uw4SfvZtDPN5tcO1lAksGEXidy2tzv1gck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWxDVkAFQuRWzyvDXKhEirM3GO9HVgiEkoPwsziGrvA7UHp95u8zOvl2m3BNNeRcn
 v0X+PTytGRvV0KXggsA0+sczavCS/X8fsffUaDv+X+yehtphUYPdkwYjeipobfCz/a
 8pZmwG/BWtM/M2zhRXbfxUnzxSPcifSt4r5t5+vqnrh+liLvpH4qIj+8b5xaZCodWY
 l9jrY+Drka/f4haON0F/9+X4wb+aJTiV2DF+HEhY0UEXW6HzAPz/KVjoBqfgvW8k5Z
 +l+UHueS+m36Ex3b3/IZtMxZgI7SdQL2BTY2S5lFJxEGaNwIun784zcwCV86iKsFLo
 sXJ9FgfjTFX7g==
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

Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes
warnings.

$ make W=1 kernel/sys_ni.o
  [ snip ]
  CC      kernel/sys_ni.o
In file included from kernel/sys_ni.c:10:
./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
   83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
      |              ^~
./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
  100 |  __COND_SYSCALL(x64, sys_##name)
      |  ^~~~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
  256 |  __X64_COND_SYSCALL(name)     \
      |  ^~~~~~~~~~~~~~~~~~
kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
   39 | COND_SYSCALL(io_setup);
      | ^~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
   83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
      |              ^~
./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
  120 |  __COND_SYSCALL(ia32, sys_##name)
      |  ^~~~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
  257 |  __IA32_COND_SYSCALL(name)
      |  ^~~~~~~~~~~~~~~~~~~
kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
   39 | COND_SYSCALL(io_setup);
      | ^~~~~~~~~~~~
  ...

__SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
declarations. Let's do likewise for __COND_SYSCALL() to fix the
warnings.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/include/asm/syscall_wrapper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
index a84333adeef2..80c08c7d5e72 100644
--- a/arch/x86/include/asm/syscall_wrapper.h
+++ b/arch/x86/include/asm/syscall_wrapper.h
@@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
 	}
 
 #define __COND_SYSCALL(abi, name)					\
+	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
 	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
 	{								\
 		return sys_ni_syscall();				\
-- 
2.27.0
