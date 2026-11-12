Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513899;
	b=qej8wIqqiu+ZpMoTAiaEA3Mf0/sYeT/QFL4CJKObuH+6BU6EX8bAa95IAuv/C1mcpoV+
	 GPijWUPkZbTVbEZpvIVH8LC8ZlS3N93U7hiOjhgIHN5XBCXW6cuwuDtTR+POXgqYa8xcl
	 9sFktbyaie2pVU6/EWn0dmKIMed8uIsmppvO2AXd0OA8N0wD8Gy+b2Ac2MMnHHe7FNoe1
	 dMWmytO79yMKxre5bfp4Qo+4uwn0mPltSxwcWnBnDmUROgqZmlBUSaLbTX+4lgD8zQJx2
	 rOZ7KHuYoDwVi0qwRvk6LuDqMvd1PnrQvG3EQ2RSbQYBtJjgUH16dUyYbJwJflCtNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513899;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=XzwCJIdbriz7vzxfGx82RUBGlpF394OPw4T5+G+DLzc=;
	b=bAcxz6qtWkfLViDFyLpHwem3gty/Angn2Q7TZnk3pZsO/EBR0Swr5gCZVRRsGS28EhmH
	 5nyQlyN/yvEF7OR/SBOHqXfJZ6wFnJrft23WYDJVQHNFpUFIvxWo1R/UXD0CV6vqtlQdJ
	 dxiR1meIRByikHuMkdvYENRGrrrPcMCyK9LQYhomU1BaEsyPkzITp74X6wHpTYxZ22McT
	 6X1qjIZbNnPrYig2yAztceYyZB2CIRNhIQ6qjnKutAIBAbawYt/7MiiDDGT75fJyAFLgS
	 ieQiOPJOzjCwf636ckmmGaHDmP4H1UWDLXGx/zKZL/bnnwesl8CVXlwcm/+8CtlJh5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m1b//gs9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9D606A31C;
	Thu, 12 Nov 2026 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1b//gs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F089E1F000C5;
	Thu, 12 Nov 2026 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794513898;
	bh=XzwCJIdbriz7vzxfGx82RUBGlpF394OPw4T5+G+DLzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m1b//gs9oBa1H0F3Ec31wv3nOu5sDxHGMBMuwgB3UWCeY+rHzfA86gVS8OqBxrdyI
	 LcXNqWaJdQ38nRjjULt9/KIvuIjEm3a2ZeeEDiDJobA8zvxyj/8k0+IZydw88x1A7J
	 UOMKw729NZtQhI6F3Y5utgBu1onfD5CbbUWv7vB6pEL7t82zTk0PqesHA2QVG4xsqB
	 t4dii329WpN0Sjm47FkN9PQ951WmuKLBkqo2oFs9Sl5JoaBoJnjLMu3UkbJ49++MEi
	 uml45wv4OvlyxEwYBf6Lv3xtiwzrhOiRCtkPNNdyE0jXG+XxhBWujr1YF9DZGdCQWB
	 LZP/faZP4kdAA==
From: Thorsten Blum <blum@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] alpha/serial: Add include guard to asm/serial.h
Date: Thu, 12 Nov 2026 21:04:00 +0100
Message-ID: <20261112200359.32685-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112200359.32685-3-blum@kernel.org>
References: <20261112200359.32685-3-blum@kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=blum@kernel.org; h=from:subject; bh=BAf1Ykm5j5vLRT4vwV1nQPKJlHyTcGJsLFU5JNl5P7M=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnfpPeHrd3Mkc6Rmqq8ZsL2d15qxfWv79fpvlwnVzl1i tL06f/mdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBE4hcz/C/MW7d0kbHO1QY5 t3faZ58vWKv+pbC83bbk7CpL3pWsihcZ/ql3zvi+xpF91/NJa2sLDQXsNbXNS2ce+j5Z8Fgmu09 jOgcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Add an include guard and remove the stale comment while at it.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/alpha/include/asm/serial.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/serial.h
index 205e61ef2975..7fa754cab5df 100644
--- a/arch/alpha/include/asm/serial.h
+++ b/arch/alpha/include/asm/serial.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * include/asm-alpha/serial.h
- */
+#ifndef _ASM_ALPHA_SERIAL_H
+#define _ASM_ALPHA_SERIAL_H
 
 #include <asm-generic/serial.h>
 
@@ -20,3 +19,5 @@
 	{ 0, BASE_BAUD, 0x2F8, 3, STD_COM_FLAGS },	/* ttyS1 */	\
 	{ 0, BASE_BAUD, 0x3E8, 4, STD_COM_FLAGS },	/* ttyS2 */	\
 	{ 0, BASE_BAUD, 0x2E8, 3, STD_COM4_FLAGS },	/* ttyS3 */
+
+#endif /* _ASM_ALPHA_SERIAL_H */
