Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492331;
	b=Ma+ZipLbbJ8HFX/8ekdOSp7I4IlKvyeCevteDbyGTT/FlrNEM/vO6wzDe3uGbCOrKgjz
	 dA3UACZ4e+KfjhccOkH2MwTWF0EFgK/y7t8igN7iIDVt0BbeKXcqUVob2IDJ6wfElosYF
	 fg6Yyk7hQzbf+SejP8NqeL9NX689MqUI0KQTr984Gu8m24PjOES1BDfij0f0g5Lv8XJvx
	 UABZ3Im5G9tS0zwXaq+s1R0YOVoHr4dl6EjDMUR+EnC9wpFMja5tjyZKxGl7Ix11jklpL
	 ifiaDYIkAnMRA9h3A3TyS+ntG41Bk1nBEHckUiTwwUYtKJc4AOEGHUZHWoaiWROsBsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492331;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=;
	b=Tm0Ud/0fmCPljplwGfM7QD6t4cQ0L+tOyQ5SWN/Zonjuo40TKj+GGtMXl20NB7O2lrzv
	 4RQK1fhFPtt03nZTE3Dthhgf647j6Od11IYX1KXlemLMNJYs5kXh7q9N9t7jN7uGLPIFq
	 FndfcsxuRv6+v5Du59IhgtbZfJpATDK8t3KK0+ToHr+VIEEyJlzUolVvJnQm1AyOcRqX1
	 YHV1W2KaSWhKnCePn4Pr2VMnvY+djti0ndqWf/sUnEZZF5IB4XCDsBtSHx2axBUdsaFXY
	 FbPwdQC08AjiH2BgNINGNpIZmkyM/hFSCsYnPTaItOuEVjC9Ptegrpo/K6+UTZmry6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Xh+h1wSV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FqEKdWwe;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FCF606A321
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 14:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Xh+h1wSV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FqEKdWwe
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4B12B7A00F6
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 09:05:30 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492325;
	 x=1794578725; bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=; b=
	Xh+h1wSVBu44nSJ74HnYBVZC3D0EBf1F6f0FHS7sToQviRCNenAi+z0CBn0Jwnox
	ejnFqzYKhIx51SNCnaUSnZzzqrQ+wqvQckDK/fMjWzFOO2enBez9pGWqHZf9eS79
	7TqHB9QdwSNlpvFDqzH0SPMAmX3a3kSolXe6DKs+ij1SwIupxzQzK+bPO+p5fSpZ
	YEtrA07xt/Q5H+cyOb/m8WWQXhqCvZtYZBN5r0VTNpsWfLsx5KSYwLH1gPTz8wh7
	aAqiDcYOqUbLfnb6FUeX3j1uLR6qs97kX1JsfW1YijTycwg1n8uBYQy+YQQIx/rG
	6nqV9Rtub99HBhD3dooiXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492325; x=
	1794578725; bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=; b=F
	qEKdWweWYKGwAOqEQHtslqgHkl02o+VAPHTV+Ok0UxkqW/umCZK0USiDkcQGDmnm
	zPqB668MutngAEMB6/B4Zt3OVm3JGZi4AHkcmcwX4RIJEQwks++WW45H32q4p+AI
	J0HR4qb8etAY1z/DVsxOmHZ/CWUTbosqjobcqGf0CTFp5A8O1Cbr679+KBZH5Map
	oDlpoY18EPMZynyf5mjNnsHtfwDhd/qStKlC7GIJ7InkQPO+N9RaeZWMt+FCvmZR
	vnaSVJrvgEMOkz1zMQrY+2SUBpg1yhVk/8oOekR4AMGm6Mw7wyoDhXo4bJvfu5pD
	tMEv9Zan5KlrwtvUv90+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492325; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFscGhhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:hEDq2SVQOg1wGJ8lqy+wBvSfbGOJ/PZd6n2QYyf+BLLyxFe
	IiI8K9rR889yEpJk5EpGSfPUhaOK1GPoyJ7Bcya4CxeXAjaMin9+BPUM0YWQBTW6
	t814E92l6KYXzRWcQFeSpZMI1zsyqJBxnfnBw5SXVQgjO67ezv7+l5OofXNA8/B1
	yEPqdDhCtaV64+qsWxVoOIdsvMampCleHD7hNPL9PsRM2hNK8VhQBR+yVWxUn4sI
	kgEz9o2d7koAXWGcP//TbfaeaAajQusmJzrb+Y0wHY4jtYa3qTnHuMUFGZpcJBHF
	RJ3S/iDpBSH9cPhPt15yBXdFK7KpCLu4qKWx07g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:V60JOROyj/FCtqcbRKRyHTpWddfUd3jbk7dyOJsukjU=:Of2aUQiysyEawKxf7qyisIhQXXg6zSM4x99cDBoHPUk=;
X-ME-Sender: <xms:oMf1agFOMxhRnSVLuDUoykP5UcEaUmqTFjlXdqyO2uB6F9su6yRNUw>
    <xme:oMf1akLwZwhweZnV5ZmnIfs10GzsHsK22-pTYnrYX3V-cjegvJPl_Myftn5u0Gbwm
    DaCWXLR_MoNxjIEU4nSmSLZrTGV1f3nnW3z6kcicXNxfBcD27jZuRoh>
X-ME-Proxy-Cause: dmFkZTEo6VaWdj6bxILRHhv5G1jOW57ujTVJlC60OvW6f6oZAOkjAhJfLyfQ49u3ydRqSD
    6McsbenddWiSAoIlBf0W+NIryEOud74ndQRz1ZNlMraGhXPv+PXtGwEWkyMxloBFs28AM+
    VC192GnF3PbfCLd/7+bSFeIt/B0QBaOAfOsIn395cK3dTopXenIvBp6SQsQKB6phN+B9N8
    64zvJ/tH5yyX1gC6DuvHI/QxWEKFFTCz3bKka6l9Oc60EMdBZdJIR7mDAcEwPZSfBGmwPb
    2Z9OY6PpxO64z/9vBGotM7b8//4i1p4MJhV0SzERiXc9YegNJHS2YEhsW2FEyw/g3Y3ZRu
    oYdobkUaJL2vVkuf3T68WqVhzELvAAGfVl1I02wG2/C2ee5pG4BsL99/ufnRR/RMRJfUDL
    IAOiMCCS/0lXXQL0QiDC+S9LQxR0GnnllNps6HKEOYOzABoYBb73irVKV+/FvcBrj/lZlt
    KNgU5rRvLdeTEsl5/OmCVzut8/pJmcfBWSq9jgtDWtKtfbYVKtPBr6tYGiNLXE4KYwDsCX
    TuSkgz3NcCJjmEocAeYLBdE3MtcNWb4/YseBTWzbPMmhrXkYZPYwSVkCpchNqNRuriNhqE
    AZrpEdcFFaE1gBWBqfwXUzpCNEzsnW4FNez5rGN8yS7XzeIux+zwtk8TNIAA
X-ME-Proxy: <xmx:osf1avEZfAfXrF6erZ-8PXAN54m2ulAyFtO0FYzjsf_1FxrnbaIiCQ>
    <xmx:osf1as8BNfiWFYPBCaJ86GPB2RJe4q470hV-HuChed5yBLL21RKeRQ>
    <xmx:osf1asSOl9G_RlHWFW4hJcVJeg1HfYqN5torsMoo160Yk7Co8S1WEQ>
    <xmx:osf1ahrsJhcpjQbCC8-euvDiMkYTBNRXBWR9bHNczCu6x11eef6VMw>
    <xmx:pcf1ashlANfxc3dlsCHW7RA00z0RWpZW_h8YKAmt-y_S0kOrMRqVWIb4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8FB1332A0099; Thu, 12 Nov 2026 09:05:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A6ErS7mxpCYw
Date: Thu, 12 Nov 2026 15:05:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <b728a698-bac7-4cfb-9eba-505f955148eb@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-1-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-1-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 01/15] syscalls: Make --abis parsing more robust
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> Some archs Makefile have something like this as the rule for making the
> syscall files:
>
>   cmd_systbl =3D $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@
>
> The $* symbol is evaluated to the variable found at $(uapi)/unistd-%.h,
> where % is 32 or 64, resulting in e.g. `--abis common,32`. Sometimes t=
he
> rule for the file won't have a %, resulting in a trailing comma e.g.
> `--abis common,`.
>
> Currently this input is transformed into (common|). This is problematic
> because grep will then match any ABI because of the trailing `|`. Make=
 the
> syscalls scripts more robust by removing any trailing comma.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
