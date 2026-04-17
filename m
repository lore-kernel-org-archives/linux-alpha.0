Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1921B2AD00;
	Fri, 17 Apr 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441885; cv=none; b=rxz0xYn52KDm6GnFz5bibU6RfO29OfuqcrMjMthwuIV7MfvA9pngd8XrML0QzbMMSXQi5S6LBnVZ/hEezCRBW++aEPwwSsBcFJP1aH4eu/3RDMpB4RIwTzJQEMOEd3WMd5hqBCedvw54901qPqqkpNaJALWVLPABAS8SrYw82f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441885; c=relaxed/simple;
	bh=bHqCkWiCvo5k9PjXjHdmLvz39L3oyrerQhdg1qMOG8E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=piF1TDBhMuGLK3UzJnx1cpO4tIFDXcFgT/KNn0F0ytgrpuALBGU/oDE/S7+WaZAEHidh8MISx6FaAqmqS+zw8OKUCc4B+RAGA/CMO0zsMYCPaUiCc/CN0xR6vDsD321zVxO2SFVG2dKs/PugZRvd/JO3RVZXUezKa54i2B5e2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5cQ8Pcn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5cQ8Pcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEB9C19425;
	Fri, 17 Apr 2026 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776441885;
	bh=bHqCkWiCvo5k9PjXjHdmLvz39L3oyrerQhdg1qMOG8E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Y5cQ8Pcnl1OQFSYUwLhebvynudbMock8JRGKQMnW3riFvLxhiDhXL/7qeJXYn6JYq
	 uIyjuBayfyInKFnlNxOGmCrH8ZdeovbBfmT1FmZM8DQ8vsuNZahugiSujdcZd4JCA4
	 QYJbzMKRiW6MceKF/4gHfiWx70OfmU53iB+2FR0Rhk3Bo3igVX2SJskYVxBe32hZ4j
	 N1f4sL5YPSDSrQN7obMIG9RGCymrDBqpoBz9li4MQqsLG3T9XlIG2c+I3p140MO2hh
	 FmuJ3JFN3pahUB5/ZEe0uE9J7drseHmgIAXgX+Me79AtDZZJyEa67lGe5ejoyH5iG2
	 SynRR4G6iY9qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EB7380CEDF;
	Fri, 17 Apr 2026 16:04:13 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeFFduvOLiLEJ9Dp@z440.darklands.se>
References: <aeFFduvOLiLEJ9Dp@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeFFduvOLiLEJ9Dp@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.1-tag
X-PR-Tracked-Commit-Id: bd39fc81340aed5445c731eb391af9ac9a701658
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a10e80be6343cbdaabe80f82cbd640fe3772d102
Message-Id: <177644185237.46060.3335080166818342127.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 16:04:12 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, lindholm@kernel.org
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 16 Apr 2026 22:24:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a10e80be6343cbdaabe80f82cbd640fe3772d102

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
