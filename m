Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793459705;
	b=0LOafT7NFawKPtz1k+G67qGaWwt0rInAvB2OMNiDa1/AW/MJMTJ4u4T1DsYvYG6gkCJQ
	 C8TmUmqVzeCnCUVCXkAzihODECp20zgxB+WDJ5R7iTrfQp8Hn7vND+JUQOp0LoydlhPCy
	 XqIobYZznFOXTm0nbC7hKrprDp80zBmq8aSX8LnYgYkO8gZyzpaHzJg9z3qVtJZz0vS/0
	 Usm0zycWRbvAdcJeC7ZjMEZGAFg4jtGNIfYYiApD67kiRnQygaxkiEmc8edjynqJ/azaG
	 hTbgrKS2fCbyqtCvh3ZYYMJmKlDPLuOoyUKP1RMr1OKDd7WNYnVnm4JiJJQajrVWLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u4AoREHEWHwqK+9vsy9N5I/xo3mEZgUmU5DSaNM6uCY=;
	b=qGx14+UoZO9MrV41LXc27NPmDPgHLh7syPg4WFE8mlasD59D2JteV813qzsiIaEruphm
	 Ns5gAoLF42NoNMu7YeQ9cWUX9BGCTzaxjHCw+TUZ7HAPFUl/LJKl48kI9NQ8rSrHn22Wt
	 KGOmmRCm+D836nadojqt7tZJCA0vpevpqYWtFXvngjcqqONVm80LemVULdta1iKs0JMl2
	 erkwnp0NAWVRA3gcks5iVPDmUfH0sVHvFtQpxRobua7uBCseWwo672Hf1fWhxipZiINR4
	 Jt8R5zNBo8IVkeF70H6uKT0qmJScKjJavGGsFl7+cjTilltTGw/kXCfi1NTBtbmE1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PhqPg/E2";
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBD6606A32C
	for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 15:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBD6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhqPg/E2
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-77bf892b496so534337137.0
        for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459704; x=1794064504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4AoREHEWHwqK+9vsy9N5I/xo3mEZgUmU5DSaNM6uCY=;
        b=PhqPg/E24VOKRLpfl1ae1ubh4CKpCn29JqhLZjBp/MR26TAAiPCusNfbhZKqTqe7Xj
         KcQq5Lydqkv/yxQqi5C7ZY3ZDqurJIdEnXH0ucUJaLRRdFFYKlc9/hSNt/FBOqLJJqI7
         p6jj64s7228VWY/vk1afOCOip01plUgqwJps6dk4WwMDU5fMSszkrzQk+rwDSKDYE+HI
         68LbUdDAtL6NWwfUTf5zsmuxjMBjVb0I019RVHKueoF64p2AswdpFejX62Xr+afWIrOW
         DgPY165zFFs16BXhBuygZX7vyRNjKllQEoev9+VtxIjjr17scodCqljZafdWsq6sK09A
         Fhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459704; x=1794064504;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4AoREHEWHwqK+9vsy9N5I/xo3mEZgUmU5DSaNM6uCY=;
        b=oyD3lE05lHbWwYiHixeCn/Th0+bTstZiLFVzOkCeviWAuKrQBtEpOmHaxVsY2E/7Ns
         uDKoZWI7+vb3BpNjr7SjPVe1PBpDZCfCxgsKQJTnL6kIa0/LMAqCp1wz7rjANXz0P7mc
         +4AwSCQ7I3Kvn1WqO6NsCJSrTVRCBhyP1KV8ISEokXQBSlegwaeP7pp6PTkOJa1XFM6G
         KSp3CeTzYxfsT91faRpff1ufbZhVMaVEiZjAM1CP/Kx2/AK0ANZBWX52FlPs0g7lZ/NY
         oi6BGAR3BKEqBUrvkcUe9YznxxWTYp3N2dK42ie/IytmP/5DWpQ8qW3N9i3BrP/TuAm9
         lWtA==
X-Forwarded-Encrypted: i=1; AKwUvBzNXAVeEDU9XlLmPXIsSgGFkSXgeLZlneG82bibmaK0tJGfBBCu3uS3ZvFKf5scwfFfz6nXx7eIULVItg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVWgpp992tmItkvLXS5bqc5TaSkWS31xpa8y8hj3hmbGqsrp0C
	tra+DKoFtjiMhcYFn4UMHIU1JKUYPUi8vlWXGRM2Kncjkr5Wd7zf18Pp
X-Gm-Gg: AYBFou3nL0L0xAYR1BzNlbuAd0paDriPeQJqLARdfCNs+AAka/jMcnTqdnIEkkVffBU
	CYSatl3GWyw1ra7tIB0qEF6EUDR/QcTWqj2IBoBGqKAUQ+RlOQOcDxp2dDARaqmDAeI2OjVDzvu
	8fm6lzzmCLuCB8WxgEbhckNTJDp23KsfgGUYZjHYxo783JpDoWmfVihapVBWMsepEGt4f1cwlWM
	7Tth8JQTPpaY1KIr7IggQu5gL0ae7ZnD9ZYIA1ZXvM65C+dhKrdIbZp0ugt+PwGFG46/IM7aSbj
	iQEchm6Msr41x/rMXzH7j+FTQppIaobkgcwG3Kt7WUX+mRRPZwWWewQPT2QFpaHETo63iruPo69
	NVm2rIAPZSsRRcCF0RhAFs7JZp28YtA2Sfdr9CEDNE/pKIWhfQpQ9Dd0zDuaAS2t1ePTa0ccBGp
	tarbslRxdn1+wysAFiNXTMICRW3m99H7rq2PuAea+whT3q3Bs7GaMpV60aCCYi65uGSIwaprY+C
	qczBpB5q72Z/1gblVjEEh/wvl3ESv7OA2FXEh+NuqJvozq/D5FiLjEA3rayhHqcXjXn+Tsk8fTV
	T8WSETGbylJKygNWeH/CAoOnBOCyEPknwpgl/FuX7F+5TdL/5lURD/imKMhEED+Xl/RBGp3r9Qs
	IKEuAPmMn/pYIqyI5Cbtw3k4+sq8/0nC2ASjFQsfa/V3bYEywEMqiryruYd+4lOsDFZSv
X-Received: by 2002:a67:e116:0:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7d072d759a9mr2050864137.36.1793459704527;
        Sat, 31 Oct 2026 08:15:04 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c5d183sm6032016e0c.13.2026.10.31.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:15:03 -0700 (PDT)
Date: Sat, 31 Oct 2026 11:15:03 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Vitaly Zuevsky <vitaly.zuevsky@gcore.com>, 
 netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Andrew Halaney <andrew@amutable.com>, 
 Jori Koolstra <jkoolstra@xs4all.nl>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Chuang Wang <nashuiliang@gmail.com>, 
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, 
 linux-arch@vger.kernel.org
Message-ID: <willemdebruijn.kernel.e08dc63db124@gmail.com>
In-Reply-To: <20261031113330.45704-2-vitaly.zuevsky@gcore.com>
References: <20261031113330.45704-1-vitaly.zuevsky@gcore.com>
 <20261031113330.45704-2-vitaly.zuevsky@gcore.com>
Subject: Re: [RFC PATCH net-next v1 1/2] net: add SO_NO_RFS to exclude a
 socket from RFS and aRFS
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Vitaly Zuevsky wrote:
> RFS and accelerated RFS are enabled per host and per rx queue, but
> whether steering helps is a property of the flow. A host that carries
> a few long-lived flows which benefit from steering alongside a large
> churn of short-lived flows has no way to express that today.
> 
> Add a boolean socket option, SO_NO_RFS. When set, sock_rps_record_flow()
> does not record the socket in rps_sock_flow_table, so get_rps_cpu()
> finds no match and neither software RFS nor ndo_rx_flow_steer() acts
> on the flow; it stays on the CPU chosen by RSS or RPS.
> 
> The option is kept in sk_flags so that sk_clone_lock() copies it to
> accepted children: setting it on a listening socket excludes every
> connection accepted from it, while sockets the same process connects
> itself remain eligible.
> 
> sock_rps_delete_flow() is skipped as well, because a socket that never
> recorded itself must not clear a table slot that may belong to another
> flow.
> 
> The test sits after the TCP_ESTABLISHED check and inside the
> rfs_needed static branch, so hosts without RFS pay nothing and hosts
> with RFS pay one test_bit() on a cache line tcp_recvmsg() already
> touches.
> 
> Signed-off-by: Vitaly Zuevsky <vitaly.zuevsky@gcore.com>

The Documentation change can/should be included in the main patch.

> ---
>  arch/alpha/include/uapi/asm/socket.h  |  2 ++
>  arch/mips/include/uapi/asm/socket.h   |  2 ++
>  arch/parisc/include/uapi/asm/socket.h |  2 ++
>  arch/sparc/include/uapi/asm/socket.h  |  2 ++
>  include/net/rps.h                     | 13 +++++++++++++
>  include/net/sock.h                    |  1 +
>  include/uapi/asm-generic/socket.h     |  2 ++
>  net/core/sock.c                       |  8 ++++++++
>  8 files changed, 32 insertions(+)
> 

> diff --git a/include/net/rps.h b/include/net/rps.h
> index e33c6a2fa8bb..5afa48868236 100644
> --- a/include/net/rps.h
> +++ b/include/net/rps.h
> @@ -98,6 +98,13 @@ static inline void _sock_rps_record_flow(const struct sock *sk)
>  	 * [1] : sk_state and sk_prot are in the same cache line.
>  	 */
>  	if (sk->sk_state == TCP_ESTABLISHED) {
> +		/* SO_NO_RFS: application asked us to never steer this flow.
> +		 * Tested after sk_state so the common case stays on one
> +		 * cache line.
> +		 */

Avoid verbose comments. Bots comment a lot more than kernel style.

Also arguably incorrect as TCP_ESTABLISHED is the common case.

> +		if (unlikely(sock_flag(sk, SOCK_NO_RFS)))
> +			return;
> +
>  		/* This READ_ONCE() is paired with the WRITE_ONCE()
>  		 * from sock_rps_save_rxhash() and sock_rps_reset_rxhash().
>  		 */
> @@ -111,6 +118,12 @@ static inline void _sock_rps_delete_flow(const struct sock *sk)
>  	rps_tag_ptr tag_ptr;
>  	u32 hash, index;
>  
> +	/* Never recorded, so never clear a slot that may belong to
> +	 * another flow.

Never is too strong here: can be set during socket lifetime.

Even if it had been correct, still another example of unnecessary
verbosity.

> +	 */
> +	if (sock_flag(sk, SOCK_NO_RFS))
> +		return;
> +

Both here and _sock_rfs_record_flow: probably should be in their
callers, like the other precondition check rfs_is_needed.

>  	hash = READ_ONCE(sk->sk_rxhash);

Optionally maybe also skip writing sk_rxhash if this is the only user.

>  	if (!hash)
>  		return;
