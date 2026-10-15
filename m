Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5112857EA;
	Thu, 15 Oct 2026 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069765; cv=none; b=P0WOH6FuQk7s6EgzTmS1RY/ENIU3la0gYpUzTWOb9VtxwIDKPbhIlTwyxVyTRvyof5c5GAP6Qkga486TO1n+c9YFHJY+3RoIai1aTNYr4TORfTSh+u68hVR9H+1w01S2w84HhLdOvnQUDjsDmo+z73DY1mFl06+NR0RWF8IGXMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069765; c=relaxed/simple;
	bh=b4vVqbSINl0VRvzZ4loVfPTmK7lAQeb1uFkSO4a3r+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kQ6D4OreCdi19xm026CImnwAFPd/ffbRbigzfE6WFbIeBDDmu12pGhZOfwYvf2q7DQAJpngKeHMfMF+KGij5PStH/nSqjpaX5M9UuToEQ92oLCL+V2tiMJA+T/kSpFECGz8znAtEyUyDaH16iWTMiukpSOV4KFRqZ2GgxoOMdck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 774CE92009C; Thu, 15 Oct 2026 15:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7139892009B;
	Thu, 15 Oct 2026 14:09:19 +0100 (BST)
Date: Thu, 15 Oct 2026 14:09:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matt Turner <mattst88@gmail.com>
cc: Lasse Collin <lasse.collin@tukaani.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
    David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
    linux-alpha@vger.kernel.org
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
Message-ID: <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Sep 2026, Matt Turner wrote:

> The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> using gzip.

 Reminds me to dust off and upstream patches for making an image suitable 
for netbooting via MOP, which is the only protocol supported by all SRM 
revisions, since earlier ones lack BOOTP/TFTP handling, such as with one I 
have in one of my Alpha systems.

 There's also a fix I already posted for cross-compilation support that is 
required to avoid relying on a.out support in the build machine, which may 
not be there; I've come up with a better way to handle that and will share 
the outcome hopefully sometime soon.

 Thank you for your ongoing maintenance effort overall.

  Maciej
