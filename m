Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F9F44A3F9
	for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792311492; cv=pass; b=uToHIRnEhlEG5dMBX61Ba7uOlhRcsQ/Tqm2FuJRXCz/saIijx2qt0fkFo/rSz8pYAJHvGQylg+6ZatutXJpVrzyq+zimSYrhu7JyXXOOSgwc5fum0UYdosOpYyCm91+1rtavhq8GyifykUH+8CtPsWm1vAF9QugujVRW1XBXZHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792311492; c=relaxed/simple;
	bh=m9LovGZRm71Kz/26siQRqDNvtYfWBfw9Tv7L/BOcLq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvjpMrrZcHetcGzuC5N57ZVyBCUJMB4RaDxZ3r6zuMpWkc3BN2M/jRDBfcj/M4n/SXwCFOCZqjHXki87qi+IumOcgUQJes+Ra6fQPpPgfohixpcIpwwRfeMQRreTlde2jNgFjyQGM3NMRCve9DT4TAS8gGWQKYMFk3nwmfTM8eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbB1coky; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbB1coky"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-87ab6e5f91eso7028037b3.2
        for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 01:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792311489; cv=none;
        d=google.com; s=arc-20260327;
        b=mrGzOABSze/t8HJ+RA25PiKn94mJXte72ZNdjHtRsnuAvtwAlRkCCUzkjuecuFpAsp
         hfVJHnL8mYNbARbf/4SNKFv+diO3QOU2eYMd4k7wtUuvi+0A50PPg6gNXHqW1FCW0IYA
         m1hhIDN+axawYjmX8ck82JYjAj2I8XgOFgW9vmZllqVhT4+61g90QzVSDLhao515fQ7j
         jM66YRjPr4+y0j7YnB/1fymdbwVchkaKvhVboH2EWt2ETHf4MBt1KkMjF03ratIcqMgF
         ZlgDUCgc+CaFWPKnL/qMFyyIlutaiZcOzG3q/Ltrb0GBtOdHZd05DeLyckEUtCmQHt3u
         b9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        fh=vyaAkEkcFqSuJch6NxRqebqaV2XCwNPuFpMsdk8ZEXY=;
        b=VjreuMdsfjyueKtwyO34mS/Hlff3M8j5oVImVSDX5EJAg1sJyz0GzUzQpUv0WshG7u
         3tLSSaW+Pxx+xbzJn1QbXfbEFFru/gVpVb1bFZBPpUi/VK+1fMV7Fu7NuKToVjor0YFd
         lmwDqrxKY7IwIKAtSo+TqWytZMDjGcWS5CKfIMZitxaP00/txSbgbt6qsftZlyDzf0Hx
         buHL8CyfTe17BrkBwVrpcPIFymD6WCgVgyA9IOBmLtTWJhLj8V6GlQ1Ps9ALzleQZiXG
         KBByydPe/ayQRFKdJeuT3Njm+H2qofwRcafxwsfTvoGyLHdBwvLSPlo9GHJIcqzJeaUJ
         ZLWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792311489; x=1792916289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=BbB1cokyERZfK0hTfxQTtmwmvtFW/q2hmlF+irPUC/MDzL2O0/Pxenl+uXX7ayPMsA
         oaqNS4//XDbeIKgq7EspM7Z+rZb2/O4hklyewBfMvczfAsMmNUDKiIWKgPPK1bPM8ej3
         cBccKYLiMgbI4sEQ1r8LJL9amuuzd9RLa7YiZpyi7sZ6q9hAf/1VyMCSuMzeVThNBtj6
         o9os4L3gEcv1FtYdqfqARbnb1Uc1d1C2MCkE/VdCDEfe9Fe/qDYRjMz71OScZt75ayF4
         Edsop6C0EVZ3cXRB/6B3repVPVdKU6zgXKiT+dqYVaQv+ddpeUSqoumW8mO2C3HoaTrB
         HTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792311489; x=1792916289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=Fm4OybRqEEZpBNIDgMcCYec2NnHX3eUrVw4Z9YgoAdRXd2k4igXuRqeIHOHJEaGHnT
         tJycbo7Cd4iCK/JZ/NCKKEpgGr5XbvkPhgOFIW7gV2xC6GgF2LRbngI6iwT50b1elMj4
         15LZ33Ki5qkAhuFpH30GQzo6g37FVnQS+MkzYh/Vmi1IsOAgGskE2fTEcKCqMeZo2Z5s
         Ux2YvxbTsOG2MYEByme5ImgqaOlse97sO2mTsTZZnb1bGHqRD17B7yrkzCLKrtxnrIW6
         S27aVnsEU049sHgttHA9m0Zgl9HSE4yWInzMFSPuAYD8VPrs+CO4zRyjQpBOw2JVXQYc
         nRFA==
X-Forwarded-Encrypted: i=1; AKwUvBwAlS8hMeYdywGIXwGtbiXh9VDYEAP4yG5TrnykbX4gtccgz5q/Cq+I2h88NU3hyZtXBPr+tHMzUhE1Ww==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxT+GdKiiu0t6xmrIwCxZ5yJK7WnOrc435NGyzhq9B0sfvLEYc
	FWcO1j0rVlXlFGS/2/U6BZOLFFZREGcr7B8f+t49gsPVbJot8TMbzKCkaY0tAJmiEuMVQqVbf2j
	2bg5XexPT/OmaKHqBvD3XfMYoQ897sxU=
X-Gm-Gg: AYBFou2QLEI9UXQQRwxpf9fnfTybhGlAXumw8CoLHTNE4xlbz6zCV9DjkUqFIWnMWEb
	wczLOrpCtXWjPei0aNyo9O3d+e3A7O639zJ8gzKP4UqI1iRA+ZkOTUDoy9q9aJaFfZEZ3T747w6
	s8Lzj0gwwJekTLny2deCW4Ipq7SZB+qxsRsH1m3ccTprFVB71QznE97uVbjTeT2qlGR7OA8n7QJ
	EDYvJ77Mo4AHLNi8Has0zmo2hN3oCLKjhIkuwnK6ZEs9sOUkyOAvdnwIqwYaM19+2+zJanZwleS
	0LAtoa4mbqMoHdB4l6yCXIIr2jrjrXfFz5de5wZbh4v8ACMGMrItHYUyKvCkOJUKecIzgGcHxCR
	TtuhLABaddeKNTWztzF7pi8GLTiPzSCV6YwHmB1XqyJRoG1B+9YQ4
X-Received: by 2002:a05:690c:f13:b0:8b0:89bc:92b4 with SMTP id
 00721157ae682-8b0f21bbb4bmr16206517b3.51.1792311488622; Sun, 18 Oct 2026
 01:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com> <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 10:17:54 +0200
X-Gm-Features: AclHuK_OPAh6roFXb_L2yR4ZCbLp7NUjn97i4r3orTmSL6OpqXmOnn6fpLIEIiY
Message-ID: <CA+=Fv5Rmwd6pjs_MBo01Zvqo3CwufefqZvPCJeEvK60Ona0tJg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] alpha: fill in pc for software event samples
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 3:56=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Context switch and tracepoint events have no trap frame, so perf builds
> one with perf_fetch_caller_regs(). Alpha does not define
> perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
> these samples report pc as 0.
>
> Record the caller's address as pc. The zero ps already marks the frame
> as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
> can be filled in.
>
> Reported-by: Magnus Lindholm <linmag7@gmail.com>
> Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepm=
Rc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/perf_event.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 5996e7a6757e..72536566014a 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,4 +1,11 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +/*
> + * Software events have no trap frame, so perf_fetch_caller_regs() fills
> + * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> + * missing.
> + */
> +#define perf_arch_fetch_caller_regs(regs, __ip)        ((regs)->pc =3D (=
__ip))
> +
>  #endif /* __ASM_ALPHA_PERF_EVENT_H */
>
> --
> 2.55.0
>

Thanks, this looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
