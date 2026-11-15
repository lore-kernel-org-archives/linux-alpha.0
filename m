Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739096;
	b=W5icSV6EcgcFBJigbIITZCkhtENR4px4Gsb2Q6V3h0li9ko6Mz6op6JkYbJiuQpEnmf4
	 pDyyEBn36aYtoy6pDRf/LYlO21Fy9WiApEza4Z++EIbrZQhVX96DEsWvBzlj68W9JI5NH
	 d/QUIFT/4aguRfI2KIWSaeJbNukpaFSs1HlXm6sh1naUJk1iE2tcoZzJ5wiHJqKvomweK
	 qiyinD6k6s11Jk55kLcQtnVONBY4wpVMLiU7L3y9EBoi94FgkTeqs1kqNvNHg6I0+oobD
	 hnSFbaq4UuhYHag4UiZfs8j/87r0fF3hx7o8nBUrjbDgMYh3cWd8NaSw8KlYLJHKBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
	b=Pb1c/DoWw8xNhc4NqIcx8juRiJkrCSbNb3jSf6V5jfVhld04rxBV19uHfXITgFMQhTsA
	 bzCJN23jctTJ1n94ezldowPhYmY1LwTW2jYKpsVZVtg8KvNMeGx63eQ87lyIA/hI+MCGB
	 qpCQpApi9SVnjR9Ynain9QoowxaQvtE+mRYP/O7212vhGLsi3evJ3I7rewg9Pz9Y9vGv+
	 MzWFv1LuJTxjTY28iG7IqLcLHoQDjMlTHP+HZZ0LMVoDKBhxmytGGpZKwT48HrrhMN0rk
	 GlpUTxiClBYNjMQcDK5/8WuoSktlI3Vo1aHQUOj98UNiXswz7FRPc0GTAo8fy3S5OGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOrh6nLT;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F153606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F153606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOrh6nLT
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so24274071fa.3
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739094; x=1795343894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
        b=cOrh6nLTyvSrvI/8qt1U7g6cHJ/cqqpt8hhN+S3kOLMbwJVkfu89LuJj75df0azoHg
         NGbeyKkHyLep3fbsxp9pswcfO8TAIlnUm/ExDWzEFAseXYfjwY+RfQEEc2w3WpfNI1Ik
         fPgW/1Gk+XU2TABTNohyZjCp5O9fxoYAxPjfzlysC8uKDqFNrATzthvvk9+VLmtrHJM7
         4AO/rK6jTfPdly7A8e7y3yX5FPJk2OBAi05oUm5K2DZiLUwA0zaKvsxN6zMQqFWzaNvO
         pO92o6CvtHXeVApLCpUNJKvOMKggRnPqjUsIqzcm7uumvQziNPPGoYBXnohsUc/7s5Zb
         B1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739094; x=1795343894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
        b=ctzCWkBxzB6cM3rU55yotat7ReXg9/w+Bu9HJ3KWu7Nn2lIh9/kLPeW7g/1OBr7kUm
         7jn7r3eMe4nI1bmgGSrj/N8+5xTPrxJWepiPsbOrhKaVcoYIM1DqAmnV+z6vIiIk9p2+
         TDTPnACsg0h8vdVPYRQMdfX3nfk3kXmfnY+/r5u/33P2Jhm4RL+2Fv3aNf3pAFEBcbld
         zD+Nie19wQjd+Urhg+vTt/wFhqSxjIVcA0sUEgFcxwwi+1tbOJEVLYw8ndDjnIlF2sbL
         Kk36DZBNiPsl1Vxo+AJcIWGQVyf9BTdFZIS39YIMJiY0kAeIrdWCYTlK90emsfU8Ji92
         rs8g==
X-Forwarded-Encrypted: i=1; AL+hErGKkV02tkbwkXD2kyZ2GhyuYA3GlUE4Z7rGkf/8zF6EOKjX/ug8LY/GYVqGqfR9nJxKRYMmkVrY6dgTCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z89VIH0pccYaEGmbaMstbC+psnAT5l9rZHbEhzm8xECSCpYs316
	rjJ2tg8Qt5Zv2jmsnIRkd+bYJOzZN6SaTqFVyIYJFnxu3hhWW4yP2e799uYQPqJj
X-Gm-Gg: AYBFou0mCE8ZUdylZl49BTMmdtWgtkoN/1pgverkimBDQFyTuLlOM3SRYUbwNN5idfO
	TseeKEyLKZcVc7tRyaI3KimS7tqisP86e+VH4SQd49/9gq5+/rMLJUAj6SsV137TZYlXR8xl+9X
	cLm5hs7SIJEkUWLd9cMH+k+KuJzdnj59u7ZU+BWu/VTtb7OSIE5PyRODy4RefEwcRu2Hpp/vO4F
	1JsaV2UvSSPStUd8CBMiu89jihcftX1C98llCUpFmvW7VZF+RjMD0NA8B49HsiCy60FKTjBkzhZ
	iaAbmoMjzXK8cyx+mk6wmbSRilZUXg7yTGeEf81JRU3/y7fmI1I14hxqlhd0HoIzO9ospPtzYd/
	uGwxYUD72tfaGs5NNgany6+UEV72M883Mu1XzWuByY+TRN3Duaa6jB+kl+KOgplingWYyjd1yUw
	o3wx803w0uhlEenm3D++ST8qlFY3vbUNOYADX3ydW3HahS4XkimYDPGxsj5erpcIp0ugf23gV2+
	ezP/XfisVS9AYjBFN2knRMxB8WYFVq+YX3MEhjLxsn6HKSFFub8cXSUl40mCPY8ce/O9dRgjkFH
	nK9b7FLHCMio8vzfJIN5xgnUli9tJbMEjKpaiXXdQ0ZGyE2/Z+/Y/uMrZ1bVgWRSzjA4EvZ7
X-Received: by 2002:a05:651c:1b0e:b0:3aa:fcfc:aa9b with SMTP id 38308e7fff4ca-3ae2b536dafmr23039231fa.27.1794739093624;
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/2] alpha: enable DMA CMA support
Date: Sun, 15 Nov 2026 11:37:41 +0100
Message-ID: <20261115103809.1288167-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Changes since v2, following Matt Turner's review:

- Initialize jump labels before parsing early parameters, so handlers
  can safely change static keys. Carry Matt's Reviewed-by on patch 1.
- Page-align sizes in both coherent allocation and free. The CMA helper
  assumes a page-aligned size; truncating an unaligned request can cause
  an undersized allocation, an overwrite, and release of unowned pages.
- Change the failure message to "allocation failed".

V2 was boot-tested on a three-CPU AlphaServer ES40 with cma=64M,
including 32 MiB, 24 KiB and 8 KiB allocation tests and GFP_ATOMIC
bypass checks. All of those sizes were page multiples, so they did
not exercise the alignment bug. Those results are not validation
of v3; build and runtime validation of this revision remain pending.

Planned regression cases include 12 KiB and 20 KiB requests, checking
zeroing, mapped size, and allocation/release accounting against the
page-rounded size on each CPU. Repeat the existing static-key tests
on a combined kernel with jump-label v3.

Reservation policy is unchanged: prefer top-down placement below the
direct-map and usable RAM limits, with generic cma= range overrides.
Other reservation-size boots and no-IOMMU testing remain outstanding.

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 19 ++++++++++++------
 arch/alpha/kernel/setup.c                     | 20 +++++++++++++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

