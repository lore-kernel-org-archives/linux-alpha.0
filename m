Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF8157E91
	for <linux-alpha@vger.kernel.org>; Wed, 10 Jul 2024 23:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654939; cv=none; b=h21K77vhCuUYGwxDa8yH703nF2aZa0KoCsmAH9/oyGMsJ8lmzeoNWuaYuL7jbILw/agoiPiM7WPHVZ8YsidfRVE95nj7ZX2o7Wb7iQxv377oXnVhg1EJXp/EzzglioluEbyA1Wt4ftPVekYAPzSxWO1t/y6QGiIuUFpgz+17Eu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654939; c=relaxed/simple;
	bh=WmCXshM9BwamSUxd01N4bO9J01nXQuiD7Ah98aEMfxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PC1SqTulYesxzwUZbEvZ16mfqQmnFDluSWFB6goJZ5KDKNhU6v3gXkIrv0F7s1kDn0v++LTXWiWP5tVvdj+JjP/Y1HDJIzHq1GSr0+AUGRZZYTbaRdjBqkQ1pSquIDf9nTuXE94ufDWCYuN/toczn8p+fAwNUWN96s1twjUM1F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWrM/6qT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWrM/6qT"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b5f46191b5so1829336d6.3
        for <linux-alpha@vger.kernel.org>; Wed, 10 Jul 2024 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654936; x=1721259736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
        b=dWrM/6qT8jNEjecjc9s08cKSX4h+fb6bTc35XK4KJuziyKO+fD/7CbRZJ4UwApGsfl
         1W71iFYoXZAhm3NUXU7xD7Et5TuKbhgYB9RICTMsmQqsulI9HWNXvdCZHwLpiCf52//6
         G0IPDLquKspE/p1oSvCYSjr7fUwxb4l6eRxqgiHh75JUIw5D2hPSiYm8K+UJe5eH7SRd
         /dF+ZtLkEny2rN/U/siaCZX8u0XTToiPx05I65KGy53ugYyndbw8ILn+iDK4dSayMnmE
         xi0fKa2ZiL0jp2pJtdOoi+Vg+Muzkoc1dZnbx7V4UDdtpTsUIEoFy1CaPVb9D9iyk86J
         c36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654936; x=1721259736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
        b=NHhchvjCdvtTvFdV3n3JpedJNMWPZi9tSulC1ADrgQmcMRh9kyuE3L62BqTj2SC5hi
         J5pCbUjleQiRs6Ln5sPBlHVQNXNo9DNNluHsUoQisQ87fkjQxJoLCcDLvaC0NcXwNGPP
         Vyd2kk2YdHPed6GKrEsAqJNEvZ9k03kP9KWIqxUSrBRfw7xD2HQqI6LZxFGQf81lprmR
         /uez5YsXyaLvA4Y9ERKl7Ny+czJQ8vNpSy26nzq1VXHw3b5T4RgYlNyhojEocFk4KCn7
         ud9q2wcOHRNH72F52y6QSPSQIYS7HGwRHg/bGr+FKK9M0ay4ztaPTTS78Uv1lzhgvKVt
         cL7A==
X-Forwarded-Encrypted: i=1; AJvYcCV3WY/C2dVUqlQgSRZMdDWK/up35Aofs1UfpKl6cTZRM/Rr02iqmtlQlLtnoZyvzSvsxweiLxG8DCQzsKTN6MrDKnsoC8XvCJ6xol4=
X-Gm-Message-State: AOJu0YyKmAB3vWbq19hk4L4TDp64vwoxBb2eF+KAi51DhGXiG6bdV9Lm
	SUORqqrCxMsrao3Vms4pWWrSzQxRZhOYVeNMWTLlo2mR6r/fHx8IPgmNiwTS398FDD8AzQTxp2r
	NDmkjdBPzVqAMDU18qdrR9gUq0oTdiZB3Ws+T
X-Google-Smtp-Source: AGHT+IGOLOQ6K3/3da49V2eHyCz+KQjRCyIEiAYnB4b8F1iCu2D4bkJxhlzGFfxvSjmRGC6gzv7EI1OWCLflWXtCr4A=
X-Received: by 2002:a05:6214:20e2:b0:6b5:9c9c:7baf with SMTP id
 6a1803df08f44-6b61bca896amr97392016d6.23.1720654936406; Wed, 10 Jul 2024
 16:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com> <20240710094900.0f808684@kernel.org>
In-Reply-To: <20240710094900.0f808684@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 10 Jul 2024 16:42:04 -0700
Message-ID: <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 00:17:38 +0000 Mina Almasry wrote:
> > +static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
> > +{
> > +     return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
> > +}
> > +
> > +static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp_magic;
> > +}
> > +
> > +static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long=
 pp_magic)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic |=3D pp_magic;
> > +}
> > +
> > +static inline void netmem_clear_pp_magic(netmem_ref netmem)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic =3D 0;
> > +}
> > +
> > +static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp;
> > +}
> > +
> > +static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *=
pool)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > +}
>
> Why is all this stuff in the main header? It's really low level.
> Please put helpers which are only used by the core in a header
> under net/core/, like net/core/dev.h

Sorry none of those are only used by net/core/*. Pretty much all of
these are used by include/net/page_pool/helpers.h, and some have
callers in net/core/devmem.c or net/core/skbuff.c

Would you like me to move these pp specific looking ones to
include/net/page_pool/netmem.h or something similar?

--=20
Thanks,
Mina
