Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911778;
	b=s1YyWvmoSVcUJnN/wLAd4YY6FD/rftg05lgXNGl9gw04QEDfLaUKq5LL3L3PXw0Tuiu3
	 FhsQC3V4M5cLnGyjxD4FHmc6MmkXi8v8BrivozrEwvaUy/C5lwqKjNBa+q8/MubHT5zEx
	 xZQjukS/+GK7e/yoqd635HB0H1uB7VxVMfWz7B7LTAyBnfhnPLNqELb04g2UpyQLmBw+C
	 irDMdY10gSN/ZX5e+XlSsFaYBmyXFsUWZsjncyBVMZoPt+d9/llzb7bkm0mgNQG4U9VfQ
	 wujDgpm4DjnSHZHdCbFrDZ3FmVBkhw0679dgwEeDq+SVv3HJexAw29QUVNwPotyepyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
	b=ArWh600CiB8/LEadIqs6qLdwB8ZaHCEEIB7lb99YQapnxKoZ0qFAuYTA1YBc6ddhvl4o
	 KRz3jprhDiBBexfexGfYJWUDvFscc2dd2jAuMxxjXH5q6eZv0kSaL+RBb+4aA5c9Chl3a
	 hYn+Od6WRU0ghztHcHKfvFz2I/yBf260kUPTkXaPFdH6Hz7sq+Vee4hQaTU2g9M3IVxgx
	 plK5z4DtzBdeHzXWJq7Ui/HEc5TMihSnqD7DnDdogilbl4x0e8+nrS//4WTJ+YZy1FzHc
	 3IG1goSCTZEkxAIehVXhTi0IXD8JHx9qXQnp9eFUc+rQnnVUDOXrsw36VE/IiWVtEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AF606A32F
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085AF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2090626b3a.2
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793911777; x=1794516577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=dxBFD7egkald1diEtbXOBXzH+9cQFK2KeCaFgwFJNeVqQ39GNskIoMvqgylgnntMH9
         o6cgkIhz7VeqRWc76fFeuaZBrUrsO0KbXGQDOo8UnmsNxd5DuGBZMTkVsx2LFZXyCFih
         xLmHM8Mx07KTStSbatLB7JBcE69i+TN4sfwyGum4R7QrkX6GMQsP7QDdZp7bkXe4WTSN
         kjH+OioEJh4aowCsawhV76CFmgsNb84NAEAQfXPTtwRjk+/N+4OfpAi+RPh6ypf7I9Ji
         LwRr227XUyaN5rK5df3trhjeaIYVx8XGIDVL5DDAgaeqxIBb9EXYuq3EuqROZW7d5HLq
         L0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911777; x=1794516577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=dm9OLsDhMFdjPQzvzUYWx+sws/oUZMrsQ7xFMBAIWb3lABw5Ml5EdH5m07n3/8/4a8
         JupraZ3f/+cCdAo5WRD7EAd8AiXAOE7GzKpMfcoJkBaxCuNlLbWDvCTCRkCfVAf9CXco
         M6LteYcAp4Qp9H8BzqhNX9gpl7Fw3xdQS8H1lpyj1PkDSP+NbLYvWDdybOcHud3Q5RhK
         50Ga3HuPm+/PPgarj6eHvFqAwBZjsJkvtBkyDmhOcxGgj5WABJOFpl2aEMLpfxnIbeVS
         07nPtHdpU+5huZnU6NTOQ8bDW+81Na6zF5QbB1q3ZLRnO8LEP1Slo808Y/XliumbPJB+
         mq4w==
X-Forwarded-Encrypted: i=1; AKwUvByMZsx6kiqcfCh1M2sKrpPHLA0PKTxfNAqIYkTQmzXNtyyzoNNWbedAfhPlO/WQ6GkZVVsLBrTZGiisHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/K7T5o2kUDwXHz3I8k4PQvh1sgtfn8SmCS2QQOzI3iErXpdfs+
	o6SW/dcgDTcycVP3tbsghkpqOYEQrEcVJyv7PjGX6PP58xcoe0n3QtV8oiy9A1gnvj/JW0CPXFb
	J4Fnl+g==
X-Received: from pfbkr9.prod.google.com ([2002:a05:6a00:4b49:b0:8a0:70d8:a2ef])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f95:b0:89e:89f5:18eb
 with SMTP id d2e1a72fcca58-8b37aaa87f1mr220362b3a.15.1793911776710; Thu, 05
 Nov 2026 12:49:36 -0800 (PST)
Date: Thu, 5 Nov 2026 20:49:36 +0000
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com> <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
Message-ID: <auzr1F0HNh1mazaS@google.com>
Subject: Re: [PATCH net-next 1/3] selftests/net: pass socket options to the
 scm_pidfd test flows
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Andrew Halaney <andrew@amutable.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 17:12:34 -0600, Andrew Halaney wrote:
> pidfd_flow() and leader_flow() take booleans that pick between
> SO_PASSPIDFD and SO_PASSPIDFD_THREAD. Make them take a zero-terminated
> list of socket options for the receiver to enable instead, so tests for
> further SO_PASS* options can reuse the same flows rather than copying
> them just to muck with options.
> 
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
