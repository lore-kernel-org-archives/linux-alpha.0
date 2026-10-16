Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C123D348C6B;
	Fri, 16 Oct 2026 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185187; cv=none; b=k9OD8JM8cVhINkPWmI3XpGElQ862E5VkObC9NZrP09FJ4Pj34rYhgRE2lB82g1d/HTaD0PxO+axusz9MlzYi2HMbD2YrNjppDiGW13qUnPFdAn4HZ/4AVrIlmwRftWuVmEVLISM4ua7gYeAsjnB+lfCwQD7F176Uc8UzMow/LuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185187; c=relaxed/simple;
	bh=ZcfoHCpiiQP2tZzKi9R/eJUdJ4wjVCYNR7LFIym2pN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=psBZMxWhYm9J+c/fa5zg95SGvcnSgfs5j0rcRrR+1owGQsry6xUuPUJabE0cxvLyiF5NxitPbvxZSR+eK6T3ZUrJRRZFfACSdG0Ss/XbJFOmSSo1MFaI60ouKFa9YC7DRjejWKoIbZRzo2+CzdgxLnSJSdmSqaDUKqaYRKWbqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3814A92009D; Fri, 16 Oct 2026 23:12:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 32D2092009B;
	Fri, 16 Oct 2026 22:12:56 +0100 (BST)
Date: Fri, 16 Oct 2026 22:12:56 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matt Turner <mattst88@gmail.com>
cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
Message-ID: <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
References: <20261001165018.415526-1-mattst88@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Oct 2026, Matt Turner wrote:

> The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
> HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
> help at the system and motherboard lists on the alphalinux.org wiki
> instead, give LX164 a one-line description in place of its link, and
> drop the others.

 Would it make sense to keep links to archive.org copies around?

> @@ -184,8 +185,8 @@ config ALPHA_EIGER
>  config ALPHA_LX164
>  	bool "LX164"
>  	help
> -	  A technical overview of this board is available at
> -	  <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
> +	  AlphaPC164-LX, a 21164A-based single-board computer using the
> +	  Pyxis chipset.

 For example: 
<https://web.archive.org/web/19990913123756/http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html> 
seems fully usable.

> @@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
>  	select HAVE_EISA
>  	help
>  	  AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machines.
> -	  See HOWTO at
> -	  <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.

 Likewise: 
<https://web.archive.org/web/20000817221358/http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.

>  config ALPHA_RUFFIAN
>  	bool "Ruffian"
>  	help
> -	  Samsung APC164UX.  There is a page on known problems and workarounds
> -	  at <http://www.alphalinux.org/faq/FAQ-11.html>.
> +	  Samsung APC164UX.

 Likewise: 
<https://web.archive.org/web/20000130062931/http://www.alphalinux.org/faq/FAQ-11.html>.

 Of course nested links may or may not work, but at least references to 
some information are retained.  Or has it all been already extracted and 
written down in the wiki?

  Maciej
