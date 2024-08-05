Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCA15B97E
	for <linux-alpha@vger.kernel.org>; Mon,  5 Aug 2024 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875652; cv=none; b=c5RqQ7PRI/gXPibOebiycZe2Q6/TbEq6A3n2ImxhdW32w3LHSbmEIjVvwUftyP/NiQ9aTOiqKrSvMh3IT0OFxAc4s9boqmb6pAv+lruKgHxC6qsZI8MeglLe5Ps292aWvYnCDcSDxqTBsQoyXfOEywb/nFXBddkDg/88p4obZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875652; c=relaxed/simple;
	bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2ZkKvX3YGqusEVnEicc2qEERmCKGk34T2TOG6jgdOaUUy4Q9jAwz5mBAxU7gPcju0YcFjWEWXgYw52JR68ULh5J4jy/nct6VttZ7+KyCLbF6IaKfCfkgKmdZ8Dko/HbCaBaJk6RD6SoLF6xkJjN/qYCnqXu1/QEUX+ibo+aQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooMfse3W; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooMfse3W"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44fe58fcf2bso62017591cf.2
        for <linux-alpha@vger.kernel.org>; Mon, 05 Aug 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722875649; x=1723480449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=ooMfse3WVKfuxOLSSKdlcT9aqFqVw/RtyRXpOBsgOCTn9wKceQcM71mSUyFUCGbjdh
         26+ROdikowegVtjSUS4uWVUhtc95hLL23dlnWFj8cp65MVc4drKNIX9u43DWF2Bats8h
         t0heAI4eFDoxqmiGWoYtMgQD56gP+7qgIFOqzvLbDpke6iJR6YapJ+kA8HjUL+DyHiKy
         +7NkKP96kiTMdLcfY8EpRMfItKrh6siytmWkC/b0tGgiJkDeyeXjOqlFRgZJ9luyNyNG
         6FpewpnZhlzpQ9biBgMEY7x44yXFsfP3XIyl2lb1fAFA0jwMYwVdtCGFuyqF5RwPlBAL
         hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722875649; x=1723480449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=DoZQUZ2uKzh879aqH3gIR49KNYAwlVJj7V8TtA0nZRSrQrotIEBvU/lsx+wtspoFaj
         lCGyHOxtoSPyQR+I552EBgOE297NuOGY6xkl0TNZ6QLFJtlI/wteds+pntSCqnfIWVZl
         Sg9mmNToMugrIyX+zYemI5lcwzN3jB/ysVqAtiVQGsermOYJth/4UmyUzht5OyJwc31T
         FxjTkiuRiByJDMIK8foZU22XohckEdszMx07YlI0IrzntUq9MwyrN70+v+MFgy7riTNL
         X5bVS662JWx6b/uqRDcJe2lJzYSsLSxf/3M/EXKFXfkMIoldo/vBR13pK7J8i9vXmNcD
         Wc3w==
X-Forwarded-Encrypted: i=1; AJvYcCUdgnoSlO7rmt5WyZxwHxdYT1sqXPI1lX66Z9wdcGmwMjkAcbR8Fr61UEAaMeLcNlKe7FrYoccNd+W96Kk7Bjc/5kNNmpMsRN+6mSs=
X-Gm-Message-State: AOJu0YyngvHEXdCtQmjP0xYhhHGz0ndm+jkcQtG96c/XvFnoX9LipmTj
	w1w/k9EVs9jrWro0X8rkl1y9lk5QZIdm50oc/6DGsLKXc/LbXkOk8Zin/w71K/7h6qq5XNYFfD+
	xsMUAIs07QXlpRbD2EIaoh/6EEwmgf9SmVnB4
X-Google-Smtp-Source: AGHT+IE3X2dzKDTfvW579W1ONWZvzHmSuPdaFYmL6fjjzD5I45yXHVQPoF1XfHnvXWK/VzgEqMK+gXEJqks0i1Xyhdk=
X-Received: by 2002:a05:6214:4412:b0:6b5:7e97:7151 with SMTP id
 6a1803df08f44-6bb98345fa9mr131458736d6.17.1722875648824; Mon, 05 Aug 2024
 09:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730022623.98909-4-almasrymina@google.com> <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
In-Reply-To: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Aug 2024 12:33:55 -0400
Message-ID: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to netdevice
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
	Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Jakub Kicinski <kuba@kernel.org>, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jeroen de Borst <jeroendb@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Shailend Chand <shailend@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 4:38=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/include/net/devmem.h
> > @@ -0,0 +1,115 @@
> =E2=80=A6
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> =E2=80=A6
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+=
define+a+reserved+identifier
>

I was gonna apply this change, but I ack'd existing files and I find
that all of them include leading underscores, including some very
recently added files like net/core/page_pool_priv.h.

I would prefer to stick to existing conventions if that's OK, unless
there is widespread agreement to the contrary.

--=20
Thanks,
Mina
