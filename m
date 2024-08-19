Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FF14F12F
	for <linux-alpha@vger.kernel.org>; Mon, 19 Aug 2024 07:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053663; cv=none; b=LwsmLzUedxyY8FPWA3oZQ4vLiUIhYH55dDNaQKMSyMRxrfRvhmkT7Tlb+I+iZ2l5HhTNVMfU/+CnJd7QbvN16MTHdoXj9k3t3dESQ29uNu1XXMxEP/TF2H3B/PqfGGMfNoBIpOHnNgBgEXDMnr7a3d3EtgMnjE5YghqXFNn/MZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053663; c=relaxed/simple;
	bh=6KUS83ay2PnSKfpYYmN+cHz2MuAZTa12ApUb7RH/a7Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=txDwCHjc4CptBWXswKYXGpCOqAKR2CODLhwrs9Xfl1W40NNFTZJ7V+XrLcWD1kFGk02nTmRUQ5LHJXpwMesQtwns0qwbDn2ydZmf2XgqJrGghfZt84EPqwr0r+5i4l3QboNGIcg2STSC7OHXgqc6otTl8PUqKzoaMty+0rPogtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NfVldTz0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XnqF/Onn; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NfVldTz0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XnqF/Onn"
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id BF941138FF80;
	Mon, 19 Aug 2024 03:47:40 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 03:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724053660;
	 x=1724140060; bh=Qn8nu4ReGoeujtn0VmLJqejML1jHH4WP7yAC2GO+slw=; b=
	NfVldTz0cGB+6dmyNx5svWc0Ux/VvxwmupwJWq9ZCWdwk/8ySthtcVFM/DSLkqBR
	jmBXt1+8GRLY9AsFjLT4B8/VqacgLhTwyjtIpXCJmHhHGL3HW9nxN025JOHGxGK5
	lBs1T4i+PfJ97xnNGS0wvrxtxZQCq7OGn8/ZmSKGMT/M1ESXV3PoryrqHz2qRKN8
	0uloTN16wxCCTZ7Bgk/P5Z4iv/WiW61gtvSJS5jHEGQ5CM27kbi5ZxCJp6QQYh/T
	7CJWW/kTouSJ6GAv8H4NBbkP2NIplwvqJ6qBbK/AqWCxQ7V4MPb1CIbeeKJrL7kd
	PFqdQFgKeEhJw6iFKz0TQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724053660; x=
	1724140060; bh=Qn8nu4ReGoeujtn0VmLJqejML1jHH4WP7yAC2GO+slw=; b=X
	nqF/OnnXb+qIVZoDIW4zofAIzN2IvTKj6tIt67c7Yl793qEzJraAE22ktXENar6U
	E2iWZImC31lmt7FKsj9yw3t740qsROXq+psKeUF6si43168t0Dcva7Y4br9DCMIP
	jJwSmCb8mc4KIE1B/Q9RLJTFC1qa99iPvGGE4nz0R+dyyWnez8uCwHk7Os2VcHoV
	CquzGtJ4NoKG6VOe/62AZzQA9Z2PBgqFHAkFbGogpMH9LOkQOnsVar6OXzgGr3wi
	WhBBUJxKxr188QBRD4yYxHCOSwCPb3SJUqLxmBYmGGgL+KXm/CaTMfoizWiSOt7t
	5R6dxXxyIXsO3CkyVdqig==
X-ME-Sender: <xms:nPjCZnGx02S1O3l8n7b1k3WhJYYJA2zyluRZJ2ZwwzZB0GWCmw9EoA>
    <xme:nPjCZkUvsPlNYuVyiW2XHO7U71kXQ-lvWTmoOeZRXXEj7yHOlF2PYqbi7UfEggcww
    ZJ5EtKsge_ksFQXk3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddufedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhu
    gidqrghlphhhrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhroh
    esiigvnhhivhdrlhhinhhugidrohhrghdruhhk
X-ME-Proxy: <xmx:nPjCZpJ2ePueE_0rmG-nhltteloM4iofw5_DGqmKp2WZNQLps2N8iA>
    <xmx:nPjCZlEUTXyTvqSkoeqo5xm31UUePN7_c8V6_6Kv6eKcCOU4dV5Pug>
    <xmx:nPjCZtUwAmKpHGyUfx7DEfBrtoo3X-Cczn73ZKsJqfhpatzmSOdwaQ>
    <xmx:nPjCZgPFEO4UlRqnSFmhfX8x_AfYB8t6jTSrlGeJ1rKMG-qXf8fPQQ>
    <xmx:nPjCZqijMBWI0QUunnHPl-fnRQybXKtFAih9dLkRVwE6evCFjJG06XqM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8473C16005E; Mon, 19 Aug 2024 03:47:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 09:47:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org
Cc: "Matt Turner" <mattst88@gmail.com>
Message-Id: <12a409df-28da-4bc1-898d-715871d44841@app.fastmail.com>
In-Reply-To: <20240817181429.GH504335@ZenIV>
References: <20240817181429.GH504335@ZenIV>
Subject: Re: [PATCH] alpha: no need to include asm/xchg.h twice
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Aug 17, 2024, at 20:14, Al Viro wrote:
> [rebased to 6.11-rc1, sits in
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.alpha
>
> I don't really care which tree it goes through; preferences?
> ]

I've applied it to the asm-generic tree now. If Matt or anyone
else wants to pick it up, I can drop it from my tree.

     Arnd
