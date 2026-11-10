Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304784;
	b=kxXMJ/vD3GHC/LS8zEf4/H7rK3rppnRORLCLXUb84tIIKkPJveTcmvXbm9acj4V336Xn
	 zXhMRUnPvTSp3ZAoVv5jQtv0XTCVvAq94LuSc103A+PjrZtzE3H78BIEFydqESSP1A0vP
	 2Vcr9Mc1AQUo2l64m6fSDgdw9Sny0t2lRd3XsGg3rS2vbSg2IEyh3R/Z49sKBWGLE8FJ3
	 VIw7eV9adaysSPA8jbKYEPY7MlcMtfCwVLPnQrrgur+kbQs9C78c2x/keGIHwPaMgYVvR
	 SOqmPgdOMPqQ5kkqZehfWJHuMgfbj0nIw8SPgvRR3pd2wsKNqxstKDwMM7p/O5C3FhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304784;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=dS609oZwHgIhq95Jvw5UbkteyXm/ZWtowKfcXcT5wbgB4wr0uyDViLR0Ow5Llt854Lwp
	 oB/brRzUF6biM+rDpxhy5XWjDvFTWZogETHzjLNP1UePJm+amtCZ6gxxqUCSO0GNKMkog
	 BJlD4oPlurT8CcEJUWVQOWw2lSvJlL1FaAaR9BszoHu/hAgKefnDl0P+21nVaeulMvEBD
	 F6GHfaMLkPPThuMcobyipveVNK6GxiKT++iZKSiFQDxhqVs9cRvF2EnItKFIYpV6aUrxW
	 G8Z53RDIbh+ZmbBz9pyL8lxRQJ+Xw4giNCC5xvtPKGhzckGvnyHdIYDcpDdLJ5eV+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pwVcifKi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31298606A331
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 09:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31298606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pwVcifKi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794304782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=Sr8AcXcQs/idA572AS4kHK5mkBfqbzDUhsVXooXETEkLQUhNdhAjrrhn1qTbuC+1RLV99Y
	3t9yLwAtfBq1GB52cSdNh84FMArl5mXWzx0Qsvx8gDze9t56Fu08T5o0AUqJnET7cvToqF
	KOJIb4WneTE/JXNiB/eY8Nt9kDXrIBo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-hJUHoHr8OxuueJwXIVaRRQ-1; Tue, 10 Nov 2026 04:59:40 -0500
X-MC-Unique: hJUHoHr8OxuueJwXIVaRRQ-1
X-Mimecast-MFC-AGG-ID: hJUHoHr8OxuueJwXIVaRRQ_1794304780
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1041708f8f.1
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794304779; x=1794909579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=pwVcifKi5R717WwYht+A5NQ+1KUnmZZJM7aqfetEvTH5Jax/idjFuxSMvglmNksLc5
         qZ+o51ofJXR3ufizsYt/C7nPTmwEl5oCWtcWbEN3A9LXFI6DVFOvlOPwFR+mBvniQya5
         FSiS4c+4lqeC28O3zL0RAFbiutJU+k9EgRX+J+gY1GUIvC3QKDKyqVeLeEAmNFCPMhR1
         f19LqChJ2gvWqT+L73lAiEV9pwoWUh17PA45v/hsBSZWsTlzckDM2mCjzTvh0Q8mAEBi
         /Pqz1/V3OfyDAW0OxAoPyHcnvGqyWjD5dxd4HBiISoxV/cUcDU8GJ9VIricHnmaHp0nW
         bIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304779; x=1794909579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=SBmcCtXL9T52j6c7cIunjSdBGM1SrVXEOv2skYGZXLrF/7PA9Daf0VErIPCMbRt2bC
         uHkprvBRazhPrrZPps/Sf2MAS1uNweB1Bk9bPYnELzCIiym61CdMvZKeXaM2NN2289h2
         TXoMgsg7gGz9GXF/ze5eu09047iMHNzzCYVaSSKnIlTVWpKr13WsEcJ7B7b8tK3Dyr/L
         Vh82SuJUwQRbnhXylx3Vl1g7P0BoSy2j6MtO5PDGk9SQbMcHvzgiL9noOiY4l8lfbfG0
         F0fZvFQk0a3LnLG4I3TvcAVH0rSaiYN8OrbIdugWrCebMWgVdoxY4MZ7zDUvcXkB2AOX
         xsdA==
X-Forwarded-Encrypted: i=1; AL+hErFCzf1Y/NJHizS+hEhtvs8QqvGn7dzX725WZq8FJnaD5x75hNjdnwlsZp3o5wqr6/t3oit1rvLRw7YjCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5883FhvAuemwaXFGlqardNgMlBG6Kn3m+9sRNi1jJlpD5G74N
	sXa5PPOG/yNu+hPm3NV+lSik1zxfvz1BqkCrZflnyOK4cq5bWKeCHUwRH9MhCtr0aMSDHn1b7gc
	IO+XYhd2Mr12/S1nUke95Ky34hjMTlh5GJKtGXTSoZXboszTAllEIRenjPRDVJFy2
X-Gm-Gg: AYBFou3lsMgMlQFkxjp1JLFFPG3EtK6eT258Je+w7ddI5KDASAzWt8sM+AfVdu/cint
	ktEv7xS2B2qX1aZBbCKNvlVG8U9cISbtS6liW/ixpOeBAj/bTBpy4eRc/x3p7iaxSF4vyiXcI5p
	bjWuNZ+pHAPWNLuuCYqWrSc7XINTENkZ5nqxDYOx00ly6p+0bvWUWvg8lfCeJpU6oJs9npMdSNE
	07s1uCCCsjA7uDg0sSW6zBQEq6jchMVosvQtMoze66WXybELEsPSqKO9dgcY3dwgnxwnhAlbVRn
	aJ2WCebZZ+GEBIlSFC0SsTpT70xbNWjpWTDWWq3nIHK/LayLzqxV+BCwraskJiI8N4VJR+3TBJu
	niaqUiWzZ6nnXraRcZHv9Z2odc+pvvzzDyDOmYJNGY0zleWJwoZSLHaiAaOymqQVUZJhJ1jB+a9
	FABrMWA9TwBYc+gm1XzYRnKdYel55qYwo2OJqQYaycLP4e
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932575e9.14.1794304779695;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932105e9.14.1794304779321;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fbf75sm44329265e9.0.2026.11.10.01.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:59:38 -0800 (PST)
Message-ID: <c3e7afde-65ac-48e2-a89b-9fc1ad42aa87@redhat.com>
Date: Tue, 10 Nov 2026 10:59:36 +0100
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
To: Andrew Halaney <andrew@amutable.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
 <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 00:12, Andrew Halaney wrote:
> diff --git a/net/core/sock.c b/net/core/sock.c
> index e7405be8941f..6b443bd44581 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1586,6 +1586,13 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
>   			ret = -EOPNOTSUPP;
>   		break;
>   
> +	case SO_PASSCRED_THREAD:
> +		if (sk_is_unix(sk))
> +			sk->sk_scm_credentials_thread = valbool;
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;

AF_UNIX supports custom setsockopt since commit
de1c489b57c11fabc766aeb6777ed5b0038fa3bb

I think it would be better to move add the af unix specific ones
into net/unix/af_unix.c.

But that is IMHO more suited for a follow-up; the series LGTM,
thanks.

Paolo

