Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570714;
	b=sdAZfIA3BOIVp6hTxKsECbs9gBQcvvXKfa5LRb++zXOSdwpbxn7XfGjWVpJsBFVW/nKD
	 sYv3YRcSkbK50ltfVscR2IPkZ0/FLPZ9ddSoxV2qVLb5TVqPgrIwyN+I/Ae2aTv/qOz4W
	 Db6KJ2lUA05tTjkVD9TouwE+45lwqZD8lfdJ8F3UPXZeImcaHB9rnvm3mGRbdG79CIb/o
	 5CXeudHCPBQVTSnPsb85V0PcvV6ZLqDxZHhZ2oaswxgs1Y5x+cxtLiLDYmQPVTd1uKAtO
	 nyaXwiEXER0j1ho4bL6vvexdTHgcbj8Vkm2D7Y7xuP9XpmL6+Ntxk4kUvd28I5BCCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570714;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=IY2F+wfJJLE7QTBEz+Gw5dvpjPFntijM9lFkvGdJlI8=;
	b=KhfZQObgmeW477ZqUl/DarVCf5jp+YG38ZXkNKCyVc9PNfE3PgfiOx3RsbRHFVg/BqPH
	 rZi8UMbhGJvZq1WA9UEfONjHsfP0bw2ITK9GyI0SMjGwyujM1hzoaI+LbqzDz05g1W1p2
	 y+ydW6EEqMoYAqB8L8amFpZxqx5aIZwOZm3s03Yjq1R1IVHgvf/YCVvrLO9dPkyq+WJHR
	 Wg80mMtrui3uyFoB7+20HWh7jkckc73IuiV+nfqEhAMQhrjttln4losGGinU3oYiJyzha
	 9KlPoW5R6fGU6gwScdACldRs70aiLRcjhbV2mZVpF9Gfj24b9brRZea53Bu/ydi0v0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RQyHNmrZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cNzaQLtT;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDD606A319;
	Wed, 21 Oct 2026 08:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1EDD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RQyHNmrZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cNzaQLtT
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792570712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IY2F+wfJJLE7QTBEz+Gw5dvpjPFntijM9lFkvGdJlI8=;
	b=RQyHNmrZww6sLn7mTkY/kuEg2gFMLYXql0GelVlyizf5xeoFhR2yCrFXPchXwOmRYblOiN
	U0uLe0LHnHGuPadMTcoeHqm4E0JGFLDvfLewLPHkep6vTJADWsZ+tDWn363ZQuxc0hUSBg
	/WwrcSfGRTDNjcUMossIhPhhTBwKDYbUstkaqOmks1OZDzxd1SoHwjv6rvedAOKzxwIC/N
	4xEiskGQ95TzqnaqClApfEAnwxIlkLlQIXBPtkSKsHC5rsrth5pEVrXkUqAdpv28KB/s5c
	kz8lJy+PI12SAOlHOrVFJI6HH/SL+Gq11NwKwPhkMS49N8sTP6leqiZj20xuHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792570712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IY2F+wfJJLE7QTBEz+Gw5dvpjPFntijM9lFkvGdJlI8=;
	b=cNzaQLtT25cqMrfZw4KpFI7wdOefNZ5W+8AASuVu1kP/zlBcux2Mu14spebCS8MsRReMYX
	4F6RHraUOKJ3XhBA==
Date: Wed, 21 Oct 2026 10:18:22 +0200
Subject: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBPUIqirRMSkYw1EyRgSRHdPW
 r7F/w8kEqYEQ/WAUObE51Fg6grchsdKin0xWG07o61RuMcNVSQJs9A6Z9zZ40XK9YtG07bBNw5
 KHYUC3/95nN73A20ikJ1pAAAA
X-Change-ID: 20261021-alpha-perf_reg_validate-c9b0a144fd3c
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dapeng Mi <dapeng1.mi@linux.intel.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792570706; l=1985;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Q4rXZuBSRnIAPg8x+Q9NQB2obQkKeyA+KIOZ9kLrLwk=;
 b=L+4IXPXaDQGDLdRrNS3KNv2RXXNFhZYhOV/QcXZq4bBGqI4cw+G4oDY+nHbshrTLXGhzRmvyn
 DlMfi/nFjs9C16+LsmLPNqrmYRKKlvlzF/IioUWY8UYO8ENThV6pby7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Align the alpha function with the generic function signature.
The alpha function was added in commit 9280e99d87dd ("alpha: add
HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support") while the
generic function signature was changed in commit a2c64c74c029 ("perf:
Enhance perf_reg_validate() with simd_enabled argument").

After both commits landed in Linus' tree the signatures now differ,
resulting in a build error:

arch/alpha/kernel/perf_regs.c:46:5: error: conflicting types for 'perf_reg_validate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
   46 | int perf_reg_validate(u64 mask)
      |     ^~~~~~~~~~~~~~~~~
In file included from include/linux/perf_event.h:50,
                 from arch/alpha/kernel/perf_regs.c:4:
include/linux/perf_regs.h:13:5: note: previous declaration of 'perf_reg_validate' with type 'int(u64,  bool)' {aka 'int(long long unsigned int,  _Bool)'}
   13 | int perf_reg_validate(u64 mask, bool simd_enabled);
      |     ^~~~~~~~~~~~~~~~~

Add the missing argument.

Fixes: 742f62b63904 ("Merge tag 'alpha-for-v7.4-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/alpha/kernel/perf_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e831ba0..c5a55bfa15a5 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -43,7 +43,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
 }
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;

---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20261021-alpha-perf_reg_validate-c9b0a144fd3c

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

