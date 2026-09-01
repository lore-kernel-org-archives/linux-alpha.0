Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D243BDA0
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277851; cv=none; b=tL0vEvmjzSM6lOB1oQO3U19tN/CN+WyiaXrr42Sza1rSAICOWp8tK8bpOysQWoQSH0SHE2vs7g4Ua5HTgfZJzJ16YliXS9hPxQIfirB/borWOvFpDWk8BMj+odF23ssDef8xOST+KDqweSaA/dSOKcNJkk/NysQG0VUi/Vg42Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277851; c=relaxed/simple;
	bh=xUCke3sjfloFXK5xgzPFJXFZoorDrkSXZ+p50ZKJuys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUWxYJ/ElGLOde5o0GTny50HAIWFwQQQATQDBLc9A/N9ykka2HLX6nDOGfEuGimoVZsZrMpDnqyyC3OTc2gy/f48ltMQQG0WfOBpT40vW5sZkI0iJTC65IU+XJd9Dgx341S+7s3Q2TiglZaz5oDmKJaxvb2AeETgO1BuNvjfuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJcg6OWs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJcg6OWs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-861f30636f9so1422207b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277849; x=1788882649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pg5APz92OrIInYvba8j1nyYuT4yBZOn6rThGWlzRCeM=;
        b=pJcg6OWsrbwEIw9H73QtQuAX+4Rf+kU5bBp15O2Ou9P/OejHZPuUxs+u4UvS+qNjr8
         FlCT7tuep0aatHlZCYw+9jQ9NHsgyEaoeKS/SoGyhnaf1dETtzNtdxfW2vGQPg7D/JF/
         Qah3K6QGmTLXHFowKC121W72gMP5phhvsK34ejv5JkFMlSJs1PW9ktxRAJ8l3isXEAqg
         kFzJ4u3/ijo2aMrtFuQdHpvY7KYbJbPBWG7QDRCDGiZ6FZl7IMmTiVDiGwZTrV8JvhTz
         NX0mQRGyp8kVin1b1QCqEEUqz8+cFy/Qrpivleaqw/PwaAOmm2ePBt0llQFmV/AzEAZ5
         ARTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277849; x=1788882649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pg5APz92OrIInYvba8j1nyYuT4yBZOn6rThGWlzRCeM=;
        b=rv5SS313VIWtChyBrxWpAwt1Pf5ltN9dQsUo6dGKsk2vKqX5ekKB/eMspGypHE0K8r
         ltS79eja0V08Fxu4OQ+AqZPS1HPe2OfIZhnziQ6tXX9PPkd37+3ss5bYaAO9VPICFncI
         paYaq4QF/KA1k2yOlvDvMAoE9wgNYiisvw66IBIGod8S+WKNspI38mTVXFuhiX68eFRy
         lPvp10guVMer5Y9YYFmYvljSdBRFJLCLeuokkMUrpDkkqyB/RuLV3dsoXxQu5ylDGZca
         /dm7JVVx9A0a+AcNXeO1Q5aG/kl60zRKFedt4NsnDTzfJ4GvxpmpdueMX6v5SeswcS3t
         hm1A==
X-Gm-Message-State: AFuF++ky9iQA+BykrtehiMo/OogW9D3vi2EIEc/vWyMjhBVXNO1JE25P
	ISZeX41qs+2+2HDYOjnBaXdKhDXODtahyeylBIO6nG2L++kj81RMDLw+T8WvhQ==
X-Gm-Gg: AYBFou3JJ8nhYrlBGuLeFKL4oLq/FFGmWoguEF57lV3QeTxzJ5tLJYkeip9pVZMSZjz
	b7eMTynkjz8+EKSnCifT/y2yzywSLb0QYVaNhAir7fHL26QAcjYuY0nDUWVWH+gJQgwIlz0FE1B
	3apq/cEUMCAaj1mW8zR113eEFidARdpmr3EFMbbkuJudYGInGeRBD1bvB9tYWFY3sGxY2l3U8n5
	yDflTiB6ZSh51UiN5ibB2oKdBE2gG2vFmcNlGl4319mroLUBywnLj6YIT1Nw/R/vKH0kOLDvo3O
	rb3ttzYyTDYWf8OQ5bt4f9DFL62eKViZrf7pr94/cEWxFXGU/FvOUTfI9mqt2sTjJsOs8FZozf4
	GjXmvq6/LY0xHhZi/uxEQdQ40KDapeuu9FlUxEm+mnYs9Iq2RpebHOBrjMQBr7IPMp9AgiWdHMI
	E/keZlj5K3UEgzOO4YFPf6b5EWVbIO1oO8zIEN2Za5ChlsfYKXeOxTx/++QfTzJN3Gy7CsUVvEx
	MwcqYo3TCic7RSOq4r+IrH1D/xTmO8PeWhgHM1S6w==
X-Received: by 2002:a05:690c:10:b0:81e:8d96:a64 with SMTP id 00721157ae682-85d675383admr140102337b3.13.1788277848841;
        Tue, 01 Sep 2026 08:50:48 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abb13asm76661837b3.36.2026.09.01.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
Date: Tue,  1 Sep 2026 11:50:16 -0400
Message-ID: <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
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

GCC's undefined behavior sanitizer has no architecture-specific runtime
requirements. Enable it for Alpha to allow UBSAN instrumentation of the
kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index e53ef2d88463..1aa76a2d9750 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
-- 
2.54.0

