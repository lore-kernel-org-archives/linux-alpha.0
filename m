Received: from smtp-2.orcon.net.nz (smtp-2.orcon.net.nz [60.234.4.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059D87260D
	for <linux-alpha@vger.kernel.org>; Wed, 27 May 2026 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779847541; cv=none; b=M1zA8U+Ld3kpYyK2VLQFrk3sXCMMoNql9aztVn8p5Wf9ttomaLDROyCpOFEM/ZbxEGb4wMfEs4A2AYnhOLwAPQ+1/vYxTofbmRDktKuqNHt5pU9qjVZmtyOwo2QhvyBV170JCmhRR8c4Ory+Zsr6vn/anvUKepmzcozjYZoyV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779847541; c=relaxed/simple;
	bh=QIJ8prmJrp0K0mntZAzPx/Qyli+FxeAZCX9ffAIPuus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJWunemD+XBf2V3FVbpAg7COYDo0c9Ly8gKT0o4jPN9U0MFj+39zXi/63sqqAPt3mD7ic4PjSgPdK9QvfvsgrOpqXUjInUP2iQgHX0/Ac5tqWaGDD5R/kiqLKc8l0C6Z9upR2YwN2bPFFrwu82DgXqBvDSyvs/L2bJClJ+SLEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=URvVAL32; arc=none smtp.client-ip=60.234.4.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="URvVAL32"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rYjYHMGJUiohY+X8RkA8iwBpsozq6hdH2Jrsp7hODdo=; b=URvVAL3286KNYVmHR8kklHfhKL
	fNIVLgjXH1Khzb0dzLZcpt7nGLvQhvC2H6xgzZfGW8tLGFf/oAqd7Xrf4xW+/2/wvj38kmdmebT33
	s8Cf9DWoBkT/q8DrzESdRj7RCMjVoUUlkWCt0hkr1E9N49+FuYaGEb9U5MCpN/dwRkEYWW3DtuCCE
	8Auaxonj9UbArSFcOd/U55oopp8/IZd5cwxrumr2qQv5fJmhp5oDhbJm8rQF/oU5iFr50HEPEUlNd
	ed4zpudIogz8ukT8NrQhQ9B/V1US1o+82rryZsw4OFZIfJh4bM7Iv+qGpTsps/tgjaht4euJfgfmQ
	7gHm64oQ==;
Received: from [121.99.247.178] (port=22029 helo=creeky)
	by smtp-2.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1wS2uv-0007ec-2N; Wed, 27 May 2026 13:18:41 +1200
Date: Wed, 27 May 2026 13:18:36 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: Mike Hlavac <mike@flyingpenguins.org>
Cc: linux-alpha@vger.kernel.org
Subject: Re: [PATCH] fix typo in alpha/lib Makefile comment
Message-ID: <ahZGbHHNVIuYyx9t@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Mike Hlavac <mike@flyingpenguins.org>, linux-alpha@vger.kernel.org
References: <077B8D13-7C98-467C-A6AF-56A8F372B547@flyingpenguins.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <077B8D13-7C98-467C-A6AF-56A8F372B547@flyingpenguins.org>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Tue, May 26, 2026 at 07:00:34PM -0400, Mike Hlavac wrote:
> Fix a typo in a comment in arch/alpha/lib/Makefile.  “Iff” -> “if"
> 
> Signed-off-by:   Mike Hlavac (Mike@flyingpenguins.org)
> 
> --- /home/griffin/kernel-hacking/alpha-lib-typo/Makefile-orig	2026-05-26 14:49:18.246555089 -0400
> +++ arch/alpha/lib/Makefile	2026-05-26 14:50:32.805555377 -0400
> @@ -6,7 +6,7 @@
>  asflags-y := $(KBUILD_CFLAGS)
> 
>  # Many of these routines have implementations tuned for ev6.
> -# Choose them iff we're targeting ev6 specifically.
> +# Choose them if we're targeting ev6 specifically.

I wouldn't have called that a typo.  I would take it to be shorthand
for "if and only if".

Cheers,
Michael.
