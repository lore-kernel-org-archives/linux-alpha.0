Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD4730567F;
	Fri, 16 Oct 2026 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190191; cv=none; b=F6SYl3wuPD/hjL6aY7PGh/QQ1oCvgnoNqSfqbjY7qERldadR6OqE3Li+U2t2QXgm74r6mTxDX2ghGI9BkHKBMcyyiF+JKzHQyvyfRYymKtbOyhFge4xJ7NkBK96OB4wpt+qGlkYQ7yyjuJVRZpeiMf/Dz11Hvjlc3Rl09UBoi80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190191; c=relaxed/simple;
	bh=t0q+hSZVNMaGWOcr1Z56TOpJs26AA6GFdVpqKNko1Fs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D4A8pAAW0UFO89qaB0v9sK7CVpqzCSF/G3x60VqkajVLBqgraMTo42rmXoMYjMoTeqiDRqLZyA88AjTN90XXszUKUuDOT+sZn6trth4x8gR21CWTNAh9hvph+LrNFXPZ3BbYdwI1y9Y5/7U4rfpypwKig7MWNO1sIj8go1VDppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 16B4392009D; Sat, 17 Oct 2026 00:36:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 10E5C92009C;
	Fri, 16 Oct 2026 23:36:27 +0100 (BST)
Date: Fri, 16 Oct 2026 23:36:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matt Turner <mattst88@gmail.com>
cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
In-Reply-To: <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
References: <20261001165018.415526-1-mattst88@gmail.com> <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk> <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, Matt Turner wrote:

> >  Of course nested links may or may not work, but at least references to
> > some information are retained.  Or has it all been already extracted and
> > written down in the wiki?
> 
> Did you compare any of the wiki pages and the old links?

 I read through the old pages and found them reasonable.  No, I didn't 
reach for the wiki, perhaps I should have.

> I looked at all of these links via archive.org before sending the
> patches and didn't see any useful information. The LX164 link just
> contained the board specs and a link to the Technical Reference
> Manual. The Rawhide link is an install guide for Red Hat 6.0. Similar
> situation with the Ruffian page.
> 
> If you see any information that's missing from the wiki that I spent a
> huge amount of time creating, point it out and I'll add it. At this
> point, I see no reason to keep links to 1999-era articles.

 Fair enough, I take your word, this was just a question.  I guess it 
wouldn't hurt having your effort mentioned in the commit description; 
indeed I think it would help saying that the wiki has made all the old 
references obsolete.

 And I get nervous whenever pointers to old information get removed, as it 
makes it gradually more and more difficult to chase.  As recently as the 
day before yesterday I have pointed someone to an archive.org copy of a 
specification they were after and could not find for an old piece of MIPS 
hardware, that no contemporary search engine would list and I could only 
locate because 20+ years ago I recorded the full URL as I downloaded it.  

  Maciej
