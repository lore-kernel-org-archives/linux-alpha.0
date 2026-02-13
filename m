Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376FB2749DF
	for <linux-alpha@vger.kernel.org>; Fri, 13 Feb 2026 18:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008320; cv=none; b=Nrs6PzzC5SECiagqfezTO56jEcMrBDMhQR9UIJ0jvMd+kdo/1yZWCrC+aoUIsZaQgOjb8UsXWZHFJ7/0YrzorRAiCbt7nVkXThR7ztXcbGTrFKXH8mOfODy1laD5NP95RTNCALsoUXkYad7AehgqHQsS/fVMmcER+hGm4JtR3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008320; c=relaxed/simple;
	bh=TxJobIIusEsdbPQBStkKnelBzepRxl81wrx7GU7aYS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlgV2Yla/y2kDFIJjWHLf4u7Wdt5pqpQsaVufwqGjgq2jw76qZlYqWXC/1JfKmbAytcRMWDenFE5oSAcJ5p/PRjz4QTtN9tuN3mdcijOyKF7lQbaWp6AZK/H0SdL04dR9+17EHnipD1tevWIVIVv+yndUrgVC38YFaqhJyHKD0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OsVjg9qG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OsVjg9qG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8fb3c4bbc4so137970266b.2
        for <linux-alpha@vger.kernel.org>; Fri, 13 Feb 2026 10:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771008317; x=1771613117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9pCd1BTzMzEsL/CQJfCm/84/ehR05tagy+0pKkReXk=;
        b=OsVjg9qGnmLXGIy3vIii2pmr1oWVpUTw53ppuFKBuoTnIVV2UaU0keB5r5Jvled4Zm
         HKujDWqpRG+bClzDwVpmiqGCJPg+9892xAwgdPpwLuxNX4ukIfmueknyK3W1AYyM9k6U
         snC9KptnWld6bNhcqEvasLCZIGWMAcqkwX7jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771008317; x=1771613117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n9pCd1BTzMzEsL/CQJfCm/84/ehR05tagy+0pKkReXk=;
        b=l134HJL4iOOs3CcYqREPZSwqUXE+629hVE03CmKujkr0PPN4kkAe8dtBrznTzV+Njg
         jGTbrCllZ/YWn9Vro4+9cq43WxapaQTbYdHObxLDE4dGiKRJN+3EZ72LA0WvbprAI6Ru
         9PjmMlmZNpu3GAHmfr8zvRPOlHSgGySR+uJXKMB0RZjC/j8mDfmNBk953MMv+IotVF2T
         yo+gg+ZMd5pp+2N6hKg/wjehIZ6j9pG3K4d4AIEBCxjV92pdn+D5idRw0TCAwykl6cLu
         EUl0zSxjAzqDQFFbWuRSD5Fyd2LSSDjaL3W3c4U7DSd0RUMZuXEjNSAeVb5CTWca7Lku
         OFyw==
X-Forwarded-Encrypted: i=1; AJvYcCWlbUiKjYH85db6Gjh/4OImOr/6Y69ijaQq3VwNM0ttPqfohW/k+ru3X6w1M+b01UG6Of9NtJ87B3Cv0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNfEKmBkQ1s2wTSswRMbzillfyrMb3jkOTPtNZXuJmETCvJ9N
	dZDfOpa/ooEiWiwLCK9Vhhz/vZocrmrMi4rqjVq85bDkwHveP6HVmG6j0DB2Is49e0aaVCRR3ix
	6MZVaiEc=
X-Gm-Gg: AZuq6aKLYETCjTgWzFpcw1WJEBEGCT34AuPbu0bocQROAXKnP0CFUjWIp7ifJ3Liuq9
	zSDuOEgSdNF+uO0oFSWr78h5NZuH6o7+h2SgWbXf0eUl3xv/6IQPCTsKd+VNKtZqRPefakphT6j
	GZW3fY9fADyVfYl+A/p/Qw7YOOnlghmeoadkrrptkmXi63wvhckMzAzLnWbVhMpqqst9jh9bvpQ
	v/jSq8NTUxD/jfWcePCRvXxOkHKtqnIFYWpkm4wbYNvwXSOoypjyn6Fv4pNXO1ThRAR14qXsQbM
	3/JlHVS/t7GP3Xw6Zdhjlf0m8+WqLqyyAfAUsiVndh0FQzFFA8bAzkGd7H3SPzVeAwX9XoDk/Ll
	KTii9VlGZK3cDc834eeqblpzUO7dHa0pqh+1xS6fNx3yRKpCQ45JDtlxsUOb62cnKlTuPTVfDsX
	FkskYMnkZ6NR4jMFCu94GkUDBR0sHTLjMZzCI0LD4iaq+2FQOth9C6auQJi+o5TtwFQGsna61U
X-Received: by 2002:a17:907:7ba0:b0:b87:205c:1aa7 with SMTP id a640c23a62f3a-b8fc3ca93d4mr18019166b.44.1771008317373;
        Fri, 13 Feb 2026 10:45:17 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e95004dsm284512766b.5.2026.02.13.10.45.16
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 10:45:16 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so186173366b.1
        for <linux-alpha@vger.kernel.org>; Fri, 13 Feb 2026 10:45:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVT/minZU3G3RUe2SnrOpIbrMwu4Na1pm6fR64ds4rFLdp2t2iQ7hyO0Dsx5THi5waJKj79238rRDFtfg==@vger.kernel.org
X-Received: by 2002:a17:906:478c:b0:b8d:f6f1:e27a with SMTP id
 a640c23a62f3a-b8fc3d32247mr19003066b.65.1771008316561; Fri, 13 Feb 2026
 10:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-alpha-page_table_check_pte_clear-v1-1-e037e3e1e50f@linutronix.de>
In-Reply-To: <20260213-alpha-page_table_check_pte_clear-v1-1-e037e3e1e50f@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Feb 2026 10:45:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wif1M88S-F0YcPeuqhjZdyT-9SCax0JC1mtC+_Yofud-A@mail.gmail.com>
X-Gm-Features: AZwV_QhneJhioNz6a7n5kYu9Ml1wg8drZ3tiCasRIVIU629roBpiRP4gqobfKUQ
Message-ID: <CAHk-=wif1M88S-F0YcPeuqhjZdyT-9SCax0JC1mtC+_Yofud-A@mail.gmail.com>
Subject: Re: [PATCH] alpha: add missing address argument in call to page_table_check_pte_clear()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Feb 2026 at 23:35, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> This should go directly through Linus, in my opinion.

Thanks, applied.

              Linus
