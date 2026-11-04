Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771484;
	b=sDtCT5i6nRvoZ9EC53IRULlFYq8AWW60fBN8AGRWedtkqSBuWYGuOBJEsNc1YlLYMtdC
	 2A58S4UpCHt9YQ0NFBiL2NzqLzG0k/6FZw+v594JiL8EJ7UNuw4L0Wvg2/ia8USlIWg7U
	 7NtGo5G0Ub7laUMub0DuT/DeB7eXZYYDP1BWoxPl6LjZDa4hyf/30MC2qQM0MNlb35WwG
	 d1hPbIRcpDJ/X36Ubi0id5bEQXgnHmwSCz4hJECLRWYekxzW9RZz5nXeWEZ0YT9goHAAJ
	 PtsoFz7eMv2+gm7a3iXTd1Y96Lsut8R3qmA8F8E3IE8qpV64+j6LRP2UgpdWrtnsWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771484;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=gFOsRWlPoVv3sryTMuE3bL0g8Ttk+4iH4fp6LwC1P4o=;
	b=Rzww0x3heLuoN/L52568Z0ELqMdlB0C0ENvodl/f0aNiELKG+k4fnvEjEeZbhb06AXzz
	 qn5R95LbT3UbzpUQuVlTXhUNomIRaGOGsjhgLz9YekSrHTip72IKyYl7ahEz/aUU1RwMA
	 1W2+nmsnk49i7XjTySQzaIS/YvJsr9ExfOaTP66q6aZ76j1flh0xV0S+4dlAW7D8+QZOp
	 leV5kgJLZkNlvmtXuCmzuudI7XAC0XEtyuLZbPl62QwKMjb2+eT8jfDl7nidehvPp2YhX
	 dKp6A/bwGWdOTS9Bl73wD9/rr0tEohyuYT1qOrbRla28jMzG+zHkBkaopvY08TEWXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF87606A31B;
	Wed,  4 Nov 2026 05:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 72EA492009E; Wed,  4 Nov 2026 06:51:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 65F6B92009C;
	Wed,  4 Nov 2026 05:51:21 +0000 (GMT)
Date: Wed, 4 Nov 2026 05:51:21 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Walleij <linusw@kernel.org>
cc: Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
    linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
In-Reply-To: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
Message-ID: <alpine.DEB.2.21.2611040544270.6502@angie.orcam.me.uk>
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Nov 2026, Linus Walleij wrote:

> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
> 
>   Error: junk at end of line, first unrecognized character is `,'
>   Error: .size expression for bcm6846_runner_start does not evaluate to a constant
> 
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.

 Alternatively `.equ' pseudo-op could be used, which has compatible syntax 
(but in turn has different syntax on PA-RISC).

  Maciej
