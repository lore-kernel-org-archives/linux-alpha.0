Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543271;
	b=YE82FuBC167EVLjUa5Ap090Xe0EyG5UZjBiTfrtL4f9R4Ee5v0ysnxsFGZ9uCKV88GFB
	 Sa7e2aGCKfBOjINENiPatko2xCecmVq4fF4lX8Iojd9+HqPYej+y+FWGe0yqWVrZIp7RY
	 Vwfu0Fa5uJtkm56xTGvLJQ9X1FojeXk7mgSp414Z46DKeE90cBHGHzhmhpA0gENwmSPIQ
	 TIbPAi7pb/8Y6Js8G7RU9UGOyXVwtiZDc+bAOS7OZ1AGlkWPyVSZEXS1oOs/A4+vTiivg
	 df71VhV21OXEn0tks7t+RiXF6uNt8q34jMbE5HK/tML7E1YNDqThu3lXLNaErx2HSPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543271;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=BsHhe+WPP54yq9eGTkOlxgoW3QO5RQJOgYpYL91UBak=;
	b=KZ+rz3bV9lPkr1Hg8EoptZc4cN9KeU30lrgR1C5eCYZtu2U3pJVuUCN46O4GfGiW2EVK
	 xZDzWOQpyhVpka1Mnu4Z/QAaXoZoF8agOYyGNxku9cdr6o3bB6RpCpAo69ttVhQ9vVL/Q
	 aiQk056ei1wRffX/vBFpZwzvxPZ4tA+bE1yri5QNzTAYohtzInm/kaQeIv2orvWTyLWq0
	 BpeLYdb3qQBujGSkPLHanV3dr09DQz1TdFREPF+Z3d8p97i7xXYpUGiknW9TD0YQQ8Vd/
	 2SxHPy9WXhuvhzbM0u9c9qWKNWkc9KeK2whNsywhMyOXdKhSg7IWD328m31JqBokS0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQOih52C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF4606A31E;
	Wed, 21 Oct 2026 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQOih52C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE7B1F000CC;
	Wed, 21 Oct 2026 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543271;
	bh=BsHhe+WPP54yq9eGTkOlxgoW3QO5RQJOgYpYL91UBak=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WQOih52CGOWOWMZDEl6pBSHaRi+Ji9GM2pKbRalgIrXb0pvT9+GXJvCk9gP3Jmkbi
	 MoZu+Fx5zz+chKLenG66K+xb8Pzo3BEdrYynP+WaFNJrTmieDNLt0eT7EguvLWX3HZ
	 rca6kLNVs+9+uykxzxw9Da+nSaywXiQRtK2NpHH3Ee1lp4/ZLjLSgrznsSarzX6iCb
	 /A30GtIou1PtIXBNc0kHp7PpU3gv2gWF8ufYDqzpfDp+ddGaDxrDhsIOmORCk0Ogd2
	 hgXtDnGdFGiPxdujckQ6PNT4XzJ9HmwLPeIZ3HbHG1ZjzWX62jybjbyLwC4q3Up4Xl
	 cMFlDDepFvz8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0D9DF3809A0D;
	Wed, 21 Oct 2026 00:41:11 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ataJlL6L7TrS3gWs@z440.darklands.se>
References: <ataJlL6L7TrS3gWs@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <ataJlL6L7TrS3gWs@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.4-tag
X-PR-Tracked-Commit-Id: 71cf9644bcb35e686c3e12a703325335a0925946
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 742f62b63904cdc20a364a49d2861e32464a0af7
Message-Id: <179254326984.289274.148433132364390249.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:41:09 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, linmag7@gmail.com
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 23:20:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/742f62b63904cdc20a364a49d2861e32464a0af7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
