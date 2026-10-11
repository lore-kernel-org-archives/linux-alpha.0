Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6E3CD8D3
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746048; cv=none; b=odwp+NqSbi8dk61iCCVeD0hER+pDDvhjoZYRUjggp2STG7AAIeR+oW8OwsODkMQ1xPqKX2xPvi59/a4lIly4m+poEnEbJuIFAEKv8uwcQzLk6Jeny2OZQ2VNWZ9ZsPaxHCmRCctE1xG1J6igSdWq20W+RKaLZ1mdOH8NsO7jO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746048; c=relaxed/simple;
	bh=NImZJKAaYXPwbMgYBiMx8ihu5kO69pav/ANcftoRGqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1Xpr2Eng+px+31uYKioGCJ4ubl6YItHwlNZXbIgDHSKZIYDM5VZ4l5tYxC90fTEwBTlYFQONkXtBWNfF8RcL4CndEjw81UuWTb4wMtdqhVV9oFj39WS3QuMxPkpDqte79jxUyETg5/AQFAGIJvbDDsqjK378vmMCnnh+St4egQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF1e5VME; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF1e5VME"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c315a445752so202396566b.3
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746044; x=1792350844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E99kfCclDum5wLkBUNRpEVdGgVPq8aQmLv+qNUnAy5E=;
        b=nF1e5VMEQ4lEfS5uhhQidHN6Ny06fOP7SlQE0mS6aqeFo5vP50lTty81HbdBDZ1yh+
         FdJ32scQgQSTjPtJNSyYH860T3FsilVZmnEgBgNG9fL37Sgn/DFEUF4UtShqHChvF4yt
         uzuFPjT7ih2RsXyadzkxjby6GbpRPfl4qjZbQ7TfcDG48t/J9Gobq++fqCQz+VuxLsGO
         dCtcGOkkSqW6BDnGMR5fPMl0sSi6LX4hpNNyNWtGanLKZGWfEGnYo4FZy3eVqX1/Ct+e
         YQmTIvprSBb3aR+xGOGO04h3F16B/Aa1GtLlkQiwn3neTWtFkw43gpSSNl3Wd8495o9I
         3bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746044; x=1792350844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E99kfCclDum5wLkBUNRpEVdGgVPq8aQmLv+qNUnAy5E=;
        b=GTvC2WvGqmPxN4AVs5iRQn7Q7SL8MB8cpTNZF6Sq9Sl1eEWId1p7zkxs0fGyE6dZFy
         LMCNBycc87We2TayIfXQoPvzFNJdm6+0bIKroFLuQ+TaAbxiUhaSVGiwLYg50gtPlLaR
         GldEt8UMOqMJREhJAh6lfp1immaijsJxmfefjhAZjKpCkk9yOiRIublWRk7c++wvlCtm
         gyROmGQ6Q32S1KBdG1SJ87KVK6zmYL4nvvuzF9Id10VXFvMiMDtKkxZKWCbG6Tsy/XFX
         qYq4d0yOaCFUNcfEh9G1MJdSl4sN+OEzPIGaKpi+XNs5+/Y2i42+FPRilyKMvfjqkkLm
         Nhmg==
X-Forwarded-Encrypted: i=1; AKwUvBw0wY5iV87HzBpKLXg3rquMlmIXgkkAXmYOj3tnCWHUsXP/jNCfQzZHXJoaqQzaIpdM1jXlpPTevnQbcQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKeSZ9ZPHohAsjag5C0PaB/dmTRjzcaBhK1FpW5MUvoXLeREep
	vpaiaf39BuyvB8Nn8ljktKA6jTSXcSJdYG2YRbOSHi4f6mJTdkhZFmP5
X-Gm-Gg: AYBFou2Xv4gocn6yoaEaSsDj9IxyVOj0vbIPaApp+Ndk5q1Ug2VKLratu2u1CDEa1uz
	gMGmA8pFU4mFDFPg0J0HYheL3m321odnLSIWB+5jRZ0uN6M1lsWlCILD9Q6X7VOlmknFTJmvE8t
	mm/3LkjPJ9hKoe58cTSrVVtfG00qtVZy79Z+FpJ1jmCvppBbILEdMM5vEbml2niOdnFxla7AAkS
	VRM9o8EUqQVInHhctugmjQAXubt969y7ohv79BXilKRTZs793w1OruKUVUYRhR6WpgBdew9+Ci8
	Rh8FKVXQR7gm9mq82bpDJLA95A/2W+0/4WssRTwUdL3GiuAZ0xDUGd+2/Np/OpJ1b+3h+c6bqJO
	tCNNMsbpUju1XMCbtGA/ak+8H/+cFonmKsbhCJ6PKv3P62vnjxQ+1lGPlGdowwsUKp5haxbUI85
	bXIVYLCGVE8/5WjHpKzoeX6LprJwYhqv4L8i3ZvkoDRXJGXrhQA1dfEIsEm6qMvoF26fJUtwTgX
	TuygFLISf5H+vWKz75fLfVXasHOpF2zjd7g8wt12IF8yIv0i2U=
X-Received: by 2002:a17:907:3d4e:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c31a9d2f070mr789450966b.22.1791746043476;
        Sun, 11 Oct 2026 12:14:03 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:14:02 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 4/6] alpha: decode and acknowledge Tsunami system machine checks
Date: Sun, 11 Oct 2026 21:12:51 +0200
Message-ID: <20261011191344.981000-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decode PCI and ECC transactions separately, honor invalid transaction
information, and select Pchip errors using the logout summary. Report
master aborts without importing Titan-specific dismissal policy.
Delegate processor vectors to the bounded EV6 decoder.

Capture live PERROR and MISC before acknowledging their defined W1C
bits and report live status absent from the saved frame. Leave PERRMASK
unchanged. HRM revision 4.0, Table 10-42 marks bit 9 reserved (MBZ/RAZ);
remove the obsolete RTO definition and reserve its bitfield position.

Use the system vector and frame bounds without restricting the reason
code to the ES40 values. Preserve invalid frames and unknown environmental
layouts in bounded raw dumps. Restore CPU register output for system
errors, including the PC needed to diagnose NXM.

Do not retain expected-probe handling: its only Tsunami writer is under
the undefined NXM_MACHINE_CHECKS_ON_TSUNAMI. Fatal-error policy is left
for a separate patch.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h |   3 +-
 arch/alpha/kernel/Makefile            |   2 +-
 arch/alpha/kernel/err_tsunami.c       | 241 ++++++++++++++++++++++++--
 3 files changed, 225 insertions(+), 21 deletions(-)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index fe3fd4570fac..5c5d3ff849ed 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -105,7 +105,6 @@ extern int TSUNAMI_bootcpu;
 #define perror_m_ta 0x40
 #define perror_m_rdpe 0x80
 #define perror_m_nds 0x100
-#define perror_m_rto 0x200
 #define perror_m_uecc 0x400
 #define perror_m_cre 0x800
 #define perror_m_addrl 0xFFFFFFFF0000UL
@@ -123,7 +122,7 @@ union TPchipPERROR {
 		unsigned perror_v_ta : 1;
 		unsigned perror_v_rdpe : 1;
 		unsigned perror_v_nds : 1;
-		unsigned perror_v_rto : 1;
+		unsigned perror_v_reserved : 1; /* PERROR<9>: MBZ, RAZ */
 		unsigned perror_v_uecc : 1;
 		unsigned perror_v_cre : 1;                 
 		unsigned perror_v_rsvd1 : 4;
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index a453e487b9d0..0178f6a5bdb8 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -89,6 +89,6 @@ obj-$(CONFIG_ALPHA_MARVEL)	+= err_ev7.o err_marvel.o
 obj-$(CONFIG_ALPHA_NAUTILUS)	+= err_ev6.o
 obj-$(CONFIG_ALPHA_TITAN)	+= err_ev6.o err_titan.o
 
-obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_tsunami.o
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_ev6.o err_tsunami.o
 
 endif # GENERIC
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 1045b920fa6b..91d187cb2a0d 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Machine check handling for Tsunami/Typhoon systems. */
+/*
+ * Machine check handling for Tsunami/Typhoon systems.
+ * Author: Magnus Lindholm <linmag7@gmail.com>
+ * Based on Titan error handling by Jeff Wiedemeier (Compaq).
+ * Register definitions: 21272 Hardware Reference Manual, revision 4.0.
+ */
 #include <linux/init.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
 #include <asm/io.h>
+#include <asm/irq_regs.h>
 #include <asm/core_tsunami.h>
 #include <asm/smp.h>
 #include <asm/err_common.h>
@@ -12,36 +18,235 @@
 #include "proto.h"
 #include "pci_impl.h"
 
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+#define TSUNAMI_PERROR_ERRMASK	0xdffUL
+#define TSUNAMI_PERROR_ECCMASK	(perror_m_uecc | perror_m_cre)
+#define TSUNAMI_PERROR_INV	(1UL << 51)
+#define TSUNAMI_MISC_NXM		(1UL << 28)
+
+static int
+tsunami_frame_valid(struct el_common *header, size_t size)
 {
-	pchip->perror.csr;
-	pchip->perror.csr = 0x040;
+	return !((header->sys_offset | header->size) & 7) &&
+	       header->sys_offset >= sizeof(*header) &&
+	       header->sys_offset <= header->size &&
+	       size <= header->size - header->sys_offset;
+}
+
+static int
+tsunami_parse_p_perror(int which, u64 perror, int print)
+{
+	static const char * const errors[] = {
+		"Lost error", "SERR asserted", "PERR asserted",
+		"Delayed-completion retry timeout", "Invalid scatter-gather PTE",
+		"Address parity error", "Target abort", "Read data parity error",
+		"No DEVSEL (master abort)", NULL,
+		"Uncorrectable ECC error", "Correctable ECC error"
+	};
+	static const char * const pci_cmd[] = {
+		"Interrupt acknowledge", "Special cycle", "I/O read", "I/O write",
+		"Reserved", "Reserved", "Memory read", "Memory write",
+		"Reserved", "Reserved", "Configuration read", "Configuration write",
+		"Memory read multiple", "Dual address cycle",
+		"Memory read line", "Memory write and invalidate"
+	};
+	unsigned long addr;
+	unsigned int cmd;
+	int i;
+
+	if (!(perror & TSUNAMI_PERROR_ERRMASK))
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	/* Do not import Titan's BIOS master-abort dismissal policy. */
+	if (!print)
+		return MCHK_DISPOSITION_REPORT;
+
+	printk("%s  Pchip %d PERROR: %016llx\n", err_print_prefix, which, perror);
+	for (i = 0; i < ARRAY_SIZE(errors); i++)
+		if ((perror & TSUNAMI_PERROR_ERRMASK & (1UL << i)) && errors[i])
+			printk("%s    %s\n", err_print_prefix, errors[i]);
+
+	/* INV invalidates SYN, CMD and ADDR; SERR has no command/address. */
+	if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {
+		printk("%s    Transaction information unavailable\n", err_print_prefix);
+		return MCHK_DISPOSITION_REPORT;
+	}
+	cmd = (perror & perror_m_cmd) >> 52;
+	if (perror & TSUNAMI_PERROR_ECCMASK) {
+		const char *command = "Reserved";
+
+		if (cmd == 0)
+			command = "DMA read";
+		else if (cmd == 1)
+			command = "DMA RMW";
+		else if (cmd == 3)
+			command = "SGTE read";
+		addr = ((perror >> 19) & 0xffffffffUL) << 3;
+		printk("%s    Command: %s (%x), syndrome: %02llx\n",
+		       err_print_prefix, command, cmd, (perror & perror_m_syn) >> 56);
+		printk("%s    System address: %lx\n", err_print_prefix, addr);
+	} else {
+		addr = ((perror >> 18) & 0x3fffffffUL) << 2;
+		/* SGE captures only PCI address bits <31:13> (8KB page). */
+		if (perror & perror_m_sge)
+			addr &= ~0x1fffUL;
+		printk("%s    Command: %s (%x), PCI address: %lx%s\n",
+		       err_print_prefix, pci_cmd[cmd], cmd, addr,
+		       (perror & perror_m_sge) ? " (8KB page)" : "");
+		if (perror & (1UL << 17))
+			printk("%s    Monster window\n", err_print_prefix);
+		else if (perror & (1UL << 16))
+			printk("%s    DAC scatter-gather window 3\n", err_print_prefix);
+	}
+	return MCHK_DISPOSITION_REPORT;
+}
+
+/* SESF bits 0/1 identify PCI errors, bit 2 covers ECC on either Pchip/CPU. */
+static u64
+tsunami_pchip_error(struct el_TSUNAMI_sysdata_mcheck *frame, int which)
+{
+	u64 perror = which ? frame->p1_perror : frame->p0_perror;
+
+	if (frame->sesf & (1UL << which))
+		return perror;
+	if ((frame->sesf & 4) && (perror & TSUNAMI_PERROR_ECCMASK))
+		return perror;
+	return 0;
+}
+
+static struct el_TSUNAMI_sysdata_mcheck *
+tsunami_system_frame(struct el_common *header)
+{
+	if (!tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mcheck)))
+		return NULL;
+	return (void *)header + header->sys_offset;
+}
+
+static int
+tsunami_process_logout_frame(struct el_common *header, int print)
+{
+	struct el_TSUNAMI_sysdata_mcheck *frame = tsunami_system_frame(header);
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+	int i;
+
+	if (!frame) {
+		if (print) {
+			printk("%s  Invalid Tsunami system frame; raw frame follows\n",
+			       err_print_prefix);
+			mchk_dump_logout_frame_raw(header);
+		}
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+	if (print)
+		printk("%s  SESF: %016llx DIR: %016llx MISC: %016llx\n",
+		       err_print_prefix, frame->sesf, frame->dir, frame->misc);
+	if (frame->misc & TSUNAMI_MISC_NXM) {
+		status = MCHK_DISPOSITION_REPORT;
+		if (print)
+			printk("%s  Non-existent memory, NXS: %llu\n",
+			       err_print_prefix, (frame->misc >> 29) & 7);
+	}
+	for (i = 0; i < 2; i++)
+		status |= tsunami_parse_p_perror(i, tsunami_pchip_error(frame, i), print);
+	return status;
+}
+
+struct tsunami_error_state {
+	u64 perror[2];
+	u64 misc;
+};
+
+static void
+tsunami_ack_pchip(tsunami_pchip *pchip, u64 perror)
+{
+	if (!(perror & TSUNAMI_PERROR_ERRMASK))
+		return;
+	pchip->perror.csr = perror & TSUNAMI_PERROR_ERRMASK;
+	/* Complete the W1C write before releasing the logout frame. */
 	mb();
 	pchip->perror.csr;
 }
 
-static inline void
-tsunami_pci_clr_err(void)
+static void
+tsunami_clear_errors(struct tsunami_error_state *state)
 {
-	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
+	bool pchip1 = TSUNAMI_cchip->csc.csr & (1UL << 14);
 
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
+	/* Preserve each chip's transaction and the NXM source before clearing. */
+	state->perror[0] = TSUNAMI_pchip0->perror.csr;
+	state->perror[1] = pchip1 ? TSUNAMI_pchip1->perror.csr : 0;
+	state->misc = TSUNAMI_cchip->misc.csr;
+
+	tsunami_ack_pchip(TSUNAMI_pchip0, state->perror[0]);
+	/* Do not access the second Pchip on single-Pchip systems. */
+	if (pchip1)
+		tsunami_ack_pchip(TSUNAMI_pchip1, state->perror[1]);
+	if (state->misc & TSUNAMI_MISC_NXM) {
+		/* Zero writes leave the other MISC fields unchanged. */
+		TSUNAMI_cchip->misc.csr = TSUNAMI_MISC_NXM;
+		/* Complete the NXM acknowledgment before releasing the frame. */
+		mb();
+		TSUNAMI_cchip->misc.csr;
+	}
+}
+
+static void
+tsunami_report_live_errors(struct tsunami_error_state *state,
+			  struct el_TSUNAMI_sysdata_mcheck *frame)
+{
+	int i;
+
+	/* PALcode's frame may predate these errors, or describe another chip. */
+	for (i = 0; i < 2; i++) {
+		if (!(state->perror[i] & TSUNAMI_PERROR_ERRMASK) ||
+		    (frame && state->perror[i] == tsunami_pchip_error(frame, i)))
+			continue;
+		printk("%s  Live Pchip status before acknowledgment:\n", err_print_prefix);
+		tsunami_parse_p_perror(i, state->perror[i], 1);
+	}
+	if ((state->misc & TSUNAMI_MISC_NXM) &&
+	    (!frame || ((state->misc ^ frame->misc) & (0xfUL << 28))))
+		printk("%s  Live MISC: %016llx, non-existent memory, NXS: %llu\n",
+		       err_print_prefix, state->misc, (state->misc >> 29) & 7);
 }
 
 void
 tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 {
-	/* Clear error before any reporting.  */
+	struct el_common *header = (void *)la_ptr;
+	struct el_TSUNAMI_sysdata_mcheck *frame = NULL;
+	struct tsunami_error_state live;
+	char *saved_err_prefix = err_print_prefix;
+
+	/* Synchronize pending accesses before inspecting the chipset. */
 	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
 	mb();
+	draina();
+	tsunami_clear_errors(&live);
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR)
+		frame = tsunami_system_frame(header);
+
+	err_print_prefix = KERN_CRIT;
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
+		       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
+		       "uncorrectable", vector, header->code, smp_processor_id());
+		tsunami_process_logout_frame(header, 1);
+		dik_show_regs(get_irq_regs(), NULL);
+	} else if (vector == SCB_Q_SYSEVENT) {
+		printk("%sTsunami environmental event (code %x): layout unknown\n",
+		       err_print_prefix, header->code);
+		mchk_dump_logout_frame_raw(header);
+	}
+	tsunami_report_live_errors(&live, frame);
+	err_print_prefix = saved_err_prefix;
+
+	if (vector != SCB_Q_SYSMCHK && vector != SCB_Q_SYSERR &&
+	    vector != SCB_Q_SYSEVENT) {
+		/* EV6 decoding also releases the logout frame. */
+		ev6_machine_check(vector, la_ptr);
+	} else {
+		wrmces(0x7);
+		/* Complete acknowledgment before resuming. */
+		mb();
+	}
 
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
 }
-- 
2.43.0

