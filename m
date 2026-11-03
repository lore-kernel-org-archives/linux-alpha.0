Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742195;
	b=Lnany2pmQ3l+9JwBitEEdldBk6O9WSZGAfrYVD8Zqf3bkJW87ndM9DaDNSIhMLqktbBJ
	 usJ4omlm8eYf5avKxYxuu73AIrbKWps07HaLxMmovAb5R2u/lYB9efhRPdLboaau6nhIU
	 0iSSo4kqjaJCpmP1LfVoqn0BpQF0detXnfNh1Y9hJTBuMo3MFI/V3TtecqwcuRiBGRnyx
	 yby8MUX3A7WQn6PRtlK+CgllC41HNT1kUrhOAEDp1F7DO42TSgd9NFD7AssWfO+35bs36
	 hxDZ0DJCTj6Xn57r6tGIMTFvhfUkmerDlbt8s4wVu6UHluF9cc5AojenaH1CowfgwRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
	b=P6eH3NzrnR7nH1hWICqCER9UKQFrlLN9+XV0DVl8E06YxrNP1feNjifQHaY3SQPHne12
	 2m58FS9fX55Uj7Ok6zI54naw6FHyyEEzMD2BWWuPsXcAqoNxqJJryOdZSCpCpXKOgu/s/
	 tAs9De3LxRQJp4UGl8LosiSNCcygPfZWoXWxut6EAJoJgyVwDND4NfcmU+TuVdM6X5TRQ
	 4F1QFthxlbnzpibOS60XpBuGO6nlIEoN4ySBD4BzZIW3Y8pGsF4CQaxWGufNpY6ssZ6E5
	 6/ab7eERsffvd+lblzgla/X3ooGMgaC1krKfo0GnFmKEIuWOEmzGG2VqGHsg0JPMJyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5CHPewS;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BF606A32E
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393BF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5CHPewS
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso6889114a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742194; x=1794346994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
        b=A5CHPewSGSTU2oeHArS+Of4cmMXag/WzykuQsiv+SZXPrjYlsQGklY6SHJ59b2R5Pu
         xDqfKMN0Hal/bA7PPxq8uR/fD0gM3HHz41jMUmDsFm+nwBbYFNirdgIn2Gy+EvbyvgV+
         Gqi1iUw1jlYykhd+2Rx7CUwTVVPUl+/wx2iLlOG41MWANizqlcIxA5AgLpprwAQKYgpm
         Hv8Jn4h5hczWt27TiFa9kt09R/Q+vnjJTBBHfU1FeN7zPUYNXpaO5xBK7OpcaBfuJ7WO
         2juceEhWRVEveMlYMoy+PkFmqHtTqARMwhNgoJIBC1GL4Nys2eLanVSgRNDhDtJSw1vI
         gSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742194; x=1794346994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
        b=ewul8I1LG+4olMc6gwx0ioyyvnzO9bRmJ1UAVAsHDWPCBH7QxM5USohCSNrvQb9TJy
         h5qTU18X7fxfhvZhExVVoEc/YWjlQtbTrX0mtoiuXwwJn5aN05AC5mHJYEA+SOrOVVy1
         8g5c9VcKmzzwYsutOL20OnvtBPqmzuugu2puPe+OI4O/ttUYX3SwntjXj2fPtfknMI7y
         rZ6TR2veADTDcx+6fHqJ5zx9jgLq+cJuDlnNmKe1OhSPDibEHJx5uoNARqJPQVj9vMJa
         XNyA4rwqYMtGp8yuOew+fFaNXgdkHB9g+DraAkI7+0v61RzYDwHUxjZkicH534WK4YJp
         pmTA==
X-Forwarded-Encrypted: i=1; AKwUvBzqyYh/XIcsmeYw89p6kuK6AmI8QwaoPzNk4dPpVIRZdsIN3YBZbETMe2yXH/DD2QGqPh5aX2mres7RvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YRmDcW6pKHu3DvLFuZnMXsEcSZj2I9cAHHpXju+jOjm6p+avv
	PRbKDa63nqP4yNpyHCrS1q8CPU7hMcEXE/L/PpcT+dQCb9xdtXIBdBCJ
X-Gm-Gg: AYBFou3peY3sL08bfwE5dEQv5gitWi/Tfb9ftV6ONAUhxc68BrlDb6Rr6MGWq4DYZka
	PpTaV0rb79X3pZV7Vmy0K9X3DIpmMQjrXkm7W2rBbdPeGbE5jpUqhaPCJfdLNFf+ryGaqHDMRCS
	Lw3kUajf9q0sbujgbGbC9MgO1RkIr6Y9pSAVsW7YY/Abk/QIIxpWPnjHAVdEuwDSJDW7Pcurbls
	3oySX55qb3Mwk+sNaK+zOK5GIb/o4UuvNaB06SQJ4IvF30InfDV3ysE0+n4FocQB+lDDPU704oN
	nL3c2HD8i8oYuCnA/YVv6lP8TLW2JzHd+XR2oJe7tprmwAx9MLaD2AXRo2DuBnUWypfCVRvC6Rs
	CC+IGk62DU7kBtUPOaXVuDHHH4PYnkjhnZyKTxiNThgEepmKCkMEcrUJrZNHt+40ck78uEINRN3
	YjZQV8KtB2jb94/vbxWIVfoHp8VmTvxWrDV4+gwojf4Nr5rHO+72C2fpX7wnsyA01crHsej/9FJ
	8x9Lyr5tGbY8h645BN2KgrGJIy9+zEmJKVDk1UpOpmGpNAiv+DH8knuA8SCEZa4EKyeTwsX1vUS
	e/+aeG7pWanU+bwDlSByRQQlpFbSClfwc1iTzvtEmIgybDd5xnuBeFYNT5G/gXMK76r0hgc=
X-Received: by 2002:a05:6402:90c:b0:6aa:f0e:a15f with SMTP id 4fb4d7f45d1cf-6b4d534badfmr10647171a12.38.1793742193445;
        Tue, 03 Nov 2026 13:43:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:12 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 01/14] alpha: fix saved registers in page-fault oops dumps
Date: Tue,  3 Nov 2026 22:35:07 +0100
Message-ID: <20261103214120.1099893-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aligned exception frame moved r9-r15 back by one word. Adjust the
pointer passed to die_if_kernel() so s0-s6 show the correct registers.

Fixes: 3b35a171060f ("alpha: align stack for page fault and user unaligned trap handlers")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 3dfeb854f196387d8c8f709d0ce355e5145035fb..f09f69894cfd65d814ab1cf498c946043fb9e8a3 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -244,7 +244,7 @@ retry:
 	   terminate things with extreme prejudice.  */
 	printk(KERN_ALERT "Unable to handle kernel paging request at "
 	       "virtual address %016lx\n", address);
-	die_if_kernel("Oops", regs, cause, (unsigned long*)regs - 16);
+	die_if_kernel("Oops", regs, cause, (unsigned long *)regs - 17);
 	make_task_dead(SIGKILL);
 
 	/* We ran out of memory, or some other thing happened to us that
-- 
2.43.0

