Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31603EFD0E;
	Thu,  5 Feb 2026 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302341; cv=none; b=DlIb2wLtAmaITM8YdI9luyXvTqnuSt2hs34HsLJtkOoV2viCioEvcY5RKjug64VSO8YdZnsnaLupXReyGRHbz4dg9GfPKEo8gq/yIXOd7sIyaaixiIoXOyZ8/bznZC1ZgJEv4UWmZJklfxAJJGXlWe0pkRAEEnP1wndmZILKjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302341; c=relaxed/simple;
	bh=XyasACw//lKiHglcMi16Jqro2BCH4hW7CXnxH92q/EU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6W3wh5R3Ad4TiMqcH0hlFkEoKJnSBPKsLhfqnJFFNQjKDvkZev0AB59xIrSz7/S/1UWb/ZlUJFee6/KWLnQZYe+ACLESNnycJKcZsqrtn3+d1rtvhmH+pTn2eXQTbHi90TnXd2b7nkmbG5HfUBIsvMlP3En+9xPGM2nIGpa3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=gXGOr8uO; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="gXGOr8uO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hVP9hkPR021yTPQFjIEz2wHeXpyem/fACHS+HEy5LgM=; t=1770302340;
	x=1770907140; b=gXGOr8uOWFW6PnQMW85dcRaqlz8rgWGIXMxYNYmBe6+FkeQEIhYH+FVmgrMne
	ri+qnk8bQkhWOlm585zZMmyQeLiJqQOrdO+qCpa4yXkvqiYczbI3yVEjdXr0kWr7iZ1AzmtpcOxMx
	wf7Pc2nIqKSUiV7R/zomNomrljcLbKv9DFjilu20kn7B5H15cvQ1+gJc44ETwX5ihSGZW41X2z1KY
	bhArVOwwydRNDB9lmHq0KrZSwdd9FbkbKmAf1WxI9MfjD1X1wQnRsTXoEO6JgUxT83nWcLfg5iOje
	U26nJnz9bBNxZNE/tmnUdP3wyNWenI8D/QFmt4g+2OiX/6lM8g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vo0VO-00000002Hxr-0Ay6; Thu, 05 Feb 2026 15:38:50 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vo0VN-00000001KTi-3Piy; Thu, 05 Feb 2026 15:38:49 +0100
Message-ID: <14bcd6dd3475d97b030ecb7044646f1b10d3205f.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/1] alpha: add support for SECCOMP and SECCOMP_FILTER
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, 
	mattst88@gmail.com, macro@orcam.me.uk, macro@redhat.com,
 mcree@orcon.net.nz, 	ink@unseen.parts, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, 	kees@kernel.org
Date: Thu, 05 Feb 2026 15:38:49 +0100
In-Reply-To: <20260205133049.526-2-linmag7@gmail.com>
References: <20260205133049.526-1-linmag7@gmail.com>
	 <20260205133049.526-2-linmag7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Magnus,

On Thu, 2026-02-05 at 14:29 +0100, Magnus Lindholm wrote:
> Add SECCOMP and SECCOMP_FILTER support to the Alpha architecture and fix
> syscall entry and ptrace issues uncovered by the seccomp-bpf selftests.
>=20
> The syscall entry path is reworked to consistently track syscall state
> using r0, r1 and r2:
>   - r1 holds the active syscall number
>   - r2 preserves the original syscall number for restart
>   - r0 carries the return value, with r19 (a3) indicating success/error
>=20
> This allows syscall restarts to be permitted only for valid ERESTART*
> return codes and prevents kernel-internal restart values from leaking to
> userspace. The syscall tracing error marker is corrected to use the saved
> syscall number slot, matching the Alpha ABI.
>=20
> Additionally, implement minimal PTRACE_GETREGSET and PTRACE_SETREGSET
> support for NT_PRSTATUS, exporting struct pt_regs directly. This fixes
> ptrace-based seccomp tests that previously failed with -EIO.
>=20
> With these changes, seccomp-bpf and ptrace syscall tests pass reliably on
> Alpha.
>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/Kconfig                   |   2 +
>  arch/alpha/include/asm/seccomp.h     |  13 +++
>  arch/alpha/include/asm/syscall.h     |  90 +++++++++++++++++++-
>  arch/alpha/include/asm/thread_info.h |  16 +++-
>  arch/alpha/kernel/entry.S            | 123 +++++++++++++++++++++++----
>  arch/alpha/kernel/ptrace.c           |  83 ++++++++++++++++--
>  6 files changed, 304 insertions(+), 23 deletions(-)
>  create mode 100644 arch/alpha/include/asm/seccomp.h

Thanks so much for working on this! Alpha and SPARC are the last two archit=
ectures
in Debian that are missing full support for SECCOMP filter. Great to see th=
at Alpha
is now being worked on.

FWIW, I haven't tested your patches yet, but I think you should also update=
 the
documentation in Documentation/features/seccomp/seccomp-filter/arch-support=
.txt.

I will try to add support for Alpha in libseccomp over the weekend to test =
your patch.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
