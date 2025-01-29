Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3DF1AC458;
	Wed, 29 Jan 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143813; cv=none; b=eZAt3MeMEZR7ETq8r8IVWUHxhZ5HwAzi/VISr7drPpNuk8GzcvRvyA01L/RY4mwyLN44Zb0u/DXZ6B2/XSdcOt4oK2zgHLKdxyEB6AoV056pmK1wt9qrhYRqiXWHJZuIsJfd18+8JuRPzNbdZmoGBuIghrv7qGczjSiwfxIqs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143813; c=relaxed/simple;
	bh=x3tuKmDsQcHF9HNzooEOtb3LhcTu4CLMQGVbn4iQieQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrJmJOoBMaXbPGNUjU0Wq2WH1EJTbXP4+ksF6U5JnLDKwDK25F7iRIoZqaGW7Qi047DY12NTB1HdWOFnKiWRPFZ1E1g3xtq6VF531/jq7nzZYrY5lhbgljh5Cf2JZYTLrGddm53w2eL47tJUAYTANFUQPUDi0BPJ2CV1f4Ry8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=AmNQrD2c; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="AmNQrD2c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QshSX18kxvE8licU1D5CXkBzURNunmOcjxZCl1Jxi48=; b=AmNQrD2cW1eRKS6kDmnuYI8LNb
	MWWQh6yPLtHfqym2hELwOf5pBewCyblnTgyVaQgVYeu4V4m6GH/8cEu7tgV4pnZT/h4RhLX81lU9f
	v4LPs6X84Im+Gmm28bgOGDDSJYOOXrbkFWcb7uHmfVywnLk3e052NC0fAoEnwVj6r8Vd+RJpHKyEx
	gciahBBU728dkC+baNYCpNaJrOEX6UEUlyxQAGE5AenipNWjNex0WVPaqqoQVwTRmI+mDiczCfpZO
	ofOB/C5VWtlX/ELSiZ8niswIUmbnv91qA4dB/v4V3zbslK2UxB0VaavlvchgXfzgaW5rgCKQx1+Pd
	BMOGLFUQ==;
Received: from ink by minute.unseen.parts with local (Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1td4bI-00078H-1x;
	Wed, 29 Jan 2025 10:43:12 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] alpha: make stack 16-byte aligned (most cases)
Date: Wed, 29 Jan 2025 10:43:11 +0100
Message-Id: <20250129094312.27399-4-ink@unseen.parts>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129094312.27399-1-ink@unseen.parts>
References: <20250129094312.27399-1-ink@unseen.parts>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add padding between the PAL-saved and kernel-saved registers
so that 'struct pt_regs' have an even number of 64-bit words.
This makes the stack properly aligned for most of the kernel
code, except two handlers which need special threatment.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Ivan Kokshaysky <ink@unseen.parts>
---
 arch/alpha/include/asm/ptrace.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 693d4c5b4dc7..694b82ca62f3 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -41,6 +41,8 @@ struct pt_regs {
 	unsigned long trap_a0;
 	unsigned long trap_a1;
 	unsigned long trap_a2;
+/* This makes the stack 16-byte aligned as GCC expects */
+	unsigned long __pad0;
 /* These are saved by PAL-code: */
 	unsigned long ps;
 	unsigned long pc;
-- 
2.39.5

