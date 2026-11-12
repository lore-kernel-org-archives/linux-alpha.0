Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513895;
	b=1Hb5+OPeiCIsvhrW+u1BTgXTlLKfcvoXfM9q9FwprwGgWtPldjHa2dcbIW2YEFbPAbYY
	 XnqhGu5KJD4CTBTCNa8uq4X2OacOMSD7n3ZzoRHnKOGqm4EesUxzmX/UpqeuNkZUwPTpk
	 uLa9ulrHj6IRJ6wJ35ANGKA7yVjo9DEFbTaZDFCP1DXbM4YJAI//yB995S9kXgfET25At
	 eqGoAUfwLZMYYmhjZKnnuhod/f0t4JPlDLNkcKQ9rZbLpLo999iZI0PbC5XtH4o0YLurQ
	 L3NFH+kH2GV7qru3ucKIZJThrADwURMVwmC+nmeFcRlIsiFK+RX51It3e06pXyHV2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513895;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ZzAEPo+mJYYdSMOGK5VsZrT/x37yOXBsr3c/ZdKsZyM=;
	b=k3NnWMPeZJYZWpRXhLeAmhkO04NdcBuXVVQSkUj1U3mCMdD+/VgsD+JhM7j7lEVWrh32
	 ssZ6Ktme5TncBuCDx6wW/aKoAr8j7kU3/8FvdGYUNHbGcVTHQnOtSE+CG9M/ca1M9gGUB
	 BTZVw00y20xYNLnGZEnrUSw3QK6jNicypJTgAg4VVggJ2SFzCYm++3Gs7qN2J1Cj90yFs
	 I/aX71Z3crbw3O9GUfxc28dnSQAmzAIRlCX7sDgauqX0HSWsNlW3L1I/9iInq3JE3fycp
	 YyT2k0Qn0ItdkfVAeQbazlffk+0PI7Z/Mq/eYI6zq/sbasynUgoQvZrJOzSLnJX9vsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RT6qnGcV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA6606A32D;
	Thu, 12 Nov 2026 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RT6qnGcV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC4B1F000C4;
	Thu, 12 Nov 2026 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794513895;
	bh=ZzAEPo+mJYYdSMOGK5VsZrT/x37yOXBsr3c/ZdKsZyM=;
	h=From:To:Cc:Subject:Date;
	b=RT6qnGcVxCc+ElixYKASeKV03mXEhHhaLCiYOGKLliflYPnBJFQtktD1TCq5C6dr5
	 mXiVUQOLbhORPmL5M85ReZoIP6+ezj8eMBrgwyXtXwKkDdoqYCJ6WE7bph9hbpDqJm
	 1LBvmoC8/MFsv10PMFqDM84/sBPaKJ09Ee7cdhDhzWZpoj6y7Ue9mXtErHIQjHKq9P
	 nJuCEFFJkcJr/TA4ZJlg5K9rulGD66JykOyD2wgZY34EkqbamZznT9SLBVKkc7/U1t
	 PC+I9bbwaXFGTOCRqoTKH9HB5fCS7ajiIq07Y+tDaitcRTbJNDhixL01y7peW2UeGV
	 WykdJL+HDVzSw==
From: Thorsten Blum <blum@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] alpha/serial: Use generic BASE_BAUD in asm/serial.h
Date: Thu, 12 Nov 2026 21:03:59 +0100
Message-ID: <20261112200359.32685-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=blum@kernel.org; h=from:subject; bh=5j62QPT3v1tBMqlQfLH+UVxKw7S/kONwQuU0FMHGIXI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnfpNfbc1svfa36ouuYMPu1T3xVsbkpdt/cixdGnd50y NNy/+zSjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIrj5GhjN+Me9cEhbc3eDz PH+RUEHIjAknjb6JXRLmmBmz01X/mhbDf7+Kww48bfd4TiQUFe7lYf29Rr/249eOrb+y+dY8a7p YxQ8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Include asm-generic/serial.h and use the generic BASE_BAUD definition
instead of redefining it.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/alpha/include/asm/serial.h | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/serial.h
index 91115447319c..205e61ef2975 100644
--- a/arch/alpha/include/asm/serial.h
+++ b/arch/alpha/include/asm/serial.h
@@ -3,15 +3,7 @@
  * include/asm-alpha/serial.h
  */
 
-
-/*
- * This assumes you have a 1.8432 MHz clock for your UART.
- *
- * It'd be nice if someone built a serial card with a 24.576 MHz
- * clock, since the 16550A is capable of handling a top speed of 1.5
- * megabits/second; but this requires the faster clock.
- */
-#define BASE_BAUD ( 1843200 / 16 )
+#include <asm-generic/serial.h>
 
 /* Standard COM flags (except for COM4, because of the 8514 problem) */
 #ifdef CONFIG_SERIAL_8250_DETECT_IRQ
