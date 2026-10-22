Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693893;
	b=HnF17NsFqJIYGpN2DIrgGAVm/tyRNcrR5HuabprI3GGZut40OtVRrbeMXi5Z3E9orA1y
	 +gusNzXT7GC/flESyU8VpLMaZxC4x2Et71uviCVDPmkKgn4MhG+9xh7z6Gh5Tpf34SZiJ
	 gZmEAe0b+AvD2JxP8ZpJmJUZD6hwJ8GsycrR9s780B1oLyfmyUwDazOZ4tXfmT3/5V8g0
	 aNKjSUQpAAZB9atjURNpCo7tHs7gug9o6UeBwPESNHZ9UTUyCf8mwsTpHRW43Mz5M/2Ik
	 /pRvzagoyUPyrAC8tEmiVbriAI4BH0I4pWHnbpymIIm0wL2g3sSTVZ9u6Q9QS88PMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693893;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=uEPZjS01BPcPXaMKRLgto43EdsAstO2egJm/H3mRht4=;
	b=vq89aAikO2NowIEGhbA0hBGqQgPABkdceV6YNSb4D0ciMLIvMOyFxs09TFMVKQLkBnsb
	 JFnT7ynR4Bs806l2CSWn4XfkvgasdvoKVsEd7UiNJ4/9Vauil+p/NOlu2qf0RaAupMR1y
	 A/ZXPTZdVYDUfSjzhsSgqB8VhdCWLx5XgM0aTeJM4xpjXZ03M45g9VBUTA1deQ89Jh8/C
	 OAB3gTaLM0ArLw+NpQNMyR07IsIAw1bPClSB4k9M3qn8AklSyWNNauSppeZfJp2ISOWIl
	 G+hKTcR6zQ+H/QXNQFDrnCa8uXVb1siPSrcJoPvkkSaYKf08kkv2jV0MKXmxivVoYLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1KWJ3Na;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CE60A6F4E;
	Thu, 22 Oct 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1KWJ3Na
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C961F031E2;
	Thu, 22 Oct 2026 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693892;
	bh=uEPZjS01BPcPXaMKRLgto43EdsAstO2egJm/H3mRht4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h1KWJ3NaR3Ur8dX3qS/JPPxOhjFTN1LAmJ2BUw3vhG6j3d38MAEBYAgpZFrfCkySX
	 SchReeeWKYRqQJZsZv44GPPhi446DZZTcxGkIq0jV4qWN8e+ikRaEtCzeM9vrQe2zW
	 U2gPTMHf8TGSzBbE4bclTEsZiNpN4Hq2X6h679KgFrCDnFZ6piQF+2rvmNPnJHAVvU
	 o8Ivc7279RgePQ5c8IaqR9NVYsyC9hl8oQ0MtpTOktk+Q52zw6vU0+T9Qbc/EHrJ29
	 2tdJGruPX/FAxlXVWpJSKq7RhV0McHxwZdAG8Sgn356gAuXaMMWi1VpI8rvn/tRESJ
	 aqyI7lq4m9xyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C9D72380822E;
	Thu, 22 Oct 2026 18:31:32 +0000 (UTC)
Subject: Re: [GIT PULL] alpha: soft-fp tininess fix for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <zouc6nnptikib4cpv3sf5ip4gzdzesdth4wgnexnk54f7jmsp2@u6zay3q6pv3v>
References: <zouc6nnptikib4cpv3sf5ip4gzdzesdth4wgnexnk54f7jmsp2@u6zay3q6pv3v>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <zouc6nnptikib4cpv3sf5ip4gzdzesdth4wgnexnk54f7jmsp2@u6zay3q6pv3v>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-fixes-v7.4
X-PR-Tracked-Commit-Id: b74843b38da8f1186fd7d447646c835b47096a15
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 979fac3eaaa02fa887c7dfe6509248b21dca3872
Message-Id: <179269389173.87271.7743606746602968715.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:31 +0000
To: Matt Turner <mattst88@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 22:03:42 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-fixes-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/979fac3eaaa02fa887c7dfe6509248b21dca3872

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
