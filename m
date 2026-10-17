Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99343EDAB5;
	Sat, 17 Oct 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223082; cv=none; b=VkT7gVDmkdKeROEuGIGUmupTssFNhLhGfnEe8mqyoqPdOCq74A0p7lUUORj2KOp+hVtOT56G+uVLPXrZk4BzGPJhs1b4E0ocYOtJ6GJP5h27DZcJ9u+rlQtDNBKyfqzUVku20YDdqLO/SfRYZ83o4BZ4bER7AaCKcUmxxVwdzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223082; c=relaxed/simple;
	bh=291nnlJ2ANXIkHog4GOPHVnZIK2PUIsTEONTZP9X7aM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZgZ9p2HvW2lcmcQIBwXJ/0hJkUOCNaIl8qWa5cXZJdcPKz/2C8UGxtchFXBmAJPgz+K3RXfCpLpWDgJhTqwcZ0wrhmz8RltPrBobZggnHHnHffbIapWv02eIN+xWBOnbzxrwG0gysQbcoi12LWNQ5ksl1T8kdhhJBebhHLmez/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=gfmaTwWU; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="gfmaTwWU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=o6FKGoFI9ZLraUFvxn9dm9AZK7JTm5eV660SsApFeIo=; t=1792223079;
	x=1792827879; b=gfmaTwWU/o0fp5Uj/CCjkx0xoY24vzA4QWSkm6GqvAjjSZXg1neAwGjw8A/9o
	2Bmtie6PeUtyJ4YgIOtTiXA/bMpG3ZD8TwAt/ISyhamV3OoUF5ex97fYw/oX9iqtqGgOPNfy+1KTS
	/6I+/74XcsKSd293Ya8+CHMlgmhdUlJ8KvQHRuukY7JLUIO60XCBDkfECAGVXbLvGG/z7/bpeNByW
	cUkvZaSOUOwq/57GPAl6arld0LQ/YhnMXiGLMZRR3YU/NmppAF1bwkKn9TccRJ7TeHXCuX8pqMu/A
	T0OiswnZGo0I/MsJUk+34mLI7EoHBBvOvyLj2PJzpnkaVrG4tQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xHz5o-000000019Pn-2n9b; Sat, 17 Oct 2026 09:44:36 +0200
Received: from dynamic-002-242-066-005.2.242.pool.telefonica.de ([2.242.66.5] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xHz5o-00000002bYt-1uc6; Sat, 17 Oct 2026 09:44:36 +0200
Message-ID: <ec13408c2971b387f37b61e5c6e647b04f16a109.camel@physik.fu-berlin.de>
Subject: Preservation of alpha history - Re: [PATCH 1/4] alpha: replace dead
 links in Kconfig help text
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Matt Turner <mattst88@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org
Date: Sat, 17 Oct 2026 09:44:35 +0200
In-Reply-To: <CAEdQ38FRnjHSSAWxFJqUBUL2zMRg5_GDcJJC3fx8i=K8ZWWK3Q@mail.gmail.com>
References: <20261001165018.415526-1-mattst88@gmail.com>
	 <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
	 <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com>
	 <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
	 <CAEdQ38FRnjHSSAWxFJqUBUL2zMRg5_GDcJJC3fx8i=K8ZWWK3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Matt,

On Fri, 2026-10-16 at 19:54 -0400, Matt Turner wrote:
> Yeah, I feel that. I did everything I could to preserve history and
> sources for the wiki content. I spent months waiting on GitHub support
> to transfer the "alphalinux" organization that the late Peter Petrakis
> set up a decade ago
>=20
> https://github.com/alphalinux/
>=20
> It now hosts various repositories, including the wiki content:
>=20
> https://github.com/alphalinux/alphalinux.org-wiki-content
>=20
> and all of the Alpha-related mailing list archives I could find:
>=20
> https://github.com/alphalinux/mailing-list-archives
>=20
> My intention is that even if I (and alphalinux.org) disappear, the
> wiki content won't.

Wow, I didn't know you put so much efforts and resources into this,
that is true dedication. Thanks a lot for doing this!

Might be an idea to also upload any of these documents to archive.org
to preserve them there as well. They probably have better long-term
archival mechanism compared to Github.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
