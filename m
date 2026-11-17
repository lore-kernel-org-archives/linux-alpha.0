Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874078;
	b=pZOxKrhcaYysajvNDGTslmiKaAvRdAgk7+CO7H2GIYgTvYjA5S/T7PeIJoyIrTfQwiQW
	 WfN80kQ4byAOxmKHT7Wh+ZjDAJ3tiD1a+utjCvY8VtuqHNAlIltT3M6hASWSJEFwnONAh
	 rjeaomQb5CfnWYbscfqMyz0+uwiCO5+ECCajeK4Ir/NyjpQ1q+JmzgzFhJZC0880NX02J
	 fPCmbGDzeRCS0jhDrJqyaZttoh+7ldC3ojthLLV8bNzq+OqtoewJsUJyku3ZvXdIKrFC8
	 b2TPwtiCW3Vt57cSfAJWGn+eCqs01NO6xUuisa6HdRrgTVtf6XcVDyyvqQmpYoAIeKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874078;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=4vXmR0iRJiG7E8im3JcTb6JVxOpKMALSsdkAo4Dw988=;
	b=Hd5JhEpHhGk4AKktSsAEbjpnBU5rZsgkULc5iM0mZnNccVOX6KL92dOmgy9XaILgRu4Q
	 CBqnJBfqTe4bpLt1n6PIykWmevg82xw3qetR3JXZeYUp8nYOP4/0eCBkSTe2lKtnzuj2P
	 Is5J/DjXFuatstDWBQqF8vQ6dO+x4L8oNNiYrBr40iAL1uh5hqjZyiFzAkR4B642EeWbY
	 FqeIFjbZuC5i/RBeCdw2luFt6Ry1kpMBeclr09xeupnymqFjirIo2gBiF8O43Tfoz3Spk
	 a3lhnOni5J3r/9OPskhFywo1YRncQUMJw6GJ7MtiqjmCAZ+GiQiHrMISkot+StFMTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAS69EtV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963A606A31C;
	Tue, 17 Nov 2026 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAS69EtV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCE31F000C4;
	Tue, 17 Nov 2026 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874078;
	bh=4vXmR0iRJiG7E8im3JcTb6JVxOpKMALSsdkAo4Dw988=;
	h=From:Date:Subject:To:Cc;
	b=TAS69EtVs8dGL3xFkUKstXKQ8GO6Nn1jUEijop60uPzkKojv/HFOfi6kgTP6lBQW3
	 Z2LPsEckLUGoRPGjYopWZl9r6HdEHqacD6ehu+YUQlBa38vC66Xhn6IZgk/to0Njni
	 4qJtSvJY1pBXfwus1/cqMlDQ/Do5oN2+u5blNMs9Xe483/Ekb4hzS+GaquddC3AImu
	 IvQyRIJeX8+a4QtzQvI1w0Ii7aP7x+eAAgAs62OXqUqjGxVeL/0a2TToSNeZAq8nZF
	 picF4qXId4oDk3nGrWp93iaEWYCDT9xsL88kLj/s7aZ66RP8hKEsL4LCvnvQX9zm4C
	 M19OHRMTzwdGw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 01:07:53 +0100
Subject: [PATCH v2] alpha: Use symbol assignment in SYM_END
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-alpha-compile-v2-1-846bb099b319@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XMsQ6DIBAA0F8hN0vjYbTVyf9oHAgccqkVAg1pY
 /j3pu5d3/AOyJSYMkzigESFM4cdJqEaAcbrfSXJFiYBqlUDYttJvUWvpQnPyBtJctZSf7si9gY
 aATGR4/f53ZdGgOf8Culz9gV/+m8qKFGONHak1NDq0c0PSjttl5BWWGqtXzcHn5KrAAAA
X-Change-ID: 20261103-alpha-compile-efdde587115c
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Alpha uses the .set directive to select assembler options, so the
symbol assignment emitted by the generic SYM_END macro fails to assemble.
This breaks COMPILE_TEST builds left and right, e.g.:

  Error: junk at end of line, first unrecognized character is `,'
  Error: .size expression for bcm6846_runner_start does not evaluate to a constant

Override SYM_END to use an ordinary symbol assignment for the calculated
size. Preserve the symbol type, size and local size symbol while leaving
other architectures unchanged.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@intel.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
The generic SYM_END uses .set for symbol assignment, but Alpha interprets
.set as an assembler mode directive. Provide an Alpha override using
ordinary assignment.

Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
2.46.1: the original header reproduces the reported errors, while the
fixed header assembles without warnings. Symbol sizes and the embedded
Runner bytes were checked. A full Alpha allyesconfig build was not run.

This patch was prepared with LLM assistance.
---
Changes in v2:
- Use __ASSEMBLER__ instead of __ASSEMBLY__, as requested by Thomas Huth.
- Link to v1: https://patch.msgid.link/20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org
---
 arch/alpha/include/asm/linkage.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/linkage.h
index aa8661fa60dc..275de8ac693b 100644
--- a/arch/alpha/include/asm/linkage.h
+++ b/arch/alpha/include/asm/linkage.h
@@ -6,4 +6,12 @@
 #define SYSCALL_ALIAS(alias, name)					\
 	asm ( #alias " = " #name "\n\t.globl " #alias)
 
+#ifdef __ASSEMBLER__
+/* Alpha uses .set for assembler options, not symbol assignments. */
+#define SYM_END(name, sym_type)				\
+	.type name sym_type ASM_NL			\
+	.L__sym_size_##name = . - name ASM_NL		\
+	.size name, .L__sym_size_##name
+#endif
+
 #endif

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-alpha-compile-efdde587115c

Best regards,
--  
Linus Walleij <linusw@kernel.org>

