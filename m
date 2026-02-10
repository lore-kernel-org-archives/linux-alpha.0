Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177762F5A1F;
	Tue, 10 Feb 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700114; cv=none; b=dgSMsCiNIKPWoN4bOX4Jnls1oEXqXSxqxCtZn0r/NdfCF2fm14r7RUUrpN7q/LHxCTippnHcP3s5Sq3POCe1mqCTi3hZjOxQz7UkXNzKEfpBu2JizgnJN9ucMrQwKhDSJOJdRQqqidVZsRLUWLJi3Ysv75KawxlkCD1r7q0GR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700114; c=relaxed/simple;
	bh=fvuUSWqPVHW2wY09VmebaeyWRdMRPzs4l53+Ybq3e74=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gVr8HnxwfGiiBKLAbBPU4ijBNbTlfnnROQrR2WK1kPukgFC5nDRMEx15XwB4o2iEVoHGy5i0SnlnpvsOKU+qjWhFh23Pwv0FDk6dopww003kB7qvigm+r8/LqNTxHsnuSUHSOhR3CK+eZ4UyjZjaWafnLJsEhcAG1hU9MrDHMn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJFD0SzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJFD0SzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E7BC116C6;
	Tue, 10 Feb 2026 05:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700113;
	bh=fvuUSWqPVHW2wY09VmebaeyWRdMRPzs4l53+Ybq3e74=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KJFD0SzL2ufryCd6GbSa40eeg/40/CmxQca88yaFHi/13wrC3Ey8Rd8kygThN0m8O
	 Uu1wMqQ/oLRzYQJGJdQOWxGRmgEHrHSBcDijAIGptKJa7vPOItU+6aUJvSKf0k5vKP
	 HsMDwSRpkQ2v5Xek6bRcwDw7+kq+R9RJTXfa2zhwtu9bTRDp31xVOM2olMf57tB4xV
	 iuzqJ3uwPQQzUQIAEhHBCnVUzs419kSTCuzLiNZ3R3ifahc+p7ZU2IuB6d0+YA35gD
	 E4zZx/0jc4A4CeE5wOIPaFR6NQ2y4W96h9sbtPJyM6NzHZQ55tyx1OCbtsaSd3uYhu
	 gikLkAlJsEgfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 851EC380AA5E;
	Tue, 10 Feb 2026 05:08:30 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aYno7V_aAa27Oxdt@z440.darklands.se>
References: <aYno7V_aAa27Oxdt@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <aYno7V_aAa27Oxdt@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.0-tag
X-PR-Tracked-Commit-Id: dd5712f3379cfe760267cdd28ff957d9ab4e51c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f722cb7304f63d8be7164c15ebc278f54d14357
Message-Id: <177070010909.3352335.15865012526956614392.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:29 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, richard.henderson@linaro.org, mattst88@gmail.com, lindholm@kernel.org, glaubitz@physik.fu-berlin.de
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 9 Feb 2026 15:02:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.0-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f722cb7304f63d8be7164c15ebc278f54d14357

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
