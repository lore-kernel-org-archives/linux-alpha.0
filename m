Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0583C0603;
	Wed, 19 Aug 2026 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108342; cv=none; b=cEQFpwAoHajlZ/Lq6SCrKbOpnBtEHe8GXMqZiRZq7zSIXzPzYI/K3icKD0W92PcO6d3T1OHzOV9uZ05apBAFU+Omf1KikV5lbazYwkX5d7voexu1AlcajTYTAviH9t/hA/b2sIvKRb6YQtd3BqkRRzW7wB7ppOtmZVv9qqrvd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108342; c=relaxed/simple;
	bh=1ADIDIIzmG3pJNz9ngiVJVNXCqMMppe2y2NaW7N57pU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kwYhmNpDBXPj0WeMZAU8ENLlZvgD1HtIGTdCTzu0WrEfA3cdKAWdHjjuzrprFyTiYf7HeTtWpd7vjp8fSYieDaylFSVLx1czFmKgW8fU3Pj2+7QTEgMihk0lLADB0dJCbrwROaZTIq9PMp3JpVr4jH3qVyJWMu18o+lf6hIUOMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp5tf3Zd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp5tf3Zd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502391F0155E;
	Wed, 19 Aug 2026 02:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108337;
	bh=vf1BliqI3w1jp8kXk5tSmMxQ8bhPWvIiTv7fW6/OEUI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Tp5tf3ZdqqwdUhwp95zyQaMWlGravoVgef0KYQJLXXVihmJHgkSxNoQ3acVCY24uy
	 SWTJRICd9Lkf2NT1O81V5ZNobh96Na4GB+ApCWnp5SXBvhvVfBdk3bi/WcNhsL5LVb
	 lSCj9MZ2klL2CH4NDy3FSMRNVOrIN5k0q96yDDESktJ+pe5VV69RjZEis7pEL2KQyT
	 VURQoRdc4dqY7pkWKWQuMShY6WVFQlPxI/JEOIdFEycc32dhwOfnndoqDsEO9m4a7U
	 k7EZYRkRbtdrr59ypwpvesY9u/wE4JRAQm16o58soBdxRUJ8N6r1SDVr9ALdAqWJ/T
	 yxfYXBUuhtTnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B78392706C;
	Wed, 19 Aug 2026 02:58:09 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aoSkgrrgIY29ioTS@z440.darklands.se>
References: <aoSkgrrgIY29ioTS@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <aoSkgrrgIY29ioTS@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.3-tag
X-PR-Tracked-Commit-Id: b39c748d9db0c6f3ada5e7cef7f56415827d5f81
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca58a3dde621067333f481547db4afc587d7708a
Message-Id: <178710828837.2816674.13159445132894776984.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:08 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, mattst88@gmail.com, richard.henderson@linaro.org
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 18 Aug 2026 20:29:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca58a3dde621067333f481547db4afc587d7708a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
