Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6B23E356;
	Wed, 10 Dec 2025 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408262; cv=none; b=HIAKWBVA1Ivt505KHRV1DfExU1BX4tDVbKH4S22BvmJmCGaUjHJ0yAOw5EH8T2y2cRORco8hfMiaxAjdlopAwqPkBWAMrl+/VNNVzpZYJ21iIXAeWXIkmph9D7rfBjfamibZULgyADPBXbGWsdcSeSU2O6yeBwUal5yY1/ZDRVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408262; c=relaxed/simple;
	bh=x3W5f4hIc0/Em7EVfkqO4dpF78Aa48KA756A92pHi38=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cgV1CLDH56ABqnZ7ozP+GRWCTI2dx4+r3wyHOzgzzWnchPUKY4a2y7I9ABQPm9t1KIkZImO7v8+VsaLm9iToIKUeW211BEpzDh41NIbBbOZGCZjgRaO6Hb+Emr2/mi47PfeuIfN4rAjnhnQTrV4Omh6o798gZt7GFg7aqsJhFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+C6uEEk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+C6uEEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0193EC4CEF1;
	Wed, 10 Dec 2025 23:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765408262;
	bh=x3W5f4hIc0/Em7EVfkqO4dpF78Aa48KA756A92pHi38=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D+C6uEEkDXKgae0mJGaZ9Ym0JCnsYENaSjMlXO/4PpqMqW+o6YlPzdKB/AH/E8NUe
	 al7sLPEsurdu4clfbo9n+lr5jZHxaSvh/q+/l17aR91WqUG7sbwsh8TtO1h8TypYgC
	 EpH0LodX4OOSbqZ8ob6tIoi4JBridesjn9jIzKFcfRSMCUZZyGPCChCDypqgR/bZ9u
	 sZkDpJ+cbXowMVTeeZ9+Mw1AuLMa/Bn/F8kIrSIp6TUz/Gx9t4XAd3mQoXQP9XaMV+
	 zxEkvEMZZjgaJAo//35BKYXnjgSpXhGBgDADTDGo+eeFD/ev249SjSUPfNpZykzB/Z
	 BGfllKAUhwh+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A393809A23;
	Wed, 10 Dec 2025 23:07:57 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTn38tM2PIn8g3VT@z440.darklands.se>
References: <aTn38tM2PIn8g3VT@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTn38tM2PIn8g3VT@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v6.19-tag
X-PR-Tracked-Commit-Id: 9aeed9041929812a10a6d693af050846942a1d16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c179cac051943f673c8baa53214e2566bfe69dc
Message-Id: <176540807607.755906.10107362199616246461.pr-tracker-bot@kernel.org>
Date: Wed, 10 Dec 2025 23:07:56 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, richard.henderson@linaro.org, mattst88@gmail.com, sam@gentoo.org, lindholm@kernel.org
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 10 Dec 2025 23:45:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v6.19-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c179cac051943f673c8baa53214e2566bfe69dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
