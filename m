Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A428117C68;
	Wed, 29 Jan 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145194; cv=none; b=s8oheAttQ0WPaZqZIaRe9WOGyAGQxZBzxl+B95Nz7UsrUnfvYO3VG2GPCYLOLiZ4vHQWjXX07fzipyqxU0tzUJMxmzm74pN0NajAPXb+dwNC5iRDZksgMRnyVRidQmXe/H6K8zdOZXRQ2DyG4YtmpIUAGjkAoyrBnh3oZNXsDF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145194; c=relaxed/simple;
	bh=oTD8wZT6oiymDkyC73ITR8aoRHvo0FF1abTWNSTxInk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FIPa4//QbnH2BW4kq8Xx+712EwbNdFA38cVbkg9WQrLpOxVBuJQruWaOnwutCsEKIj6b3wYDrUR0pGYshiMPboFXqBnQkuUfYFFbtjRu4iEJy4aQoe5W4sKZD1VeMYoAREgnrpZRvYvPc3h+xcdHXk4tB7g4tts+IqQmjyFV+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=UmKn8KfZ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="UmKn8KfZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CjPIGnsWoTPpzHPEgH99fG7ygeqh4g0v1gP+7o8pSf4=; t=1738145190; x=1738749990; 
	b=UmKn8KfZa9DjlRtSQCyRFg54wFB4Swfa3cUEA+7XIF69RPiWlVGkCO8KgNnvBJwM50vNxOHGdrI
	9HgBhsIQlAvwUZdy2vy868hKIFNy9Q2cQZOjOfjlPEQ1S2W1Dc0E/X5e+LSInlJ2kQLfuxdsWm1tM
	8VyW6QI6uo1blEUS74hn/3nE90JCgwGa5KX/f4a7qhOIgv3+hcXk+5LXi2+y66WRblYR7QiEIdR0Q
	7awXkobg3yLhmCrbDQCe9ji0C5P+GlMF1yYfFEn6Rykbim+3za+tforR6ksMfeLpAQD7ndO4sHI9k
	JgmyFkvYTH/ZsgwFuwolckgkU9xKaff5BvWQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1td4xd-00000001ACk-2wmh; Wed, 29 Jan 2025 11:06:17 +0100
Received: from p5dc55cec.dip0.t-ipconnect.de ([93.197.92.236] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1td4xd-00000002oec-1w49; Wed, 29 Jan 2025 11:06:17 +0100
Message-ID: <a0ad082b740824d6589769f9d9b3531f087cfcfa.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/4] alpha: stack fixes
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ivan Kokshaysky <ink@unseen.parts>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Oleg
 Nesterov	 <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Arnd
 Bergmann	 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Magnus Lindholm
 <linmag7@gmail.com>, 	linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 29 Jan 2025 11:06:16 +0100
In-Reply-To: <20250129094312.27399-1-ink@unseen.parts>
References: <20250129094312.27399-1-ink@unseen.parts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Ivan,

On Wed, 2025-01-29 at 10:43 +0100, Ivan Kokshaysky wrote:
> This series fixes oopses on Alpha/SMP observed since kernel v6.9. [1]
> Thanks to Magnus Lindholm for identifying that remarkably longstanding
> bug.
>=20
> The problem is that GCC expects 16-byte alignment of the incoming stack
> since early 2004, as Maciej found out [2]:
>   Having actually dug speculatively I can see that the psABI was changed =
in
>  GCC 3.5 with commit e5e10fb4a350 ("re PR target/14539 (128-bit long doub=
le
>  improperly aligned)") back in Mar 2004, when the stack pointer alignment
>  was increased from 8 bytes to 16 bytes, and arch/alpha/kernel/entry.S ha=
s
>  various suspicious stack pointer adjustments, starting with SP_OFF which
>  is not a whole multiple of 16.
>=20
> Also, as Magnus noted, "ALPHA Calling Standard" [3] required the same:
>  D.3.1 Stack Alignment
>   This standard requires that stacks be octaword aligned at the time a
>   new procedure is invoked.
>=20
> However:
> - the "normal" kernel stack is always misaligned by 8 bytes, thanks to
>   the odd number of 64-bit words in 'struct pt_regs', which is the very
>   first thing pushed onto the kernel thread stack;
> - syscall, fault, interrupt etc. handlers may, or may not, receive aligne=
d
>   stack depending on numerous factors.
>=20
> Somehow we got away with it until recently, when we ended up with
> a stack corruption in kernel/smp.c:smp_call_function_single() due to
> its use of 32-byte aligned local data and the compiler doing clever
> things allocating it on the stack.
>=20
> Patches 1-2 are preparatory; 3 - the main fix; 4 - fixes remaining
> special cases.
>=20
> Ivan.
>=20
> [1] https://lore.kernel.org/rcu/CA+=3DFv5R9NG+1SHU9QV9hjmavycHKpnNyerQ=3D=
Ei90G98ukRcRJA@mail.gmail.com/#r
> [2] https://lore.kernel.org/rcu/alpine.DEB.2.21.2501130248010.18889@angie=
.orcam.me.uk/
> [3] https://bitsavers.org/pdf/dec/alpha/Alpha_Calling_Standard_Rev_2.0_19=
900427.pdf
> ---
> Ivan Kokshaysky (4):
>   alpha/uapi: do not expose kernel-only stack frame structures
>   alpha: replace hardcoded stack offsets with autogenerated ones
>   alpha: make stack 16-byte aligned (most cases)
>   alpha: align stack for page fault and user unaligned trap handlers
>=20
>  arch/alpha/include/asm/ptrace.h      | 64 ++++++++++++++++++++++++++-
>  arch/alpha/include/uapi/asm/ptrace.h | 66 +---------------------------
>  arch/alpha/kernel/asm-offsets.c      |  4 ++
>  arch/alpha/kernel/entry.S            | 24 +++++-----
>  arch/alpha/kernel/traps.c            |  2 +-
>  arch/alpha/mm/fault.c                |  4 +-
>  6 files changed, 81 insertions(+), 83 deletions(-)

Thanks a lot for the series! I just applied them on top of Debian's current
6.12.11 kernel in unstable and will thoroughly test the patches. Will repor=
t
back the results later this week.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
