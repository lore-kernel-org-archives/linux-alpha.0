Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B39436BFC
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746043; cv=none; b=HSMaNX8cuS8e90BrGg9EucCgPHQ4+EbYQ5deQzbKDVjbaQEGfVn8G0bco5OUvsOXZkaWyLMN4/YsHgq7Aqt4GnSsMNXVtFDObuuN8UrIpOOqxJyF2I1RVnX/Ckm/LJO8G1uKwdps8DmPsB9mBPv2lH8NsnGsrHpD2ff6OnHZTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746043; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwMsv3GSzBXRHoa8hF9Vb8Ky49+n2ZEdsmeyRaGe4p7Pk632KgsLBfaceHjvBABkWai5S9pl2bOEeM/fe1uBdshRuNwIHH6BpTXY08WEntf44ilBbIaCsMqxSg6rF5PxnNYVc7dqmlz90oVw4GIRtBLNcuj7SsjloHh9dYTMuec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmvMaMHp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmvMaMHp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso201810666b.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746040; x=1792350840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=dmvMaMHpa7cxE3HVuvq0zBD9K1Mx/5W5D/ZlsAXlNpS9rUmrEKSqV6kxvUO6ixNEgz
         oUm46/n+rK3cJeoQpMEKc8v3AD6MqZWlRaZlzI5+yItwrjHkoQ37l0XE8HUW+t6anm2+
         myqB4Mf+en7R/U3i/BRF9oc4xcYy5oLwRnoMX8rDioJItL42zzYHP4mSVY2/A/a+czK3
         yGysYKz64743GwaXfXrzQwgCEd+cztPdYaWWn4B03iTN/XFzzKNEJRM+kp+HTpoyZkQ7
         +CMwsTTcaK2ypSVnvQaerfViUuMK9i0fj+0NX7DGmcLPu/1vpTOsjXoNLMeb5etTFotu
         pg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746040; x=1792350840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=UfLpOUnnzEmxSbnpcvgNO6nUIHXklCeXduZNPdBKWfx28fuRUaEhZd+4BS+FrMkQ39
         d9mDk3Ni0pWcnfYufIYUHu+/BMPwXuRbPWuVPscsSZvTObNgC4iur0w9jrlNL9DbXZT2
         a1wF52Nd8IlTDgJatCRq1NSf1WIfQc1o/5b3Ujz9GRWpAxEp1Z1eURJy3fPK8M2LZpmv
         rJ3DMFGo1Exf9eox2NvtWqwNtLOq+XQPkVGP3e6MxwGHwUBp8GvQYATE4DFXAeBosDw8
         RWqj/+AaMcvn/mAjMqOOiSPhhjOxubNTkyMam4KsjL9rQpZC/PvecKRH1BQskqcTSB8N
         mDcA==
X-Forwarded-Encrypted: i=1; AKwUvBxk1rZyHupRsv3pKWkKyt2fVDQZRUOSP/6UvluVMifcW4CCQtzBJaILX76rUDMYvvXjfCdk+6x31ORnew==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCinlrZZPkkGqwv5SX21L/nFoiT4ihP9p8wfzJfvLzogmH61Wc
	JjStlcVItEkLi/SO37nvsXkCP0YqllHMzsUukxLZEKvNV0Jaw2ZgSlz6
X-Gm-Gg: AYBFou2YY2qF0ce9aQCXOiP/1kY54JlLXu5FJdWyV2hBNpkKsztwg3V49kvmy/WXSjE
	XddpjlaKgSRemELINJzdbufKeWDrnE7Dek34FsLOuDeB3KoeIQv9Smn0tkTwXf/6zXzoHgTdpSd
	6rN1y/2XqKBUVVoP9KZXNdyP1YPs32naMlMKYbF5R6exEDfOMFS0spzhIySTHXyvqNr3yD4V9eE
	c1kYHHD0w7Qg0PycmkEENCCC1ita1iJwe6pXn8Hmxeb9ekQUKYqNK/4hrvrdJ0nm0V9ZjmqgI0i
	D6CVD2v0RZgl2jm5xVA82/bxbZM81LP8WvzOnWkgMvQ9XD+P56f1WO5LRH8eW4ikhGK2g/oat2D
	lsWuWj2tiuEw6Hv8nt3q5IQdN7kR5DkrvD/iS0DSGgxnIylTdAvTegYptJi4DZLYMFeiro0Qy+c
	AgZVwWOm5hp4S/TyLDz426x66/BsbLwwe+UufWaTJaOvOiaF2ygMUD0aiysZvxiEJi45RmVivGi
	D4GMBTgRmrvHKiEuYUZTkKeTqYNR0L9htT1dmyD
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c31aa017261mr838762066b.24.1791746039767;
        Sun, 11 Oct 2026 12:13:59 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:13:59 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 2/6] alpha: describe the Tsunami system machine check frame
Date: Sun, 11 Oct 2026 21:12:49 +0200
Message-ID: <20261011191344.981000-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0

