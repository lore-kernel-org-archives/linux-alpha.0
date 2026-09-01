Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285CF43CE5D
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277846; cv=none; b=GYKhCWGw+sSn6okaB4jInhIxmR7OTNZ8TQc0EY6yBiaYZ7+kqwX+FmAJL9+bxxoS6wRXCN4XI9+/Kkp8Ue7TU7AHfMyRYmsYIX37SZbifKLvaSmV1OBByhmqCiJimZcyBOri7jYE+8qdXizzBJWjVZlgaYWlQ80R12RDBMHWYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277846; c=relaxed/simple;
	bh=LaASHcif0ZO5mEMBMmjQk7QLwYtaZyoz/QtaPMMMSaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKDK+Bxg9Ik84J+lhdNUDdhw2ZuLX+Uwm7V1WoCVAVsY7C+UWNy/SoF7GjC6JMjKoEHeXag8dpQR/rrTVRYfNzwHmHm9E4uS6Sf5tSwcqIyOxiJj/sApWKO2peV0VuaHy1Ef6RpqrLkgcFTnlvmVbm1l7r7qMdmVF0RbQcZ81fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLIpUJ8h; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLIpUJ8h"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8623b1e7cb2so1220547b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277844; x=1788882644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWX8TqXr2ZPFEECnMws3VbOREQ8Oks1Jtc6uvGCOwXw=;
        b=KLIpUJ8hJe7oR4Q1k+ThBSk2ElToSUcl6ixnZ3TdQM1FVQpnXelE3dDenwgBZj3XYw
         XRp5s1tGnMm8DHDdm5WRDf+PtYKKfuqd559blrdA6bvYi1T3WQ+k4Dkq0YTBS2NxqT5m
         v4eRo8cb24yJ6sHMFsG3yQXYWzVnNc//4K18npHd8gXpmwIC+39lZWv7jmB1INfL27uj
         0RdAS2iJX4+cDIEc+VZiGsdrnNDYsAa25ZtTACLIPaOeuXfM/qTeo5b+r53vrPGXoA6h
         6RYRAmgyLtLD0yPJ6ZaeC9ol9WjVL8yn6v8tfF3qUR0IJXi2pOYIE5UhEW14/5IUjdU/
         dJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277844; x=1788882644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWX8TqXr2ZPFEECnMws3VbOREQ8Oks1Jtc6uvGCOwXw=;
        b=GxITChgcbvwUlK0qeXHgP/byNrjwwqbfELVlrFzn01xaBw1i2shxID4CjFXmZs7bvk
         RoX0Rjk0cQFRH2b4U19ATGnHWr4I5Z7D7yD2+JtgFk3Vuucy05TRhaNZ2k4WgFd9CKQv
         YX4NILAlSGUYL3O7rx33RGG66oGlCmzvXfUA8qMOUJ/P2MlhSj9oqUdRVUgiYuZuElew
         5V5mY36iFA/yf0YQGwsS7R85qEuqUJxKB282jxi6AVP+czJtXvnnGtwNpvNc0Slvvr+n
         RejGSIesix8KV5xVkbLJCuEK0tgfIOgBHvvWQlnZF6tScGQS7Nalk2+WzA8fQzFJlVw0
         WJ+Q==
X-Gm-Message-State: AFuF++naxm8FAp335/qWHK+Ln97pJp79QSU0PPo7RCLJqQvkbSzv7hAU
	tS3cZklMYPE0VTitKKytVgrMFTbJOj3ryBoz6oU+Q6PoQtjq+wBl/fY+TuFPnA==
X-Gm-Gg: AYBFou01WUDTR3aBPFeHAT3C36UmTwBJkBvlBddrUDCCprpYaPGIseU041M1av7GbSe
	i6S6U/nLNLmJvpluUH9K1K0oWlAsIURMzVAzz1rEQKKZeByV+45QMUf7/eDd1D/6hWanNXkljvO
	Rf753XCsGPNHqRHyuvGbQ6A6tplEpMsLfrtOmrYRqxT8OfuLySXJ/youFO3qF8PXCGsSgcCw5VE
	DSa6bw9RR74FNTY0+PZ+gaGRZDKIuReFCbSTxc7l/yazQdagZ9IkRU6NEoy0Wd/pSoKDZCeTHcH
	Im5UnyLS4hjrSubS9SqpXGMTxABr7muitbjdnabURVZ0aKtS1kEQ4fK3G7C4nODB6xLGL2eDCPi
	kdUpa59I+ZFnFy3cMDv0fhAQg5XJ9Q8FtNn7qlVrEm6Rn/4r7VXyCozUd6BLkTf/FS49nGt+5j5
	2mGXoclDk32IHp8fnoI0kt8m0xvMRb5uic6geI12iVEM3TeP7QJ6Mby9rdskLHm+StgMYCyL25Z
	BgO2TUyrperwxGtw+Wq3G3+yTTpByuwkrCwS3op
X-Received: by 2002:a05:690e:2250:b0:66d:150a:e7b2 with SMTP id 956f58d0204a3-66f978c8acemr11024d50.23.1788277843907;
        Tue, 01 Sep 2026 08:50:43 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1d87sm8520666d50.12.2026.09.01.08.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/24] alpha: enter hardirq context before looking up the irq descriptor
Date: Tue,  1 Sep 2026 11:50:15 -0400
Message-ID: <3c54e7e410438437640d56501a7a46fb0443427d.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_irq() called irq_to_desc() before irq_enter(), so that lookup ran
with the preempt count still saying task context and with RCU not yet
watching.  Generic code called from an interrupt handler should see
hardirq context, and irq_to_desc() is more than an array index once
SPARSE_IRQ is in use.

Move irq_enter() to the top of the function and add the matching
irq_exit() to the invalid interrupt path.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git ./arch/alpha/kernel/irq.c ./arch/alpha/kernel/irq.c
index 4a6a8b1d5a8b..5867a1655045 100644
--- ./arch/alpha/kernel/irq.c
+++ ./arch/alpha/kernel/irq.c
@@ -107,18 +107,21 @@ handle_irq(int irq)
 	 * handled by some other CPU. (or is disabled)
 	 */
 	static unsigned int illegal_count=0;
-	struct irq_desc *desc = irq_to_desc(irq);
-	
+	struct irq_desc *desc;
+
+	irq_enter();
+
+	desc = irq_to_desc(irq);
 	if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
 	    illegal_count < MAX_ILLEGAL_IRQS)) {
 		irq_err_count++;
 		illegal_count++;
 		printk(KERN_CRIT "device_interrupt: invalid interrupt %d\n",
 		       irq);
+		irq_exit();
 		return;
 	}
 
-	irq_enter();
 	generic_handle_irq_desc(desc);
 	irq_exit();
 }
-- 
2.54.0

