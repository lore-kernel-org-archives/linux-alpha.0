Received: from smtp-4.orcon.net.nz (smtp-4.orcon.net.nz [60.234.4.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36E25A655;
	Sun,  6 Sep 2026 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788661046; cv=none; b=KxR+12x48+fWNvu186VIvpxK+Iw7NQZnRIgk6R59f1arNshGwHDzJ72VhEdGTWpWEM4quOI9BwixAQHmUEogSP81S5hRMeUodg8Q9pRmC94Z0D8lcUmzGKw3VbIzPyW6wvvUY3WL4at+myHC+Vf1D3R36r4f1htcaOedULdgq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788661046; c=relaxed/simple;
	bh=b8TaBa4LiEzekil4Vt4bAoiS0AvQ2Eqv7bIMWRXdG3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltVv4woUzeZPUFf1gqUBGUMufsHgejW+Z74FOCJwPbKfM1JHO22fQA3lBH6qSPF9oQyCyuItq2XzvR0QjCx9H1RabkJrPm5EgMIouzsLW3cEBt33cMTmtlcIhoE34xvnZzlvklS3seAwnsnou+ETgfd9gHXalqP3MvAucpfR2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=sdiIUedM; arc=none smtp.client-ip=60.234.4.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="sdiIUedM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dTU2DK9Ec45Y4m03S6RF2YksWqUEMJXPgQusutCtZ9Q=; b=sdiIUedMNuF+AZGMzAwuYC+/95
	eCXuJu1un2+1n8Lv0eaDZbuWvoer1+0cZhifuaPo2vlaZwrLnJgfLLIk/+Ua6ulqGc6DihQLEYQM7
	7pV7IMkwb7B/BV4lVQS2tA4UkSq7HCc1J5buNSNm1x1Szxl6s3tbtE8tRuPqvjDFs4YxKS18ixuQR
	59PRof384aD3nPFtDjoGdZDvzTEJcTIBFt7HC8XxGZaJMnMo6bnZqxidtriK0K4JFRNVLAtTjblJQ
	YMFbdHMC+9uUYzZuGAOdMn+rfXNJh6jY5u90TafbDyCRc60yt8BeS/sDlJRX/Tm/hFjDMWRB4aTS3
	8eoajpMQ==;
Received: from [121.99.247.178] (port=32811 helo=creeky)
	by smtp-4.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1x321E-0007NA-3e; Sun, 06 Sep 2026 13:50:04 +1200
Date: Sun, 6 Sep 2026 13:49:59 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
Message-ID: <apzGx5Q19wEh0SwP@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
References: <cover.1788277742.git.mattst88@gmail.com>
 <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com>
 <apsqmKw1pLmOXVgg@creeky>
 <CA+=Fv5Sg1KjAZZ3X=Yh62hUr=5qeRg_ZVq=A_C4bBovde1MeoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5Sg1KjAZZ3X=Yh62hUr=5qeRg_ZVq=A_C4bBovde1MeoA@mail.gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

Hi Magnus,

On Sat, Sep 05, 2026 at 01:15:18AM +0200, Magnus Lindholm wrote:
> On Fri, Sep 4, 2026 at 10:31 PM Michael Cree <mcree@orcon.net.nz> wrote:
> > On Wed, Sep 02, 2026 at 12:34:50AM +0200, Magnus Lindholm wrote:
> > > On Tue, Sep 1, 2026 at 5:50 PM Matt Turner <mattst88@gmail.com> wrote:
> > > >
> > > > GCC's undefined behavior sanitizer has no architecture-specific runtime
> > > > requirements. Enable it for Alpha to allow UBSAN instrumentation of the
> > > > kernel.
> > > >
> > > I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on an
> > > AlphaServer ES40. The kernel built and booted successfully with
> > > CONFIG_UBSAN=y, and the UBSAN instrumentation is active.
> >
> > So have I, on an XP1000 and ES45.
> >
> > > CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
> > > allocation in lib/rhashtable.c. This appears to be a generic rhashtable
> > > allocation-alignment issue rather than an Alpha UBSAN problem.
> >
> > But in my case the kernel vomited copious misaligned access reports,
> >
> > Interestingly "kernel unaligned acc" in /proc/cpuinfo remained at
> > zero, which really makes me wonder whether these reports are all
> > false-positives.
> >
> Good question, had to dig deeper here,
> 
> Not false positives - real UB, but harmless, and I tracked down why.

Thanks for taking time to find the explanation. So, technical UB
but no consequence for operation.

Cheers,
Michael.
