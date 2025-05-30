Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132028E7
	for <linux-alpha@vger.kernel.org>; Fri, 30 May 2025 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748584024; cv=none; b=R0jV7XR/4IhwhWA9NyhXh28yKXATZgSNHmJmNvbqs90l4fiWSWDvN9jsQYQ6/4DsPVUlHOUJal+Yb2uRMLcY3ZC0QfqABRGydVo3aKBZfb7wArMHnZe9kSheb7Zj1crLwHBm3x71hNgLNtazMdGm5njiuJcJs8Gx43Qqb9040FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748584024; c=relaxed/simple;
	bh=NKZ8dlaFBByJpOMqTQRuFo+wHa4ddwn5NTpYF7cYOVY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=l10rAtoY2qaXGsgZL2p50rwWKwL5Du8rgIW4S2uHjOXWu6vMMhVqg7brbYREhhhnSkh3zqCbn3m+spTKwnR6s1PuH8pF6V/D0AB6YvA0Xh4ubdgnT9dqNqgwjO5xVu03YPDTXtqYEh9xzYzxeDaNonp95Alcv2SQMrBacm4BnAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=M0cv0zFX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eiYLLS/O; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="M0cv0zFX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eiYLLS/O"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EFDD12540146;
	Fri, 30 May 2025 01:47:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 30 May 2025 01:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748584020;
	 x=1748670420; bh=jakZ95A68P0lTcX1Kidmk9FQL02m/iQ80KrmTnnDr8E=; b=
	M0cv0zFXagBfvMDV6KycAjvIbQ+IBfgqe4h5bSPhPsp+NyHf1Kn9yKEA0Vn77TD7
	KbEDCExJhzT8mMwtITcQ2cz3e4EIoRNUmf2S/yLEoypoYF0vPAdMhcYeHka+e7QY
	rLdZp7iXwmrmqaPrTzk86xpH6yBKXt66ydJ19uJEBLdn+9gTgkMU5ASJF0jO+/3g
	eBw+WO9DVNzf2rGs/1i/7h0LPC5kX2H9B726yIzUPUJJkO/8T3To9JKx5CVYYibS
	D3aCYWtuB/gww7yqjKgnyijwlen+bRhWhwiLs0sVVavzst0JlK+gucRN69n2OPTr
	vkgYBqbH/+Oi1CDQKLEwtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748584020; x=1748670420; bh=j
	akZ95A68P0lTcX1Kidmk9FQL02m/iQ80KrmTnnDr8E=; b=eiYLLS/ODoYNKV7MX
	YvH+NjiLd2lSIpaJlsGgqs46vVp7n8jvW/JjRzskgQ+cooz+1uc7aslq7XjKV8Qp
	vP7v2ZOcY/H7/Za3xovk+Z7De8KyyM4snlmRVe2t/+hnlylaS0k7kzY8kRFmWFAD
	daTykXASEQwBYAkDp5YhXuuYr0EfX6O8/P2J+V+xenUn0XSLmOGGGn/jpwApzld5
	Nc9rQ9kctMQdS0HOE6eHUEUbb5V4tGgJhIP46fWTSuo9gnlwW4pOHGcftBMivtrZ
	tNWpoZqOHeY++niWeH0wiecMKKBfvlzg5W3RWqkqgJhLy57Hrgk6wmRuHx5wEysN
	6nC8A==
X-ME-Sender: <xms:VEY5aB-rp3ULMmeWl0xSbyKd0im0XN6NOSqz5q8vvAuyQ6Am7uxzkg>
    <xme:VEY5aFvSq6ZFIklWU2C3yxyQtK8vJQX5U1RHPw2LyKiBFThs4QHCzm8z8otSzV14H
    VWSPvP3kmCCxAyI1O0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkedvudculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffg
    hfetteehuefhgfetgefhtdeufeduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnh
    drtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghlphhhrgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:VEY5aPCqaiMh0zb6fO3dv-DNanyJV8nD9sJkJYbFUM7suck-T8-Jeg>
    <xmx:VEY5aFfUIeQtQrMz4eE2SSTdyIBFswu4aziB4O_1tncchTNXa-eoLQ>
    <xmx:VEY5aGNXpfV5ALIYvW7O3chAdQvvE_9cA8ihkVtRh9xjsY5J1dS9vQ>
    <xmx:VEY5aHnDEw6pOKwzDvcBf1p0LaOp5vTqOMjb7TH_B8wrb1jm_43-XA>
    <xmx:VEY5aEvBQKX-1_l0ErfVVvLAYor75Zy2Rus9Tfjv2hgppzQSXm3GXAGE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6E4D7700061; Fri, 30 May 2025 01:47:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3d2bbbcab8a9bc93
Date: Fri, 30 May 2025 07:46:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <dan.carpenter@linaro.org>, linux-alpha@vger.kernel.org
Message-Id: <db221c64-0653-41c5-acfa-f7cb9e831150@app.fastmail.com>
In-Reply-To: <aDbE6P6e4gd7pbMC@stanley.mountain>
References: <aDbE6P6e4gd7pbMC@stanley.mountain>
Subject: Re: [bug report] Linux-2.6.12-rc2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 28, 2025, at 10:10, Dan Carpenter wrote:
>
> arch/alpha/kernel/err_marvel.c:884 marvel_find_io7_with_error() warn: 
> statement has no effect 'csrs->POx_ERR_SUM.csr'
> arch/alpha/kernel/err_marvel.c:892 marvel_find_io7_with_error() warn: 
> statement has no effect 'io7->csrs->PO7_ERROR_SUM.csr'
>

> I occasionally try to run Smatch against code that I can't actually
> compile and it found this code from before the git era.  These days
> we build with -Wall and so this kind of code doesn't normally compile
> on x86 or Arm.  We would get a warning like:
>
> test.c:18:9: warning: statement with no effect [-Wunused-value]
>    18 |         x;
>       |         ^
>
> So it makes me wonder if this code can actually build?
>

FWIW, I tried building the file with gcc-15 and don't see a
warning for that construct, even with the -Wextra.

After digging around some more, I found that this is the
definition of the structure, and that the 'volatile' in there
causes gcc and clang to not consider the statement to be
free of side-effects. I assume it will actually cause a
load from an MMIO register here:

typedef struct {
 volatile unsigned long csr __attribute__((aligned(64)));
} io7_csr;

     Arnd
