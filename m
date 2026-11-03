Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696987;
	b=jOndgfZMPQPFhWLm9VG0yZSFCgQ64pa7sfshbqfwtpnpwaWt0n2C3f/0/3yFn8bS0CGj
	 XU/cV0huc0h/bFAgUGvpeS9NHBnqUnSZMyhcgfmyWLkkp94IIHv0Zh5+a4e/MCS4ZxlGf
	 Yj/+b1z7b3G7JZ/Gg4YsHJz8z383Ka7IBWKJv4ZzMbcSsNHz0JKSTLSDdRZyfzkOWqcGT
	 gCwjZ84T5OnBUNLQnRGBitQwdcSyxbsYdTSw5+yBh664oX2jddUITkadUUlWf0DJDVJGf
	 3tt/ElPUaWDly5AbLVFi6isxDCCP9J9ASoFxnL/pqYXqpnbHgjUKXDHVua//OY9BcoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696987;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=0sVsx2ECqjItiIs8s497yPBInJ/alQD9PApMYIDhMMg=;
	b=XFnFMM0te51GJsPhdYW/9v8cycsjI2UIosEzRj96B2lBd4wvf20gKsiIreA0i0qeQ51O
	 A/NJbtZXvuMBIs/RFtBda5cScATLqS6HQQ2TeFZUVwuXjgRh6n4jZpww8hgANT5mJswP3
	 2n91iSMHxEpfSJCuLCXXLE6np82e4q0uv8uiuNoprtg1kqVeZZLkT0TjwZcro2Y39mvLF
	 Ena+M5U14UJPVWCT3IerRwIxp81Fbkvh3pYOqB2wah3x/iYpmwQgx9prhUQjys0J5L8WC
	 YHu+wQf2wjwkmrvLehHIc4iDSP4hrFOdj3x9P/i4XfxXBrh2OAhbl0EfjCmSDrz/0nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ew0TMgcb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C31606A329;
	Tue,  3 Nov 2026 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ew0TMgcb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452B01F000C1;
	Tue,  3 Nov 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696985;
	bh=0sVsx2ECqjItiIs8s497yPBInJ/alQD9PApMYIDhMMg=;
	h=From:Date:Subject:To:Cc;
	b=Ew0TMgcbY06/NYC4JZyEWa/Z6ta0YEwvLpIXHVNS9GACMTlTWWHwUTS6MISat20gX
	 v8JC9UxhGttj9VGDZWO+BwLixl370KGHaVh4dxnyh6pYqLvEOhE5HoGsG4W/MPywsn
	 K/LHgOz6VhfuqB5qTOGBV/jOyYvhnw7Aq6c5ufPfo9r9Mg8H+qORHNyiqD3JUzZLc7
	 o/g/tyuFXBQsNa5a7vnAiw0kDHEUFsKE/ZiHjEQR+AwpxdWMOGkTVvYc26cbN5+7fr
	 8z8B2uQKzKvc29zdIHICb4RlYZncxUQyvUuDPqN2fRY2plN4Fm+Dl7L/PWNNS4CrNs
	 YHz28al1c291Q==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Nov 2026 10:09:42 +0100
Subject: [PATCH] alpha: Use symbol assignment in SYM_END
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
Message-Id: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBOcwoquEi1ExxywEoUIxLsnL
 d/i/wKZElOGtSuQ6OHM99WAfQfG6+sgwbYZBjlMiHIUOkSvhbnPyIEEOWtJLTOiMtCamMjx+/+
 2vdYP4ES2iF8AAAA=
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
 arch/alpha/include/asm/linkage.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/linkage.h
index aa8661fa60dc..a3f0302c92d0 100644
--- a/arch/alpha/include/asm/linkage.h
+++ b/arch/alpha/include/asm/linkage.h
@@ -6,4 +6,12 @@
 #define SYSCALL_ALIAS(alias, name)					\
 	asm ( #alias " = " #name "\n\t.globl " #alias)
 
+#ifdef __ASSEMBLY__
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

