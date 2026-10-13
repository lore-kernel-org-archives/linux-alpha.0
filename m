Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB954A7EB
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926170; cv=none; b=dOh5bx+T0t1K0saEClcBT+J7uSpEj/e+jWGLfFMF7RQK9aj/zgBVnF3ORh9LXnBSmHYX6cQhOfPOYgfUn9GoPNAVb4Gh8SgBbNpXI5N+4QY4cZiw8Cl4QmqF5mBwlFTGgczlHl0cbZGeEiQwoLyZnwB5PjKOBMWgI0v+Tkit2YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926170; c=relaxed/simple;
	bh=TYO8cGsCbFiiIRvjU4zKP1PecEEY/5PxOCJTDmLTXGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6cixmq8SslCNbL0p4titJMJ73rBuaJrwsrU0fCIAwfMIbraVI0jZHC3rwFDfScw1bWrsxvVa7QmSSAOxuUa7U5huuCMuPaqk/755eBGtdixAo3xZBhz2rhskWiVozxUSF8LqbHdmf4v9UlI3gBSP+T1lSlZoMAnUaDk/j1EKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1BbUR6Z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1BbUR6Z"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso589552066b.0
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926163; x=1792530963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVwpdOddTpzy7VQt6SNr6+PgzeU5FxX1gKXWVrGmSLs=;
        b=k1BbUR6ZXf/e9lC6Vh+aRlWA9k/M3Wldcbo60UR1cuttrRV77coR1yDsGVOrYqGhzq
         1pPLjuahZXtdXmEeEfJ7dJRVmDitq5Nv9wgmvvY9uIYKfpemThq9Y5/VJD1nmAbkmvox
         DmdBE6DZIe7oDXVwSGJnMYwt9UZyx01vDl4ULGf7jANzgB8Vwx0ZK/8CK+gnfXSzlKED
         hGkKYheh0ysQL8dmHGPBEeFFLubAVJgqGRE3qsIKkGaWMKzcGz1zbd6ofD3VXvXKllC/
         2sPLBwOUbxtcX4E5dTbAk+WaS+2fyUrCHq4qevhM22FO0iV0J1rwLrj3qcieVPNN7Nsv
         oZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926163; x=1792530963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVwpdOddTpzy7VQt6SNr6+PgzeU5FxX1gKXWVrGmSLs=;
        b=Wr9XpC/qJAavbMJh2qct/x1P5qEV+BH5rr98aPF/G5L79tK2Bfk22DhHl1V1hOyHbJ
         8WCw0iuK9+wGEkYiPjEhCLDeb4ra0atHymA7RmQBMAhzh9trCe7xZmjfgb1BGcG6jcdE
         SoWHygJL2KUmN6GdIiHxfE/qlwApF7Ahzl8fi63EqaT+EM2f9AS8yPUC8ubtWeh5aMyV
         3lTw2ymhBNyEXuVtS8uYjEM+dZtoSI9P6LJj+t7xCIFQPJXeh2qQRUS4lHsO84RNkHAZ
         3UPn9gv/I4I8zVLCFAVB87kb6MrHzj9cEtcSP5WKN6PRu9n8s+azw98tKEeYHQbeJxv+
         +K+A==
X-Forwarded-Encrypted: i=1; AKwUvBzlmoIrqxR7vp3DyJ0iOSIU7maoehCsZh68yLRwBwzXITwR+P6miTVnFM8JkaMWzDvyeXNJL2QzvUOFIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLskY8cE6jeNChjbLpB4qIbSl/eYon1W9RuzyGIDk7BMr89nCZ7
	r6iygfHs2e8J/ZGW8yHZTB5EaipuQdu8dB9ebL0avDoJndZFtjiGPlB7
X-Gm-Gg: AYBFou0vewkJAv35uEFBv+V3uRrQNedd5q6611GmqB+5r0iQ5rmfAaN8VbqUqY7QAZn
	ucJBv9YRWCMCbJnz7GwXHCvHgwXIR2NktW2Dk84h66/PwqmQBWc0sVeK2GPeOhqwEJNRbiGH/TN
	YWGjCy+sr98UM+SeCCr3yqsckhLpUBDptjzu34oPtPvFAonQYC1DBuWT+3CVCc9k00EDLPouuBd
	/4PYub6qnySkyQAOoZuvzwZzBKrgxPsnqU4fsI4RPuI1wkJKB3ju8W/6r5atSNZGg0RLE5nixIn
	vX4u2ClQawEqoeB77dulHMSD0uA9ZjZ/SmIOY4L+bNeMPG0bG2IQeuSnjVJ/rnA576N/ltHrGRd
	DU51ZqM1Fh+TcAZtx2Eqm5Nrr3aTY4oO7lrzFyht+T8C330LjE7MQptTQX9bNDGBn7n8DJmSaQ9
	GGc2jAaWLMXz5v3VX9oJvdPVpV7HS/LG8h9vl7cyBX0cJADgGYYVZvjejLp+kEB8DuvSiUB8mF+
	eFTJaLrgWuO5dYqDS1HRztU+4CJkGxAyi2R2qAK
X-Received: by 2002:a17:907:e113:b0:c31:d389:1196 with SMTP id a640c23a62f3a-c31d389217bmr782495666b.25.1791926162687;
        Tue, 13 Oct 2026 14:16:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:16:02 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 4/5] alpha: decode and acknowledge Tsunami system machine checks
Date: Tue, 13 Oct 2026 23:15:37 +0200
Message-ID: <20261013211551.991723-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
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
errors, including the PC needed to diagnose NXM. For correctable system
errors, gate the register dump on CONFIG_VERBOSE_MCHECK and
alpha_verbose_mcheck while retaining the error decode.

HRM 10.2.5.7 states that a cleared PERRMASK bit prevents the corresponding
PERROR bit from being set, including by PERRSET. This does not establish
firmware's mask value or clear a previously latched error. Leave firmware's
mask untouched and report snapshots as live state, not proof of which
transaction caused the current vector.

Keep transaction information unavailable whenever SERR is set: HRM
8.8.2.6 gives no exception for SERR combined with another error. Follow
Table 10-42's ECC interpretation for CRE/UECC and document that combined
ECC/PCI bits do not reveal error ordering.

Do not retain expected-probe handling: its only Tsunami writer is under
the undefined NXM_MACHINE_CHECKS_ON_TSUNAMI. New fatal-error policy is deferred
to a follow-up; reporting and acknowledgment do not establish recovery.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h |   3 +-
 arch/alpha/kernel/Makefile            |   2 +-
 arch/alpha/kernel/err_tsunami.c       | 253 ++++++++++++++++++++++++--
 3 files changed, 237 insertions(+), 21 deletions(-)

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
index 1045b920fa6b..e89a11e567be 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -1,5 +1,10 @@
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
@@ -12,36 +17,248 @@
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
+	/*
+	 * INV invalidates SYN, CMD and ADDR. HRM 8.8.2.6 leaves command/address
+	 * undefined whenever SERR is set, including with other error bits.
+	 */
+	if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {
+		printk("%s    Transaction information unavailable\n", err_print_prefix);
+		return MCHK_DISPOSITION_REPORT;
+	}
+	cmd = (perror & perror_m_cmd) >> 52;
+	/*
+	 * Table 10-42 selects the ECC fields whenever CRE or UECC is set.
+	 * Mixed ECC/PCI bits do not establish which error occurred first.
+	 */
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
+
+	/* HRM 10.2.5.7: PERRMASK gates latching, not just notification. */
+
+	/* Preserve each chip's transaction and the NXM source before clearing. */
+	state->perror[0] = TSUNAMI_pchip0->perror.csr;
+	state->perror[1] = pchip1 ? TSUNAMI_pchip1->perror.csr : 0;
+	state->misc = TSUNAMI_cchip->misc.csr;
 
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
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
+	bool show_regs = vector == SCB_Q_SYSMCHK;
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
+#ifdef CONFIG_VERBOSE_MCHECK
+	show_regs |= alpha_verbose_mcheck != 0;
+#endif
+	err_print_prefix = KERN_CRIT;
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
+		       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
+		       "uncorrectable", vector, header->code, smp_processor_id());
+		tsunami_process_logout_frame(header, 1);
+		if (show_regs)
+			dik_show_regs(get_irq_regs(), NULL);
+	} else if (vector == SCB_Q_SYSEVENT) {
+		printk("%sTsunami environmental event (code %x): layout unknown\n",
+		       err_print_prefix, header->code);
+		mchk_dump_logout_frame_raw(header);
+	}
+	tsunami_report_live_errors(&live, frame);
+	err_print_prefix = saved_err_prefix;
 
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
+	if (vector != SCB_Q_SYSMCHK && vector != SCB_Q_SYSERR &&
+	    vector != SCB_Q_SYSEVENT) {
+		/* EV6 decoding also releases the logout frame. */
+		ev6_machine_check(vector, la_ptr);
+	} else {
+		wrmces(0x7);
+		/* Complete acknowledgment before resuming. */
+		mb();
+	}
 }
-- 
2.43.0

