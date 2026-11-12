Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492472;
	b=EIRoKQnsWdozl7e0hBnTx49chgUUN9MfnSNo8JQnMmwxBU/VBPRdfkvqxatfe25UUqBD
	 SNWP7Ab0i2wsfDz9x+yucpc9kx6TCN1o1QtEedWsx4hjm0u6HjiA6WrrLxWwJjXC7EAD7
	 tLDvE6m5s6vaQqHCSIS7I1+DARh0I6KOHFOBmJAvCku3J42UpbAKe2E57vg6e/PtOPytS
	 QXMMPZCyaR75Q3Go7CfUneUnc8KEYvNetvoRVhQr+2/ggeMPLvMHKl3YmEF8NdhNHmuem
	 bMM9wMICMOx4DQcPtrAnzfvVu7H74Yd3a8fA8smGCkyXywWZE4uQPSNMQDG7246Zcsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492472;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=5GXdvZHa3knndYwSDmToIG3fcge9m7l+oguuWUgRnLk=;
	b=oEj8TeGwPXH+uWofB58696UIx/3V5ChoQeqHV3A36ZN0ZQXkh5LCJxzzzqqQbPBeezim
	 PN2EkaW78Cu+ksSp08ZSsXE7VaKwUsbNG6dWHSuTtaaZnx4Em0GVQWMVOcyL2Azru+J0G
	 VpSP6332zhEsghQQmB2Juh7QGTLh/jplBekK/t483ugl6coc+VlR6GL/sOVnfWiqD6uki
	 AJVLNZS3hVjh72A+wYiBLnoxwyzL6KjOo80GJ8P0jAU4HsG76FtTr+mP+FsQRq6e2SJua
	 ZUPxcuq94dxS2AcWSXMhzpbJ36l1bMq5wesZjNDzOjsww/TJ+RmS2raVsIvSMVRKRtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cRlAZarm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QqHaFT0F;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F7606A337
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 14:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0F7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cRlAZarm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QqHaFT0F
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D55647A012C
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 09:07:50 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492465;
	 x=1794578865; bh=5GXdvZHa3knndYwSDmToIG3fcge9m7l+oguuWUgRnLk=; b=
	cRlAZarmZS4105Z8tE7f5RDZYNntIRDnBfMMwHtbWXAlvjAnUs8euZwHzC1oA4qV
	g1bITi/YN+sbnyrChh/8anW6sQGvnqA965k71YUZ18+D4wLBl1MkPCgkyT/HKte4
	BnpFI1Almwv7zBh0yge61xnfmnIJ3D14TFtgf94jeLh6pQ4kpKOAxpkgGPJ4CX4B
	XlOSs37j/bSR3CdqILwBv5+w9TmIccKFqV2TqXbkCYwi6R50mLbcw57uR91SIiKs
	tFCUNrBIqj4sy9V+Ukm8Op7fGcPOJjUPVjAvogbXgOEDgCf5Y9t8ZSRcAJPDVdRW
	Osd+XB3y/EwjtCI7jz3f0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492465; x=
	1794578865; bh=5GXdvZHa3knndYwSDmToIG3fcge9m7l+oguuWUgRnLk=; b=Q
	qHaFT0Fm+Wxf3hVMxQa558O3fZ0Go6Jvi6S274zLQEJS6swjaKCN6kB3AUwkcVZ4
	dHDEA5RRuivP73JeVzYN2a5M4QjNAqcGSjHw1HLzo2U59UMJIODJxa6SnojiP4lH
	Uj8EcGbNTu6T+rJayzrCydwjkYYmRenBBxShjzXDHIPuKBwWs8nRPX3Gevj2Tt8o
	AJNjpm3Rw9AO2nlSHmfC64ON2h78tL2HbGW6/r0IvWKMsJOacuWA0cFZV3qOs1bQ
	nWepqOlxwFocK7Vu0Jab9gbKs2dT7oHaoq659r4agjGKZkHp0pXjsKU/1RcZxXY3
	ZKiLkERh/JVcsTsfQvhkg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492465; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFscGhhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:P3X6lukAQdHE1KhvFaAwV4cJMjN/D2i56FIUAfWMi3XJmDo
	+TIw5lPR1J7mu7qIUpyCAvx8jQMFGWHDiTLfDG/RH7WCmfBVjLI9+9LIT4Af/T/k
	VyR4Ln5XGDIPXT5s/X7pedqa/93JYtDamXnrCYPCaPSW/tY8DY9F7dk3yIHHnY/w
	uhVtvC2hjdX+q/zPOWS05gjYaUr46Mo+uRRTbhUcA6ij0Jy7paCpq3U4ELFQO2V4
	0/bVGs4vLr1JfERgPRfysB9Uy3SBps9MKlWtVuG+6ftQ+gNdW/eyvr6uLh3q6qmM
	alXBNOSnlVa5v1lqiTRVCsskCU5KtEDsdl98Z3Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zJP+fHFCTvxBi9D/O28hUzwh2VX6rVFNk/0QKB44wyY=:8TXN24dfbYOYJLrLvVuV4dl9S5EX/zjyzYT5+JZds8s=;
X-ME-Sender: <xms:Lcj1al2oDFJnOlUAmK_BhKEcST47Y0N6e5UIX07eNEXBv_yYUlsZtA>
    <xme:Lcj1am4R8gX-0bHXcCTlyCS1H-JNx-BAPKywKQ0kjLuDYlEpivo9LVv98dmWysKay
    3qssT5BdSa0DkALv8tcXnEC-qPrdrNxsauOzMj_NzZPFMcj6E7oTzM>
X-ME-Proxy-Cause: dmFkZTEghsy3+LDBk1J/jXVYB3hbg3urWjbCnf+Is56K6KlyTy7hIW7mdHHgDWmuP6IaSb
    ZDXdDcOc8EV8xGJ7CVkyaa8YfJnz+Oz5uIt8kzZFWND+RFfODBO8sLHZboCnmWkQc0NtGG
    l3m+7yn/hIETUBKmCSO/0i8f92jbpUkfzY35dzz2GqeR8krzd/ZZtpA1opel6Labd8o8Jr
    MepMBknmBvH7aoLJ+2u/caDVcD2sFC6WrTvozBvhoz+OtDk47fDCPU9aDRAS/xK9Z5NRJV
    eZ98T+xm+0pq/5D+gOcXKSGMdgNITE5JJLPWGOTTJ8yb37oXvlE+xkuERaKDpqamuH6Znp
    6jsnsra3ZK0HdT4HHKtvD8eikpleAHDfwks7gof9zPlIUPsvoTUFbXoatjBALn7XX1se9k
    kCeWhN1h7Ygg92ZrcUrSM/mCxz2MLa/YggUp+0ssbZVkcA3RVSmma9cljg8YjYKA7fE1vh
    BRTNx8nN1Y38eUCjaghHkPadoJuJID/h/SAhHbZKAMEL3WQEKGmncFIC1zTrshehz2GSt2
    0ZD9dYFtc8YO8UDcWym4jdmJoX6Blmvh1WfUaM9DI3Faa6e1EiPsDGYj56HHmNQC/lZYlx
    B1NZh6hbAg7ESf5+tvi5K4i06eDUo822q39zlCb/tB5MexwQOpyv+Kfk/SCw
X-ME-Proxy: <xmx:MMj1akaCpyajzwhvAHKKZ3HZJuUDzUBJAMdPBUx4tG84ACWN6y34JA>
    <xmx:MMj1av3Oj_SGPc4gcInww3tWYrXMmHgYyqV7T113ctRHn8jyHVYBfQ>
    <xmx:MMj1auvfUe2etshsDERBjwS6ULQab0lCcKkEXyrIW_sbpl8v72g-IA>
    <xmx:MMj1arBIPygLK1JsaclQxxjbHq9DZQwyg5dqTqfYUfb22rZx5khPDw>
    <xmx:Mcj1asAQNZSZLBQmYqLGCj-qn6alc9lGF0WTdC3VDXPX5SzDibl_9SIC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AEE7532A009C; Thu, 12 Nov 2026 09:07:41 -0500 (EST)
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
X-ThreadId: AXRzvbN5yUxV
Date: Thu, 12 Nov 2026 15:07:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 09/15] syscalls: Add an option for offsetting the common table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> To better support architectures that doesn't share the same syscall
> numbers, but have them in the same sequence, add an new option to offs=
et
> the common syscall table numbers by a value. This make it possible to =
reuse
> the common syscall table for alpha.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v4:
>  - I was reusing the logic from --offset to apply the --common-offset,=
 but
>  the logic is different: --offset does a string concat, and --common-o=
ffset
>  does a addition to the number

I don't understand why this should be different here.

    Arnd
