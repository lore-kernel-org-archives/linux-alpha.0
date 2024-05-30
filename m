Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F11862BE
	for <linux-alpha@vger.kernel.org>; Thu, 30 May 2024 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113110; cv=none; b=oHfJiTEyhlSRTCrCf/iCYnNjfDvKsWd8dkAAI3Gz9Nku6JrHP6cmrhrxqvJbxOj2iHLnddlbWYr/ITaTacRTsAeSsTgyXYfsWFHYzKD40vw4W1qspjrIvaMg6eKL6C1ZfGvyy6Gss5S4ZNSojMKNk54R/ak1MplyJJybkByAzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113110; c=relaxed/simple;
	bh=W93FmhGSt5rN/d9ZkTtKHNbj8y2kiVp3BB6JpqBPjtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6E3YhJb0JWmZmyW6WJAMa+hiWjfy+6ntLOft19OHhGbMEU54Awukp4HQAPdN9k7U70f42ViRNwXHc3HbPX78MRvX11stZtq+TT0eA2knCpI8Mb1hCdt0EpZjVUWyWvL7hDJG7y1fLZo771L9IldNNDwz2F2ZSxM2l35lcho4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=QL4+RqL0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="QL4+RqL0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f693306b7cso1343025b3a.1
        for <linux-alpha@vger.kernel.org>; Thu, 30 May 2024 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717113107; x=1717717907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=QL4+RqL090NmzqnmmaV35StPPgSYrm0/E5FYyEyBNDFbnjFYn4+7lynHidmbHWfEVL
         1iBcOwtdX/+OmGH9OHA6Ly9dCXC0kAmMRNt7jsngsMzCorwTnvSYwsuvbd/30RasDM2J
         CgWFzSw7fo3h/P0Vna2SEUkG3BW1pwRp2ZYJmicLk3iur+HVCLaN4mTrgCpO4EGR65xr
         zvIJIWco9NeeSE1nTauAdHI2pE5kFmj0GGL6zKrRbn7msIZJ7JKuUeM9tM4Yd+OHVqGp
         tw2mwrdzVMXg0wyfG0apx+qaFVSep6SjKcJrNGom1L34fJ84bOjAqASDJTHdFqEXjqA6
         2XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113107; x=1717717907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=d0jcptcUWGZVmk+VdenX1ii0KKKTH6mMKq5+cRV4d1tXtfPjH6L5nrqvZZjAG4FFZN
         iqBim4BCJNB4oBWmBaYMLtKhltCvI+elTKFaIgVZgaT+d14MAKMDRGbJnfY351R/Lc9n
         vLN4XUEkbvhAdJupA05FUZ/YSk7Y1c0FopQCzZwMVvSgmsf0eECqGy5fEW/ZvGS82xCw
         80Ns2TVQrzLYbhNdV/ceqVwhHa+yEM96OYdaDzvvz0DefC5+Fyu97sDlzGFGfmCoTwud
         hNLM5P8/bdV0pRrb+nJ5PHMilRAK2bRn01BsK3IcSm9CAyVKNxncmT0P3Ok9bvMXBFJF
         c+ww==
X-Forwarded-Encrypted: i=1; AJvYcCX01OFuguSTPze5/mKIqfFJ7f2XWfHq78Gb4kkuIeZF4uln0yca5xiItWOZkOHUj2bf5yyIByXyJWFLGy3/nBak9415GHi7l5MlrGA=
X-Gm-Message-State: AOJu0YyxdFZdgM8KCgTvJFhKjYjiTX0yd3Es+Cr6883K5whD949IwE1t
	hjWOcJ9sYZdWuljo0T2YFWr6hKx5YdJd/7PvXSZY3AQrdMzqpMZEVhHH40mNg2g=
X-Google-Smtp-Source: AGHT+IGLIircvxxELNZp6hQL4M8a4oqQMuIfbGbj5ESP+8hykh0tgC9NyJcGdtZhysmk5TffXmp10A==
X-Received: by 2002:a05:6a21:7807:b0:1af:f23c:804a with SMTP id adf61e73a8af0-1b26f245bedmr579669637.38.1717113107315;
        Thu, 30 May 2024 16:51:47 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::4:5439])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7b7esm298915b3a.13.2024.05.30.16.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 16:51:46 -0700 (PDT)
Message-ID: <49e4d52c-59f1-4321-9012-aabb1e8cc005@davidwei.uk>
Date: Thu, 30 May 2024 16:51:41 -0700
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 01/14] netdev: add netdev_rx_queue_restart()
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-2-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240530201616.1316526-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-30 13:16, Mina Almasry wrote:
[...]
> +err_start_queue:
> +	/* Restarting the queue with old_mem should be successful as we haven't
> +	 * changed any of the queue configuration, and there is not much we can
> +	 * do to recover from a failure here.
> +	 *
> +	 * WARN if the we fail to recover the old rx queue, and at least free
> +	 * old_mem so we don't also leak that.
> +	 */
> +	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
> +		WARN(1,
> +		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
> +		     rxq_idx);
> +		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, &old_mem);

This should be ->ndo_queue_mem_free(dev, old_mem).
