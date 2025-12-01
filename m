Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234FF7081F;
	Mon,  1 Dec 2025 03:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764561018; cv=none; b=l6jb6B/OOnIjqhyAxQoinAJJLvFekCA8YBzQrSeywFecZTPdgLyd2mKoMwjFuBZo5HVL4wyhr5UVVgEMiRDSLUDk6iQjFZGEI0rNA8jE8fb871vfX5168ydeT9onE7ip/yYCGuf0a3sLhVbQTMVFgmhgzo/8EpOo4yMcTtA3gxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764561018; c=relaxed/simple;
	bh=1BpK2x8lUkIC1d0Byc1ZoGzGNmT6WjURSvVYP12pBxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WpC8sIQSUA2vFDTIieJTv8hqkcEKO1D7KFn30wNf3mj+W/MVKUDHRvUHJLh23pawI8QUYzhnd1k+JIISwrzVFXqLfCdxMeVFfhFV9f5S/jlMj/lv4aRD81yIIKx7UH9ijuN6g3nxKol4BtOqlAIRDukyxvJC9WQ14pcbKlg4LTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CCD7A92009C; Mon,  1 Dec 2025 04:50:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C22BA92009B;
	Mon,  1 Dec 2025 03:50:06 +0000 (GMT)
Date: Mon, 1 Dec 2025 03:50:06 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sam James <sam@gentoo.org>
cc: Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Stian Halseth <stian@itx.no>, 
    Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC*
 constants
In-Reply-To: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
Message-ID: <alpine.DEB.2.21.2512010346580.36486@angie.orcam.me.uk>
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Oct 2025, Sam James wrote:

> Similar in nature to ab107276607af90b13a5994997e19b7b9731e251. glibc-2.42
> drops the legacy termio struct, but the ioctls.h header still defines some
> TC* constants in terms of termio (via sizeof). Hardcode the values instead.
> 
> This fixes building Python for example, which falls over like:
>   ./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to incomplete type 'struct termio'
> 
> Link: https://bugs.gentoo.org/961769
> Link: https://bugs.gentoo.org/962600
> Co-authored-by: Stian Halseth <stian@itx.no>
> Co-authored-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Sam James <sam@gentoo.org>

 FWIW, the documented tag for co-authors is Co-developed-by: and you're 
supposed to collect corresponding Signed-off-by: tags from each of them 
too.  Cf. <Documentation/process/submitting-patches.rst> and the examples 
there.

  Maciej
