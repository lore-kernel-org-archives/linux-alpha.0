Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795085046;
	b=J/k5TUtB1VBU9Q1sBpodVNfE0jg8zIK2XAHCUAnvA9IRoMuh75u4FrOQ9bwPUFf5hUPS
	 NZvLQetHcwMxpIl6lObnOngq5/vyZDQZUdt/9nUlSgc6ab/vl/kf8Hd/QmCeS5BRrq8wA
	 sG4jkn4E+lsLBzH5cWNiZILIQXpXCyrPmKiV1iP/qw06JZJ4MCDoME5HLZQUcW5AcfM/+
	 RisYUlRYDFVW+IQYugt+kKTxqxkaNxy5i1dWuJ75qRen9qxB8ih1BFx3MLqlOGYVwkDT5
	 7Zywh0oDCYnqVY5AbnaV3b1FF35o5KuJhBF2h8Cp7prGN4Bja6ZQB7AFJq9eIBA9KqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085046;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6NmrocX9wKw/+uAeIqABfAO4xGefKJvmEOtWsOyErJw=;
	b=lDpuu6TLv8fZwq28ayxwL94DNpJTheA0hj0DbsiJbjdr11zKHT8EYPoyTvFzm5g1OIAI
	 c8lwdG5LR7nKll5JyoF9+De9rzoeZeqsdomUC6BJIFxybxhEHMce71nKB1M/Rlec7ePFe
	 EzYLakG4vg1vJct2NwNjY5OFeUm7e405BVOyFynjyM4KOd+YEZjXpY95qmW0HJXVtIEhR
	 P5+quvkaFXzt0TZ0yQ2fWAnmBpHC41w59tahZR+UJYUZ5LD5xQhtZ8ygHAB9fJXNvmPEe
	 7ymGsKrh+tU+RmwEOBQaLyjCSzs0ASD1EhhDIqhdOJyJWlRHBnrfOK13uJcK4vpUcew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOSLZqEr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC50606A33A
	for <linux-alpha@vger.kernel.org>; Thu, 19 Nov 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOSLZqEr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795085046;
	b=Ur9ixud8TWnUk95/4T6aTE9dnf9cAHjYydHVMRGV7pIo/m9W6P1tG4BVvC1SGGev8iCf
	 48/ByWQ7PpQGL77XJiOCtKWl0OLb3F+kU66mLMJM/Dwpbzuvnzw6eSWwYzVDFSNTIx8r3
	 36+TmMjcd5tCxhmpb7qldwQzdUhi4JJqsBhWOPfi11Pko+MNoNJ9ETrGsKeecPC68bupW
	 DuwLZsnbBvPjkSbavlhk9lxga8CijtZJ90fMb5adkfySBAIJ01JFwwapUUEFGLaKziU4X
	 28SdtHSuwGQDKJP8KBSA0+QZLg96hkGw5K5RAolH9tN0J8DqMSi1PEFTRWswdO9BjHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795085046;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6NmrocX9wKw/+uAeIqABfAO4xGefKJvmEOtWsOyErJw=;
	b=odiinrjlge4Ez3tKaYFN14coDzzqDVdxi/oLhl6qT1AR/TvgFju4n5hf7Z9fIhnDlJDq
	 62J8mt/DBcxGvrDPS3ByKnVpegTYPvm9xUGy8X3c7zx/cQs7b5LnSAa23NSUf6pnacyX8
	 5G9B2Mto0gnoU0SeXrNHyNDHSsEBSBhFYSZi15HpSu/F5xebaw8MmzrAmwAuAF9ERfLqT
	 L1uTeuGpnfnoe1LDzguCm9erDhuP/rtx8sH0DzX2tYQAGTz2/eWrJxX1ieZmZecCVo6lY
	 j4NIqKbAgPkrMPRwFKfhi6Df+g3c9H2QKvlH8rbvHgRVAKPBKNLhRa6g5TISNKga0aA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E48711F000C4;
	Thu, 19 Nov 2026 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085046;
	bh=6NmrocX9wKw/+uAeIqABfAO4xGefKJvmEOtWsOyErJw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OOSLZqErvokwMJZOWAuByvEVHOKESB1y1w5CiuirEL3oHT5w8jFhlH0Sqq/+boasn
	 2abUmhe1z3PZhjWfSB0u9F88oINpYtfMWeLRkM9oT5YhZOgmpXDa3rdYy56T4Ol8wx
	 TkfTDC+jSYFetuUIAwNqRB4uWd0s9SnVMz4OJCOWdu3lPcMyHGAGdUChj2YREhcmY+
	 IWQUa2xAmm+BXZfpm75RCAE9lNBH5czCr+G+dcBrkMRog5meN/ZIUSE1WDcv5ggXPE
	 bdyOiN4uBLhEkM/LLPWFxbvw579t1o29pvM+pDJMDf70JMw+ONGhCvwJdAvDFNmAzI
	 EGXw1sashBH7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 40F5D4B244;
	Thu, 19 Nov 2026 10:44:05 +0000 (UTC)
From: Mohamed Salem Gorrab via B4 Relay <devnull+grghdghhhh.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:44:04 -0500
Subject: [PATCH] alpha: boot: check OSFLAGS length in start_kernel()
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
Message-Id: <20261119-alpha-osflags-v1-1-b5f58d1cbdf8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPPS/moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NL3cScgoxE3fzitJzE9GLdFFPDVAuLNAMjiyRjJaCegqLUtMwKsHn
 RsbW1ALZTViNfAAAA
X-Change-ID: 20261119-alpha-osflags-d51e88f028b3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
 Mohamed Salem Gorrab <grghdghhhh@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085044; l=1227;
 i=grghdghhhh@gmail.com; s=20261119; h=from:subject:message-id;
 bh=IUZzSyFE+63kVHFb5iMI12mDAdfpqdsDko6szqWLryo=;
 b=Fc7gj1wCpmabIZN4jItIvTZFFJfoIA351tAJpwEJ+NToKfW2wGTHlL+cLQaB5RMJ9WL37yueE
 qrw/htYoTt3AVvYZLcDk5ThSW8Z3ebFWB2TCf0VsfYFYf63bRyD8Hbg
X-Developer-Key: i=grghdghhhh@gmail.com; a=ed25519;
 pk=vEfbRi05Tj25VTTOeRMU3V1L4HD3BpEHjTc5Tm6Hw1E=
X-Endpoint-Received: by B4 Relay for grghdghhhh@gmail.com/20261119 with
 auth_id=1569
X-Original-From: Mohamed Salem Gorrab <grghdghhhh@gmail.com>
Reply-To: grghdghhhh@gmail.com
Content-Transfer-Encoding: 7bit

From: Mohamed Salem Gorrab <grghdghhhh@gmail.com>

bootp.c and bootpz.c reject a length >= sizeof(envval) from
callback_getenv() before writing the terminating NUL. main.c only
rejects negative values, so a return value of 256 would write one
byte past the end of envval.

Use the same check as the other two files. I don't know whether the
SRM firmware can actually return a length equal to the buffer size,
so this is mainly for consistency. I have not tested on Alpha
hardware.

Signed-off-by: Mohamed Salem Gorrab <grghdghhhh@gmail.com>
---
 arch/alpha/boot/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 22a1cb0264afe6397ef2598c107f88280b979d63..0ce301edb219dc0c2fbabe5f692b48437a79d3b1 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -176,7 +176,7 @@ void start_kernel(void)
 	}
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0) {
+	if (nbytes < 0 || nbytes >= sizeof(envval)) {
 		nbytes = 0;
 	}
 	envval[nbytes] = '\0';

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-alpha-osflags-d51e88f028b3

Best regards,
-- 
Mohamed Salem Gorrab <grghdghhhh@gmail.com>


