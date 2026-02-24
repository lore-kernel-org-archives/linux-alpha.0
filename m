Received: from smtp-4.orcon.net.nz (smtp-4.orcon.net.nz [60.234.4.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB8369982;
	Tue, 24 Feb 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925564; cv=none; b=JuQ9fS/fP3qkEq1VND7rUtiIqCrLRf3Dk7cijIGIiicRJUhQTo8Eegw7NK1QR3TjDkzyj5aMMmE6YE7094haOoZuFi4O7kgEJRTlsUNYOoIODY8QFD9WqEe6EEDub325w3KcqOo6nxRtOrPxvUpNVt1+5Isi4ij3cEsIvReNobo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925564; c=relaxed/simple;
	bh=IOJgxaam+EX1KGnYY0VduJPKBbOwGW6h09urZlUbJOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Be4sov9JBvhfOw+j3sE3JPaa6Dzby+L6Nh+Dlb5mmeO7Mhd50qwDLKwfj2b4p9MhZ2ts3aDdaZAB4jhtpaLrBAaPnAXYeZFR1bmdJBpdbd8UmREgrNPQwBz3v3qI/u18m6ooi9pOS7pgNgcEgqyaN0TM1MI+r8vohyjAJ3bm0bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; arc=none smtp.client-ip=60.234.4.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Received: from [121.99.247.178] (port=50414 helo=creeky)
	by smtp-4.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1vuoAV-0002yB-L4; Tue, 24 Feb 2026 21:53:24 +1300
Date: Tue, 24 Feb 2026 21:53:15 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org,
	glaubitz@physik.fu-berlin.de, macro@orcam.me.uk, macro@redhat.com,
	ink@unseen.parts
Subject: Re: [PATCH v2 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Message-ID: <aZ1m-3sKgvvwDQFZ@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
	mattst88@gmail.com, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk, macro@redhat.com, ink@unseen.parts
References: <20260220105757.25104-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220105757.25104-1-linmag7@gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Fri, Feb 20, 2026 at 11:50:09AM +0100, Magnus Lindholm wrote:
> This patch adds SECCOMP and SECCOMP_FILTER support to the Alpha
> architecture.
> 
> The seccomp-bpf selftests exercise syscall tracing, restart, and signal
> interaction paths that were previously untested on Alpha. To support
> these, the ptrace/strace syscall path is updated to reliably distinguish
> internal skip-dispatch from userspace invalid syscall numbers, ensuring
> that syscall(-1) continues to return -ENOSYS with correct r0/a3
> semantics.
> 
> Supporting seccomp also requires correct syscall restart handling when
> ptrace and signal delivery are involved. The traced syscall entry path
> now consistently tracks syscall state using r0, r1, and r2 while
> preserving Alpha's a3-based error reporting ABI:
> 
>   - r1 holds the mutable "current" syscall number
>   - r2 preserves the original syscall number for restart
>   - r0 and r19 (a3) retain their traditional roles as return value and
>     error indicator
> 
> This separation allows syscall restarts to be gated strictly on valid
> ERESTART* return codes in the ptrace/strace paths and prevents
> kernel-internal restart values from leaking into userspace.
> 
> Alpha also lacked support for PTRACE_GETREGSET(NT_PRSTATUS), causing
> ptrace-based seccomp tests to fail with -EIO. Minimal GETREGSET and
> SETREGSET support is added to export struct pt_regs directly.
> 
> With these changes applied, the seccomp-bpf and ptrace syscall selftests
> (seccomp_bpf, extended for Alpha) pass reliably on Alpha systems.
> 
> ---
> Changes since v1:
>  - Update features documentation for seccomp-filter/alpha
> Link: https://lore.kernel.org/linux-alpha/20260205133049.526-1-linmag7@gmail.com/T/#t
> 
> Magnus Lindholm (1):
>   alpha: add support for SECCOMP and SECCOMP_FILTER
> 

Passes the seccomp-bpf selftests and the live tests of Adrian's
alpha-support branch of libseccomp on my ES45.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers,
Michael.
