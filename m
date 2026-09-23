Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4031456DF9
	for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149776; cv=none; b=VqefGEHKkpovzTa27UVRzaHW8WI4gqP6Wtvd5dkWZi+mv2hDhgZ2vFJacanNmA4dWpJUsWCJXWD6PMWCDJsmkYBacsVPOLM/flxyi34afsK6FpTTTvSGfBHC3deLj8v1OFHyXbDKPy04M4yaURp3cFurs5d9hjIHeKI5MUA3+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149776; c=relaxed/simple;
	bh=Zu69g6v5S8vhGKdq/iPnSasKRWHYaHTkJh8eXNyDYUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+4DVz0sCS/5Hyjp2qyTOnLtMfHo/gTmx13E7WKAE7vS+MyFc90yRwgGCZNXdOskGgzMDmdCVPmhUbCLB3y5HccUd51F2opAoJnP+CF/x3BtPIU2E/3aAoEKpZZZsQp4f6falWNDIMCgk0ImQ9vsJR+L9QgO7BD8gvH3yYu9c6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGMn0aaU; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGMn0aaU"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso73032766b.3
        for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149773; x=1790754573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPkz1wN17U9MxOLoHBvnqPKic16Tys9ZaXdqgOxKkNA=;
        b=pGMn0aaUoGkieGGLTw0frA6npJ/zb3fkdjBrCJLKwdPwFxrViAM+6BCtIJg6JNiA7K
         l4u5GcnConSyfOf6OY3jQKixwy/h2YhrYZAx69vVXxhT0KA510UW9iRgbotfwfztUDa/
         wE8nvryB0Q+wP7tl8QFkpjyJTC9YLyoAQ+HlZU7S6Iqr9y35lSMjMymgA4M8i56uy8wV
         /bFJUQNimoNe9JUa+qGQHB+CvI3T6AQdFnOXONq601Am7aDdTVYc7sSV1MS0g5cn1os9
         HhJq4Q50eiGnytmGJFISETTKC2smp93pK08HX7/ti8koqQdGORnYVzaksSteepue8m4w
         pxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149773; x=1790754573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPkz1wN17U9MxOLoHBvnqPKic16Tys9ZaXdqgOxKkNA=;
        b=vHYkpXk1vSnTRnxQXRshwif+uFetG/vXP+rDX6bgqkYIb8n/pmNWheYirnsypxH9ck
         dDMAREJyqZMNvVJsX6DmDAWPPEdGQDUHJD0ZD0OWHNvUZmoDEaNShTVyhhWiGEfKUsA8
         yA8Ar1LAL+8tE7z6UHzWMUeN2afc8HKu1HiT/WguB2I76ZdlLc3IUvDdqI5a5RUe+sDS
         7+3Djh1Gh2kdgawGKJvMIARyaIN/VRR4f9mGC/daQnOkjGhV0bKk4i0c746YlMdw/JUD
         BCUylDHMt1EkTa/wfGyEnBGobckxoTKM10GwbMfFQFzwVb+H3WOq6NLAOBUkig7XNpk1
         3oJg==
X-Forwarded-Encrypted: i=1; AKwUvByXmTR4LF+w20vIFe+sFxoGLQB7Zt0yOyx4Rnvk9/L7TNzy26ILApGYD9y3DQ+VhzwtWR4DVEtmBEPZpg==@vger.kernel.org
X-Gm-Message-State: AFuF++mR4V5xC34cKXf8a2Eo1ii1ceUyIcwFQXfRnYKhxf+gyNSJo5dk
	k7Y/KLe17xKYSdwcpHdeUIHQJhRXCgngFFiwbqytml9PC9Ru65PdFUxI
X-Gm-Gg: AYBFou3AMKbakjV5UOzDhr5LV8enHyVreWwD4dLYL6Cd9YDVoDl+78cl9aTTe2u3c4h
	7H3q5x/YY+tJ8Xk6j/18F9jxFshTyGOlrh+NcGyG5xDIy/TCtp7SqNif+trEYNx9YOJAQElfEsc
	dkwJsFJjqbwq7JAj28uAolhSotjzm/zmjfXQtD8LDJgVTO2C/gYgxupQWKo4c6uaf2imxo1Ia5s
	X7t5jMbXJVKlEgSU85gMGDG+A9CupYS33XrKrFRqTjFKzs4/kU2fHOisMRYXgY4vZ2kD4cprr2i
	GNpUU9yTEUQk3CjkT3xdUxfQrCMNpvpz9PHPCFij+CElUtEoRjd9uH/R6efXlaMkVgQmPSUuV4F
	0ghCq50sReSEC46Nv0/V7xgELvo1FXPgoICZ/Wcle4LVYkFxNTMeTfwF/lK0RiBt7S0Pe/0NdH1
	DB6wb6PhfAuBAbOjEIojpsNXFlAgRFmNAoc7dWk0IpHokY+2jMa5ShvLz2rXiqyoysw7neUtjYu
	vCuuVh6rL//yW9G+fB7pbNu/iHTxmsUCpt1jYpo
X-Received: by 2002:a17:906:6a0d:b0:c26:1648:a06f with SMTP id a640c23a62f3a-c2aadfe6800mr123445866b.42.1790149772657;
        Wed, 23 Sep 2026 00:49:32 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:32 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 4/7] alpha: invalidate the local context in flush_tlb_page()
Date: Wed, 23 Sep 2026 09:47:47 +0200
Message-ID: <20260923074903.862898-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the target mm is not current, flush_tlb_page() does nothing locally,
and smp_call_function() reaches only the other CPUs. This CPU may still
hold translations for the mm and can later reuse the old ASN together with
them.

Add the missing else branch. flush_tlb_other() clears mm->context[cpu] so
a fresh ASN is taken at the next switch. With the previous patch this also
covers a lazily borrowed mm, which no longer takes the targeted path.

The uniprocessor implementations of flush_tlb_mm() and
flush_icache_user_page() in asm/tlbflush.h and asm/cacheflush.h already
contain exactly this branch.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 7856d23b3384..a5a42ae4a7d8 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -698,6 +698,9 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	data.vma = vma;
-- 
2.43.0

