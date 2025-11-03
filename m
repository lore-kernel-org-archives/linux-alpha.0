Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598ED296BD0
	for <linux-alpha@vger.kernel.org>; Mon,  3 Nov 2025 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157193; cv=none; b=G5tFZphAjjAQlwaUnafQmbjwMqnp7Q5YqUmCWAqzWnAHxmQIGKr0YLKrpE6l7Y4x9p0adB7KlEbehjierCtmOObcZ5tUiHzlr0oFjEp5Tuc1Ohr5UHi3ecUNX0qXj+s6gdzoZeuDVpTI+tW3QQP8P76GqmEo8edbhFt+qwj/NFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157193; c=relaxed/simple;
	bh=TJPUJVukbfWR3gfsffRUjF/8PW9lialw9HyxVO/Phco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbfRUczj1kbu2q5Gx8W9DGhFWC+hgxXxonr1AXX2hBAoG2bdXmweXQvh3sd4bnxLNFdLCCL1UuoL9rvpYSW4U76ZGa7KH82qZby3rrz0zsqBxvqKrHwky5WvvsWUmo6o0fFhjQQNpTSdiGYseyRWz4NBme+mq84sZ8b/iEsWW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asBNxSJP; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asBNxSJP"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78665368a5cso12123537b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 03 Nov 2025 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762157190; x=1762761990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NJXJy4cAI4/mrSwSPYVdQe2DZkHcINj3IyYJCGJBc4=;
        b=asBNxSJPMX0bW/hp8od5u6hOX+WUcGdc+pnZQKNZ6gLVlYO1j1eY2sFNWyPWv68Ib2
         CJdmFD5cZcxVQpa5yOgjpdzl0e+zrr85rQRctyi96t3FRKyfJn5xcD4LR/bAxuZhyyki
         TlRQ0qm4y+3s7CeVlcRJ0Tniif/EHIBdITvTXZHXP5RFCfHk+oNOSz64G/oGVlFeL6Bl
         0KqECJrS5zTzjAbE9Uhu9Zy55rOr7pgTZtb+NNtO3mLBg5bfElwUy0yRxPC66+2CWtRj
         1FA3PxbtwcETtBAs1O6A5sUB+AtOsEmIxnlC3AjO2mWXxvhck8n/MUIY8j18LcbupRqu
         q6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762157190; x=1762761990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NJXJy4cAI4/mrSwSPYVdQe2DZkHcINj3IyYJCGJBc4=;
        b=eHIIyvNWp3Z2iy/XeW1m+S2HVvqOWJUk6YpQ4nf9VzQU35sfukE44AOeZ4Phyvo8Ye
         NHihAtyY0JTnP+yZqipErTIR50Y7j98VqVCMiwBlLkbw1qt+lvoZcT1r70B0hMCvEiSr
         q8iwk39hCvLxUK7Y6vz7ly9MNAO1npIlOwl5VbD1l6TZ4FL3bfK3DTDoBf9rIxLftwbu
         D67o6s4b80K/MMkXmRUWFaBHJbX3dwAmsVtVZLqmEAlSXcJ+wZEWAoaLdSclqnAgdwSz
         +MFQHT+7nV3oVCTC5HS7W0mzqNSv9ZcUOodZdBO5JJlOYkdJsEI4vLBaZNOvthK6lKH0
         UWYA==
X-Forwarded-Encrypted: i=1; AJvYcCXNem0ePFuTVJ6yj6P/Nb5tPROG1dFMXM5MVts62ld0n8xypjC0jbHKdFeK+JCIkSlZHTDu9fnnOaZfVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kzqHLjYYVOahwHEscYqhE+HtuD4hxp6j/ZK6MDJm085mvsU0
	wfzlDW+0pFPBqZLZzaYsRuWg6hixNZaSwG+M7w4gZVwCJfFva7r9I2bZuAllbdOoXRjcMm3iDJQ
	6nPg23IRRqVDS+yaLLicoGlQ3UWo2rOPIgJJyGG7zwLZllAJ6Gx0G3G/+
X-Gm-Gg: ASbGncsCi3FnnZSw1vDSmt6O1BLpKV3q/KedUsykW2gGfF8IqiZAREmw+7AcHd+dIPB
	KiVsAsCDilVNxPZ0lZ/UZvITANIPHR5edl4Ha3S//6k1Ayzpp27jktAAtKbauoCRPIx5hEw9ZH7
	g/FKPKiD532uXsMOKLlobjsV+29mhDVm+LZRsYNXaBkuXaMsPSF2S3FzBYAJi7uW7nvMUjPrGh3
	GUD/saj1IBxBBYGkyDuEvSohxMztTUpzhnD2MZwSij1BlGycqTIck6WcbA=
X-Google-Smtp-Source: AGHT+IEsP1MAEGN+2YqHUmUaqQaVV+TIUE+RtPGUJjC296VRFo5DRFM5ayW9vTRA+F1L+iNilpI+yRUdSzgulPYBC14=
X-Received: by 2002:a05:690c:6d8c:b0:786:4231:5e90 with SMTP id
 00721157ae682-7864856fc26mr99070117b3.56.1762157190044; Mon, 03 Nov 2025
 00:06:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202509291645.fcBIaXMb-lkp@intel.com> <CANn89i+Bt5Coi3YOj2JjX4KWQN4tJJpyYD3EabS274T8bQwjSw@mail.gmail.com>
In-Reply-To: <CANn89i+Bt5Coi3YOj2JjX4KWQN4tJJpyYD3EabS274T8bQwjSw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 3 Nov 2025 00:06:18 -0800
X-Gm-Features: AWmQ_bll77Tupv_60G7NMZkMDfIgtallI03szpNVDD4Eb724Mc_GXOztpPtFWkc
Message-ID: <CANn89iLrM8ZJyJHYJH8Sbuj9F9OAKZn6srtgBXwU2XmMfJ-+BQ@mail.gmail.com>
Subject: Re: include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Will Deacon <will@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 2:49=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
> > commit: c51da3f7a161c6822232be832abdffe47eb55b4c net: remove sock_i_uid=
()
> > date:   3 months ago
> > config: alpha-randconfig-r122-20250929 (https://download.01.org/0day-ci=
/archive/20250929/202509291645.fcBIaXMb-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250929/202509291645.fcBIaXMb-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509291645.fcBIaXMb-l=
kp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    net/packet/diag.c: note: in included file (through include/linux/soc=
k_diag.h):
> > >> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
> > --
> >    net/packet/af_packet.c:1099:13: sparse: sparse: context imbalance in=
 '__packet_lookup_frame_in_block' - different lock contexts for basic block
> >    net/packet/af_packet.c:2541:17: sparse: sparse: context imbalance in=
 'tpacket_rcv' - unexpected unlock
> >    net/packet/af_packet.c: note: in included file (through include/net/=
inet_sock.h, include/net/ip.h):
> > >> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
> >
> > vim +2098 include/net/sock.h
> >
> > ^1da177e4c3f415 Linus Torvalds 2005-04-16  2094
> > e84a4927a404f36 Eric Dumazet   2025-06-20  2095  static inline kuid_t s=
k_uid(const struct sock *sk)
> > e84a4927a404f36 Eric Dumazet   2025-06-20  2096  {
> > e84a4927a404f36 Eric Dumazet   2025-06-20  2097         /* Paired with =
WRITE_ONCE() in sockfs_setattr() */
> > e84a4927a404f36 Eric Dumazet   2025-06-20 @2098         return READ_ONC=
E(sk->sk_uid);
> > e84a4927a404f36 Eric Dumazet   2025-06-20  2099  }
> > e84a4927a404f36 Eric Dumazet   2025-06-20  2100
> >
> > :::::: The code at line 2098 was first introduced by commit
> > :::::: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races aro=
und sk->sk_uid
> >
> > :::::: TO: Eric Dumazet <edumazet@google.com>
> > :::::: CC: Jakub Kicinski <kuba@kernel.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> This seems an Alpha issue to me ?
>
> I can submit the following fix if there is an agreement.
>
> diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwo=
nce.h
> index 35542bcf92b3a883df353784bcb2d243475ccd91..b6801cd2ace962e11624737ed=
334a5aeb30478b7
> 100644
> --- a/arch/alpha/include/asm/rwonce.h
> +++ b/arch/alpha/include/asm/rwonce.h
> @@ -22,10 +22,10 @@
>   */
>  #define __READ_ONCE(x)                                                 \
>  ({                                                                     \
> -       __unqual_scalar_typeof(x) __x =3D                                =
 \
> -               (*(volatile typeof(__x) *)(&(x)));                      \
> +       __auto_type __x =3D                                              =
 \
> +               (*(const volatile __unqual_scalar_typeof(x) *)&(x));    \
>         mb();                                                           \
> -       (typeof(x))__x;                                                 \
> +       __x;                                                            \
>  })
>
>  #endif /* CONFIG_SMP */

Gentle ping.

Is alpha arch still alive ?
