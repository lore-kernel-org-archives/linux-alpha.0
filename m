Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BD473C83
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926172; cv=none; b=t22z4+bOECr9KzjlbLeSKjI3ho5x7ERm2cFhggPfdil1WaHpfoc1s74qHcedwVjncBtrWvYYeOwYummimSYmNpM5+QvMEpID7MPNFdjzGTOsElL/IgwhbHhemVzmtJ0VZN1YNoMZYSj9JOwOzlLUncwSwlf6Rp3oL3YSHRbAcbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926172; c=relaxed/simple;
	bh=er1ugzqCoO+QdONpDQp5GZS44xOxpB1CWIBfmQh+bRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nH8dXrXT5ae5avBoiwMzXAaxmULHYQzQMTv6e9hrnOeBdPBUym9iK0Tt7Y3Cmgj21CKCsdJb9cy2wzh7rmA6NEuPu6WGnA4SHLnsM4f5kNHp6L1WSBA5FbgwfWX2kHVm/plpsWKGA0LjtLEOR2e0C35r0/BNNXRNdVTvoO3IKzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzZYDCsi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzZYDCsi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso527255966b.2
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926164; x=1792530964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sa/pgNOohYgHmq7QjbKsBkT10GoMHvsPTBaYz24v+Zg=;
        b=VzZYDCsiIgg5BYjcdgGVOQ+iJz6HIqi4s/DZjQwMakRt3whpD3jfwi/lVCEsuT6zST
         DL1qVCFGnjEbzhXuPf22tdUSYZur8cDOusPAHHiOw5jdqiNb6r/5iuQR9exM5LmHev3+
         RLh7YI3ZfKeEu1TtcBJV/w/wPMfFBPLNx5M6bWSnn67XjZ48+P15SqhRQbCZd5h/o7wx
         U/Ir7WA/H2q7PjMdI3xwQ00XDvyZiXfb5o8B+kYT0/RoePFUYy1uHTJ8KlTkMvdqNFMk
         r2cnbxL3u1dQG88FKvOtYlp7RuZYh2WaLjlBI7WJgIQayzRpdCf8vZowqsXmgRz8tne8
         owYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926164; x=1792530964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sa/pgNOohYgHmq7QjbKsBkT10GoMHvsPTBaYz24v+Zg=;
        b=OV7FhjZVA1GMy27Urqn7VdmEhuslFdsmB+hxR6DYWfcWMu08LHywUgQgmEXgOH/QzC
         16IDMO4FQdI58T2vSUzotxWEx+DEiJW5nqEoM+TRq+j2nBsoX2vNfGrY+UMAwkTlLQol
         DrRsg8g/oHFcB7Ea5z+XIlHCwLsk8Rhe41GUXpl8LNZ9TsB2Y/yoRMEui5n5xSBq3f4n
         5fb68ZLa1IEwxQVWzqMeZ0HPDW0wYr3R1j4399MuWAqYxVKx9YxqC92dBlTkRtFrbyuf
         IUvhYhELspAIKt9RVgUqY5l/K5eNad1Kz9Sa5kGB+NNqQGbW4DazMuLT+JrwaQCXwj3N
         Hb4g==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+ge8CyvA6ET3VTTEN66InzqkI0z83p2OIXfzjojcFzlcwnfYbGkEEOAWmYQNbwVPhtgGLuC0//TRVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTFrtsyE1vtsCK3qvt/u+QfEGjOiOo4hD+eK8fAkoWbMtPxj8K
	epgseWBZ/VzZj3ujwsXyXR9V2pzUwBtloNDp8naUsTcEa69Uyyk9ZTzQ
X-Gm-Gg: AYBFou2UKxP7gSOVZpFy4iw87zVnFvltn9cuUTvOlNhouIC9gOUBdkVJuJHl5ldSkQe
	5yc0JnvV5ba2Px2O38p7M8zvze/Lxfn8gcYgSkuR+Gjq7l+PReFkRY3YXrvxmmXbntc9/zaENox
	VwuSIyzhk0A/OoEf2IW9mtM1gjhoq2/hDKBmCv0qnKIqH5ByJEZJzApqVwLchUe5sMoLXadZI2a
	Xai/3KGcEQwdYreuziChLo+7dDcIaLyNEaAbDKwNL6E0SFzWdotCO0LUua1yBHxRMMBlPUDS7z8
	xdG0pa1r8WLL9TO4fGQY1lx6jbfYFwWDG+c3DfOL3UeRSwK0WaqAtVtLamDXyEjJJ6N94uBFt5q
	+fe76Z2YXfPLLbgwe6uOIJuKGl4xjNUnCA8MGXJAv49xR1v6K0X7ru+P1zfSZ1tHcMVrH0DyD9v
	8yPMauEDQrSxezKKcSy3zZe6rKPxQXbbg/4WWywmo5RMfwxhX/HWKp1xufeCFURUWVU9RIysqtN
	goXOvHOKl8YW7UNiDzJEnNh3XWXavLi2kOKOkhF
X-Received: by 2002:a17:906:f586:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c31aa00dd05mr1346388066b.19.1791926163536;
        Tue, 13 Oct 2026 14:16:03 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:16:03 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 5/5] alpha: decode Clipper environmental events and retain console logs
Date: Tue, 13 Oct 2026 23:15:38 +0200
Message-ID: <20261013211551.991723-6-linmag7@gmail.com>
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

Restrict ES40 live environmental decoding to Clipper. Honor print control,
validate bounds and masks, and separate fault bits from status context.
Report valid notifications even when no recognized fault bits are set,
so door-closed and supply-return notifications are not silently discarded.
Do not infer a recovery transition from a single status snapshot.

Keep SMIR bit 0 and inverted halt/reset bits as raw context. During the
ES40 PSU cable test, bit 0 remained set after the individual PSU failure
indication cleared. Its polarity/latching is unverified, so do not call
it a current PSU failure. Use mask 0x14 for the remaining SMIR faults.
Remove the redundant silent first pass now that every valid environmental
notification is reported. Include the CPU ID for processor console frames.
Use plain door-status messages without the manual's "Set =" prefix.
Dump unknown or truncated environmental frames raw.

Register bounded console decoders from the error file, but keep the PCI
init hook and console-log invocation in sys_dp264.c, as Titan does.
Limit console-log scanning to Clipper pending older-board firmware tests.
The ES40 boot and QEMU Clipper test do not establish that nonempty console
logs are safe on DS10, DS20 or XP1000 firmware.

Print console environmental packets raw: ES40 Table D-18's sys_offset
conflicts with its field offsets. Actual SRM records are still needed.
Terminate annotation arrays and reject invalid packet bounds/revisions.

Use a Clipper-only console scanner bounded by the HWRPB log length.
Check wrapper fields and each child extent before decoding; reject
unsupported wrappers, including the class-5/type-4 record seen on ES40.
Retain the firmware log pointer if parsing is incomplete, and print up
to 1 KiB of raw bytes without reading beyond the supplied log length.
Only acknowledge a log after reaching a complete termination packet.
The generic scanner otherwise clears the pointer even on parse failure.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/err_common.h |   2 +
 arch/alpha/kernel/err_tsunami.c     | 460 ++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |   3 +
 arch/alpha/kernel/sys_dp264.c       |   5 +-
 4 files changed, 469 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/err_common.h b/arch/alpha/include/asm/err_common.h
index 610e01fe73ab..63d4320581e2 100644
--- a/arch/alpha/include/asm/err_common.h
+++ b/arch/alpha/include/asm/err_common.h
@@ -47,6 +47,8 @@
 #  define EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME	(1)
 #  define EL_TYPE__REGATTA__SYSTEM_ERROR_FRAME		(2)
 #  define EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME		(3)
+#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED	(6)
+#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED	(7)
 #  define EL_TYPE__REGATTA__TITAN_PCHIP0_EXTENDED	(8)
 #  define EL_TYPE__REGATTA__TITAN_PCHIP1_EXTENDED	(9)
 #  define EL_TYPE__REGATTA__TITAN_MEMORY_EXTENDED	(10)
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index e89a11e567be..f7989008c270 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -9,6 +9,7 @@
 #include <linux/pci.h>
 #include <linux/sched.h>
 #include <asm/io.h>
+#include <asm/hwrpb.h>
 #include <asm/core_tsunami.h>
 #include <asm/smp.h>
 #include <asm/err_common.h>
@@ -262,3 +263,462 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 		mb();
 	}
 }
+
+static const char * const CLIPPER_EnvQW1SMIR[] = {
+	"", /* SMIR<0>: retain as raw context until its semantics are known. */
+	"OCP or RMC halt detected",
+	"Sys_DC_Notok failure detected",
+	"",
+	"System temperature over 50 degrees C failure",
+	"PCI Bus #0 is in reset",
+	"PCI Bus #1 is in reset",
+	"System is being reset"
+};
+
+static const char * const CLIPPER_EnvQW2CPUIR[] = {
+	"CPU0 regulator is enabled",
+	"CPU1 regulator is enabled",
+	"CPU2 regulator is enabled",
+	"CPU3 regulator is enabled",
+	"CPU0 regulator or configuration sequence fail",
+	"CPU1 regulator or configuration sequence fail",
+	"CPU2 regulator or configuration sequence fail",
+	"CPU3 regulator or configuration sequence fail"
+};
+
+static const char * const CLIPPER_EnvQW3PSIR[] = {
+	"Power Supply 0 is enabled",
+	"Power Supply 1 is enabled",
+	"Power Supply 2 is enabled",
+	"",
+	"Power Supply 0 was enabled but failed",
+	"Power Supply 1 was enabled but failed",
+	"Power Supply 2 was enabled but failed"
+};
+
+static const char * const CLIPPER_EnvQW4LM78ISR[] = {
+	"PS +3.3V out of tolerance",
+	"PS +5V out of tolerance",
+	"PS +12V out of tolerance",
+	"VTERM out of tolerance",
+	"Temperature zone 0 (PCI Backplane slots 1-3 area) over limit failure",
+	"LM75 CPU0-3 Temperature over limit failure",
+	"System Fan 1 failure",
+	"System Fan 2 failure",
+	"CTERM out of tolerance",
+	"",
+	"-12V out of tolerance",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"CPU0_VCORE +2V out of tolerance",
+	"CPU0_VIO +1.5V out of tolerance",
+	"CPU1_VCORE +2V out of tolerance",
+	"CPU1_VIO +1.5V out of tolerance",
+	"Temperature zone 1 (PCI Backplane slots 7-10 area) over limit failure",
+	"",
+	"System Fan 4 failure",
+	"System Fan 5 failure",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"CPU2_VCORE +2V out of tolerance",
+	"CPU2_VIO +1.5V out of tolerance",
+	"CPU3_VCORE +2V out of tolerance",
+	"CPU3_VIO +1.5V out of tolerance",
+	"Temperature zone 2 (PCI Backplane slots 4-6 area) over limit failure",
+	"",
+	"System Fan 3 failure",
+	"System Fan 6 failure",
+	"",
+	"",
+	"Power supply 3.3V rail above high amperage warning",
+	"Power supply 5.0V rail above high amperage warning",
+	"Power supply 12V rail above high amperage warning",
+	"Power supply high temperature warning",
+	"Power supply AC input low limit warning",
+	"Power supply AC input high limit warning"
+};
+
+static const char * const CLIPPER_EnvQW5DOOR[] = {
+	"",
+	"System CPU door is open",
+	"System Fan door is open",
+	"System PCI door is open",
+	"",
+	"System CPU door is closed",
+	"System Fan door is closed",
+	"System PCI door is closed"
+};
+
+static const char * const CLIPPER_EnvQW6TEMP[] = {
+	"CPU0 temperature warning fault has occurred",
+	"CPU1 temperature warning fault has occurred",
+	"CPU2 temperature warning fault has occurred",
+	"CPU3 temperature warning fault has occurred",
+	"System temperature zone 0 warning fault has occurred",
+	"System temperature zone 1 warning fault has occurred",
+	"System temperature zone 2 warning fault has occurred"
+};
+
+static const char * const CLIPPER_EnvQW7FAN[] = {
+	"System Fan 1 is not responding to RMC Commands",
+	"System Fan 2 is not responding to RMC Commands",
+	"System Fan 3 is not responding to RMC Commands",
+	"System Fan 4 is not responding to RMC Commands",
+	"System Fan 5 is not responding to RMC Commands",
+	"System Fan 6 is not responding to RMC Commands",
+	"",
+	"",
+	"CPU fans 5/6 at maximum speed",
+	"CPU fans 5/6 reduced speed from maximum",
+	"PCI fans 1-4 at maximum speed",
+	"PCI fans 1-4 reduced speed from maximum"
+};
+
+#define CLIPPER_ENV_LM78ISR_MASK	0xfcdf00df05ffUL
+
+static char *el_tsunami_pchip0_extended_annotation[] = {
+"Subpacket Header",	"P0_PCTL",	"P0_PERRMASK",
+"P0_WSBA0",		"P0_WSBA1",	"P0_WSBA2",	"P0_WSBA3",
+"P0_WSM0",		"P0_WSM1",	"P0_WSM2",	"P0_WSM3",
+"P0_TBA0",		"P0_TBA1",	"P0_TBA2",	"P0_TBA3", NULL
+};
+
+static char *el_tsunami_pchip1_extended_annotation[] = {
+"Subpacket Header",	"P1_PCTL",	"P1_PERRMASK",
+"P1_WSBA0",		"P1_WSBA1",	"P1_WSBA2",	"P1_WSBA3",
+"P1_WSM0",		"P1_WSM1",	"P1_WSM2",	"P1_WSM3",
+"P1_TBA0",		"P1_TBA1",	"P1_TBA2",	"P1_TBA3", NULL
+};
+
+
+static struct el_subpacket_annotation el_tsunami_annotations[] = {
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED,
+			     1,
+			     "Tsunami PChip 0 Extended Frame",
+			     el_tsunami_pchip0_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED,
+			     1,
+			     "Tsunami PChip 1 Extended Frame",
+			     el_tsunami_pchip1_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__TERMINATION__TERMINATION,
+			     1,
+			     "Termination Subpacket",
+			     NULL)
+};
+
+/* ES40 Service Guide EK-ES240-SV A01, live frame: Tables D-20 and D-21. */
+struct el_clipper_envdata {
+	u64 summary;
+	u64 dir;
+	u64 smir;
+	u64 cpuir;
+	u64 psir;
+	u64 fault;
+	u64 doors;
+	u64 temp_warn;
+	u64 fan_ctrl;
+	u64 fatal_power_down;
+	u64 reserved;
+};
+
+static int
+clipper_print_bits(const char * const *messages, size_t count,
+		   u64 value, u64 mask, int print)
+{
+	size_t i;
+
+	if (!(value & mask))
+		return MCHK_DISPOSITION_DISMISS;
+	if (print)
+		for (i = 0; i < count; i++)
+			if (value & mask & (1UL << i))
+				printk("%s    %s\n", err_print_prefix, messages[i]);
+	return MCHK_DISPOSITION_REPORT;
+}
+
+#define CLIPPER_BITS(table, value, mask) \
+	clipper_print_bits(table, ARRAY_SIZE(table), value, mask, print)
+
+static int
+clipper_process_environment(struct el_common *header, int print)
+{
+	struct el_clipper_envdata *frame;
+	int status = 0;
+
+	if (!tsunami_frame_valid(header, sizeof(*frame))) {
+		if (print) {
+			printk("%s  Truncated Clipper environmental frame\n", err_print_prefix);
+			mchk_dump_logout_frame_raw(header);
+		}
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+	frame = (void *)header + header->sys_offset;
+	/* Only QW1 through QW7 carry error state in the live 680 frame. */
+	/* PSU summary and inverted halt/reset signals remain raw context. */
+	status |= CLIPPER_BITS(CLIPPER_EnvQW1SMIR, frame->smir, 0x14);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0xf0);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x70);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW4LM78ISR,
+			       frame->fault, CLIPPER_ENV_LM78ISR_MASK);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0x0e);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW6TEMP, frame->temp_warn, 0x7f);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0x3f);
+	/* A notification with no recognized fault can describe recovery. */
+	if (print && !(status & MCHK_DISPOSITION_REPORT))
+		printk("%s    No recognized environmental fault bits set\n",
+		       err_print_prefix);
+	if (print) {
+		printk("%s  Environmental summary: %016llx DIR: %016llx\n",
+		       err_print_prefix, frame->summary, frame->dir);
+		printk("%s  SMIR: %016llx (PSU summary/halt/reset bits undecoded)\n",
+		       err_print_prefix, frame->smir);
+		CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0x0f);
+		CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x07);
+		CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0xe0);
+		CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0xf00);
+		if (frame->fault & (0x3fUL << 42))
+			printk("%s  Power supply warning source: %llu (3 = reserved)\n",
+			       err_print_prefix, (frame->fault >> 40) & 3);
+	}
+	return MCHK_DISPOSITION_REPORT;
+}
+
+void
+clipper_machine_check(unsigned long vector, unsigned long la_ptr)
+{
+	struct el_common *header = (void *)la_ptr;
+	char *saved_err_prefix = err_print_prefix;
+
+	if (vector != SCB_Q_SYSEVENT) {
+		tsunami_machine_check(vector, la_ptr);
+		return;
+	}
+	/* Drain pending accesses before inspecting the environmental frame. */
+	mb();
+	draina();
+	err_print_prefix = KERN_CRIT;
+	printk("%sSystem correctable environmental event (code %x) on CPU %d:\n",
+	       err_print_prefix, header->code, smp_processor_id());
+	if (header->code == 0x206)
+		clipper_process_environment(header, 1);
+	else {
+		printk("%s  Unrecognized environmental event; raw frame follows\n",
+		       err_print_prefix);
+		mchk_dump_logout_frame_raw(header);
+	}
+	err_print_prefix = saved_err_prefix;
+	wrmces(0x7);
+	/* Complete acknowledgment before returning from the event. */
+	mb();
+}
+
+static struct el_subpacket *
+tsunami_process_subpacket(struct el_subpacket *packet)
+{
+	struct el_common *frame;
+	size_t offset = offsetof(struct el_subpacket, by_type.regatta_frame.data_start);
+	int status;
+
+	/* Raw dumps consume whole quadwords, and the next packet must advance. */
+	if (packet->length < offsetof(struct el_subpacket, by_type) ||
+	    (packet->length & 7))
+		return NULL;
+	if (packet->revision != 1) {
+		el_annotate_subpacket(packet);
+		return (void *)packet + packet->length;
+	}
+
+	switch (packet->type) {
+	case EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME:
+	case EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT:
+	case EL_TYPE__REGATTA__SYSTEM_ERROR_FRAME:
+	case EL_TYPE__REGATTA__SYSTEM_DBL_ERROR_HALT:
+		if (packet->length < offset + sizeof(*frame))
+			return NULL;
+		frame = (void *)packet + offset;
+		if (frame->size > packet->length - offset || frame->size < sizeof(*frame))
+			return NULL;
+		if (packet->type == EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME ||
+		    packet->type == EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT) {
+			printk("%s  ** Occurred on CPU %d:\n", err_print_prefix,
+			       (int)packet->by_type.regatta_frame.cpuid);
+			status = ev6_process_logout_frame(frame, 0);
+			if (status != MCHK_DISPOSITION_DISMISS)
+				ev6_process_logout_frame(frame, 1);
+		} else {
+			tsunami_process_logout_frame(frame, 1);
+		}
+		break;
+	case EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME:
+		/*
+		 * ES40 Table D-18 gives sys_offset=0x20, but places the
+		 * summary at frame+0x18. Preserve the complete packet until
+		 * the console layout is verified; do not apply the live layout.
+		 */
+		printk("%s  Console environmental layout unverified; raw packet follows\n",
+		       err_print_prefix);
+		el_annotate_subpacket(packet);
+		break;
+	default:
+		el_annotate_subpacket(packet);
+		break;
+	}
+	return (void *)packet + packet->length;
+}
+
+/*
+ * Clipper console logs have an HWRPB byte count. Do not use the generic
+ * unbounded dispatcher: a rejected record must not acknowledge the log.
+ */
+static bool
+tsunami_console_log(void *data, size_t remaining)
+{
+	struct el_subpacket *packet;
+	unsigned char *pos = data;
+	size_t size, length;
+	u32 count;
+
+	while (remaining >= offsetof(struct el_subpacket, by_type)) {
+		packet = (void *)pos;
+		size = packet->length;
+		if (size < offsetof(struct el_subpacket, by_type) ||
+		    size > remaining || (size & 7))
+			return false;
+		if (packet->class == EL_CLASS__TERMINATION)
+			return packet->type == EL_TYPE__TERMINATION__TERMINATION;
+		if (packet->class != EL_CLASS__HEADER || packet->revision != 1)
+			return false;
+
+		/* Check each header's extent before accessing its union member. */
+#define CONSOLE_HEADER_SIZE(member) \
+	(offsetof(struct el_subpacket, by_type.member) + \
+	 sizeof(packet->by_type.member))
+		switch (packet->type) {
+		case EL_TYPE__HEADER__SYSTEM_ERROR_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(sys_err))
+				return false;
+			length = packet->by_type.sys_err.frame_length;
+			count = packet->by_type.sys_err.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__SYSTEM_EVENT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(sys_event))
+				return false;
+			length = packet->by_type.sys_event.frame_length;
+			count = packet->by_type.sys_event.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__HALT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(err_halt))
+				return false;
+			length = packet->by_type.err_halt.frame_length;
+			count = packet->by_type.err_halt.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__LOGOUT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(logout_header))
+				return false;
+			length = packet->by_type.logout_header.frame_length;
+			count = 1;
+			break;
+		default:
+			return false;
+		}
+#undef CONSOLE_HEADER_SIZE
+		if (length > remaining - size || (length & 7) ||
+		    count > length / offsetof(struct el_subpacket, by_type))
+			return false;
+		pos += size;
+		remaining -= size + length;
+		while (count--) {
+			if (length < offsetof(struct el_subpacket, by_type))
+				return false;
+			packet = (void *)pos;
+			size = packet->length;
+			if (size < offsetof(struct el_subpacket, by_type) ||
+			    size > length || (size & 7) ||
+			    packet->class != EL_CLASS__REGATTA_FAMILY)
+				return false;
+			/* This handler checks embedded logout-frame bounds. */
+			if (tsunami_process_subpacket(packet) != (void *)pos + size)
+				return false;
+			pos += size;
+			length -= size;
+		}
+		if (length)
+			return false;
+	}
+	/* Exhaustion without a complete termination packet is incomplete. */
+	return false;
+}
+
+static void
+tsunami_console_data_log(int cpu, struct percpu_struct *pcpu)
+{
+	unsigned char *data = (void *)(IDENT_ADDR | pcpu->console_data_log_pa);
+	size_t length = pcpu->console_data_log_length;
+	size_t dump = length < 1024 ? length : 1024;
+	size_t i;
+
+	printk("%sConsole data log for CPU %d (%zu bytes):\n",
+	       err_print_prefix, cpu, length);
+	if (!(pcpu->console_data_log_pa & 7) &&
+	    length <= ~0UL - (unsigned long)data &&
+	    tsunami_console_log(data, length)) {
+		/* Acknowledge only after reaching a valid termination packet. */
+		pcpu->console_data_log_pa = 0;
+		return;
+	}
+	printk("%s  Incomplete console log; retaining firmware pointer\n",
+	       err_print_prefix);
+	/* Byte reads preserve partial headers without rounding beyond length. */
+	if (dump > ~0UL - (unsigned long)data)
+		return;
+	for (i = 0; i < dump; i++) {
+		if (!(i & 15))
+			printk("%s  %04zx:", err_print_prefix, i);
+		printk(KERN_CONT " %02x", data[i]);
+		if ((i & 15) == 15 || i + 1 == dump)
+			printk(KERN_CONT "\n");
+	}
+	if (dump < length)
+		printk("%s  Raw console log truncated to %zu bytes\n",
+		       err_print_prefix, dump);
+}
+
+void __init
+tsunami_check_console_data_log(void)
+{
+	struct percpu_struct *pcpu;
+	unsigned long cpu;
+
+	for (cpu = 0; cpu < hwrpb->nr_processors; cpu++) {
+		pcpu = (void *)hwrpb + hwrpb->processor_offset +
+			cpu * hwrpb->processor_size;
+		if (pcpu->console_data_log_pa)
+			tsunami_console_data_log(cpu, pcpu);
+	}
+}
+
+static struct el_subpacket_handler tsunami_subpacket_handler =
+	SUBPACKET_HANDLER_INIT(EL_CLASS__REGATTA_FAMILY, tsunami_process_subpacket);
+
+void __init
+tsunami_register_error_handlers(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
+		cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
+	cdl_register_subpacket_handler(&tsunami_subpacket_handler);
+	ev6_register_error_handlers();
+}
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index f138bd494628..a704acd7da6a 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -78,6 +78,9 @@ extern struct _alpha_agp_info *titan_agp_info(void);
 extern struct pci_ops tsunami_pci_ops;
 extern void tsunami_init_arch(void);
 extern void tsunami_kill_arch(int);
+extern void tsunami_register_error_handlers(void);
+extern void tsunami_check_console_data_log(void);
+extern void clipper_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_pci_tbi(struct pci_controller *, dma_addr_t, dma_addr_t);
 
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 0a2d319bb1c8..614e989a7849 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -32,6 +32,7 @@
 
 #include "proto.h"
 #include "irq_impl.h"
+#include "err_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
 
@@ -533,6 +534,8 @@ monet_init_pci(void)
 static void __init
 clipper_init_pci(void)
 {
+	tsunami_register_error_handlers();
+	tsunami_check_console_data_log();
 	common_init_pci();
 	locate_and_init_vga(NULL);
 }
@@ -627,7 +630,7 @@ struct alpha_machine_vector clipper_mv __initmv = {
 	DO_EV6_MMU,
 	DO_DEFAULT_RTC,
 	DO_TSUNAMI_IO,
-	.machine_check		= tsunami_machine_check,
+	.machine_check		= clipper_machine_check,
 	.max_isa_dma_address	= ALPHA_MAX_ISA_DMA_ADDRESS,
 	.min_io_address		= DEFAULT_IO_BASE,
 	.min_mem_address	= DEFAULT_MEM_BASE,
-- 
2.43.0

