Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10B428EB;
	Wed, 29 Jan 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166557; cv=none; b=IduJLWuXyDy7wOrRaHvNPVdXC+b+le01wmfCzEF/wF/VF4X0ZFkUbXS8C1I2OMzjdVVHiCd1q4dkI1o7fqxuHRh/iTo3lVkIufDCSZqzhVP0V4sUKyTKffM0fsUW5jXpXQnhiHcrrjc1oR68fU5OmtW/1xwsfY1m1dXkW/XbU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166557; c=relaxed/simple;
	bh=Yf3saxDfwvoh+aOIJDeL42RXZGyLZ2TNQzKiGMu2LOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dIi9BJfbqJnVUjaFLhFgdHdgDBEr+4N3r/IVWSCVRiznzYvrB1T2I7oSNit9cyAMbHlKZJ6xC1OLpJINZabIkHDJ7eOPrBsN8Fcyn6Zgw2Gx+mDB6X5HRn5Lh2zCZlaLL/mQ6o6gUBZBFFtLJTcS/godRUROwgh0kW89z455/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 66AD192009C; Wed, 29 Jan 2025 17:02:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 58BD592009B;
	Wed, 29 Jan 2025 16:02:26 +0000 (GMT)
Date: Wed, 29 Jan 2025 16:02:26 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ivan Kokshaysky <ink@unseen.parts>
cc: Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
    Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
    "Paul E. McKenney" <paulmck@kernel.org>, 
    Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] alpha: stack fixes
In-Reply-To: <20250129094312.27399-1-ink@unseen.parts>
Message-ID: <alpine.DEB.2.21.2501291541500.56843@angie.orcam.me.uk>
References: <20250129094312.27399-1-ink@unseen.parts>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Jan 2025, Ivan Kokshaysky wrote:

> Somehow we got away with it until recently, when we ended up with
> a stack corruption in kernel/smp.c:smp_call_function_single() due to
> its use of 32-byte aligned local data and the compiler doing clever
> things allocating it on the stack.

 Thank you for doing this work.

 I'll review/verify your changes by hand and push them through GCC and
glibc regression testing, which should hopefully pick any fallout without 
having it buried among any intermittent failures, and report back.

 However, would you please cc <stable@kernel.org> with your submission, v2 
presumably, so as to have these changes backported?

 The thing is I find it quite a grave bug being fixed here, which has been 
there for decades and triggering occasionally[1], and it might be the only 
way for users of certain older systems to get a kernel with the fix 
already applied.  As you may have been aware non-BWX Alpha support has 
been removed and while I'm working on bringing it back, it will likely be 
missing support for specific models such as Jensen there will be no kernel 
developer to look after.  So getting an LTS kernel might be the only way 
to get a stable system for some people.

References:

[1] "System fails to boot when CONFIG_SMP=y", 
    <https://bugzilla.kernel.org/show_bug.cgi?id=213143>

  Maciej
