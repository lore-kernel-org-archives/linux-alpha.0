Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16932EAD1B
	for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776004678; cv=pass; b=bTJIT5QNO282vmu9sDQkBZXbNr8udX+wdbnfCB+em6G/h0n8mI1+bWL3DUGOhUjgiVV545AkJrSL3JfLhjhoT6txV6DWL/27CVxiO8U7fXoKZTkXxzbRZb85Rc2h5ii6sz8TbmxacGpGRk2mVoMvByk5dye4zD7zyQoUyzXxh0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776004678; c=relaxed/simple;
	bh=MemBCQgBcit+9wsPWOddOdHHlWCrezd4gb5EHNw6nHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Ha4ne2CJN4SE+1Wt0ZuBgq7T0jPitUkDfUKUAf6fb6WCBYnqPqLpXpX7zuj0lzdlCutdKdJrq0xqesitjXEA88zf5911hKbLQQjpUxxpgEeeMYxkg9/BtpEuu85l2KkvMwUJZpIFvwF5EGVaPji8lI0Polf7jtLjWNLbeYZutwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0Hme09j; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0Hme09j"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so485477466b.1
        for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 07:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776004675; cv=none;
        d=google.com; s=arc-20240605;
        b=CPuDE6Md01dEPWPdbnLaAK4vqHzBkpkUXJ0NFBnt+NRTC1Zb046TaqySseiZlKA6jJ
         DAfC9N7CPzlkLNtng53zlEK6Gq1PTHmhSs/nRUR9igEKRIemZYOrnZf0Pl2nePs2tmtT
         zWQDAOkrrMevMxwOJ8V2RvjMVJSIhcL9QQDCpjO2/PpyEPnzyUEN4+7Nt51BTgr0pk1T
         7Qf/C855IxldCMeXqCfZnw6HxpfD0+/Ab1zTZ6E5dHUcFy3tvt+0jAehc03+k2rjUwI+
         J4Qb21x18pCSkz+ZhcxlIEISo2GuLmh8HKEgiq84pzozF8KyrTQ54psCV2NOQJJLPFZJ
         aEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MemBCQgBcit+9wsPWOddOdHHlWCrezd4gb5EHNw6nHw=;
        fh=8W+lXoG6z5CSYawdfWWbB6bdOlOxU6zL7OhjJvD/m6E=;
        b=hjdeGIfFH1IBgDPF40cQfrxCoFUaBKsoEf5Uo6cRtVqFkOqz7r50uoTU9VwmO3DP3y
         A069+uIRStjw7IuhIpYwNe3mP74h361uVqq2ElfG5x0AdfmSDb0Ao1+enRrQ7xCsIdnV
         +N81pfrdvmQg8hKEwJALyIJp4jLqi6YoOwheYOukUn735JcrXOWSsyocp9m2/rMyFMHW
         79KOhRn795RWVTOgHd9/Z7IXzqSkW4zVQm2wJFZB/gz9pIa+7L5CHbEXuhJHJQMlTY0B
         4OS5ojsKvKGd87P2ms7ROYvD5EY3lQGkauAqX8zRxnGDyYgSuMqYrqur28XGgoh7DEII
         D4fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776004675; x=1776609475; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MemBCQgBcit+9wsPWOddOdHHlWCrezd4gb5EHNw6nHw=;
        b=C0Hme09jEDHqC08QwyudzVdmoYZOq+KTEnqAsxIBPVpGZS+elrgZKJYroJHHEXVsqp
         h+GiflBbUZpltjtEIie+upbBzFlZZFLABrLGmJkUu7B1h58Ml2d2EFM8upERVQI9VHxZ
         T3rZl5LhzmcfTRLzmzg/EdPK6J3o/PFWa5RCALfQFFAI48H9zAYN+uMVPUX6jX0zLsiH
         RpKKrvmLjn9Zjf2kxqTOM0pHDmaTqaD/a+fErlv+xaxpOUHQS07w0DNZ8bUNUBiAQ6xA
         yFgHIbz/+d2aUk7pRSccstHy9L8YJIX+wcXJt4vTprp3x54EfJEIx6keYtDLDESSUZVl
         GkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776004675; x=1776609475;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MemBCQgBcit+9wsPWOddOdHHlWCrezd4gb5EHNw6nHw=;
        b=o/sJeI376kK+FDe3GXQZ09rbAjj4pJkC4H+hqAcL8oD5+6vgDgclSwLewQG/40iXB9
         XFVAb2fJILaZqbYNoZ1QCtoh1qPPDbe8vwAjlUtU9f1UAO7QoCSJvZ9UX5/3tSyCqKHR
         NRZ4AvpHdREOBO8LqgcLyJ6vVTRvjs4Vqegtdzq4E3MTac0ACKBJI5uvfShthptOedbX
         UmT8gSKEwaI/l37LPgBArN6zCdzR+S4cy0yVV/MFs0Da3tTbdoTCzOc5eqKq3Lrzmanr
         S4/b4kUgHr0wYKm2bk8Nr1SL3gxOiaoxmpLDyxsVLx2bHUSRBlXFG0jIWWxa5z+bAp/d
         GEeA==
X-Forwarded-Encrypted: i=1; AFNElJ+4+v4aC3gMVCMw3iqB7A1PQUsWxNVNP03pcoKieA4ei1u2CLFQDBKQJ/txgKnijM5vOd2t4Pv4ky6NNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGW0Ys/L+3ADFk5gwl5VVlZTSb+puCjEXVXkMuMi5MB21Q9mM
	OtE/8zLlWoaVTdB6QQX6pLG2T+Kf4oeEB4fLFg++Gb1AH/hEyhCpUlQ8zAfteTadGRsOi8m1lwc
	V3bqEmp/BcnGcHh7/74R1LbWRc8trVXw=
X-Gm-Gg: AeBDietBf9EdpyR/nCM2VpgY5YiXz9pHe+Jx0myI8Gda8Aqkf60Qi6aDdHRQabxQJjy
	PtNd6tlwZ2D5IilmG3DenRYfWFlXSLljx+YZs+xRJuGL5YlTxnQnhRIxowIT/E82XiPu3zHJAkD
	SOXgNWR74gBaomNnTeZcGsPIjijd9FHj4VCAcqzwatqJ//NpyJUUpffn1q4b21/stkgpwoVOwyg
	AilRFyp+86k0h4sOWRkRz1CE9/Ode70GlZcj9pDWOcNk68m3P0lpFHXdszKHZCqi+gXQG8hkyGF
	5Q8ssz8qWFbNaA2HLKLu1QpRqqtCS5fbmoYrXgj4
X-Received: by 2002:a17:906:6a03:b0:b98:48b1:b129 with SMTP id
 a640c23a62f3a-b9d727969e8mr589234766b.47.1776004674999; Sun, 12 Apr 2026
 07:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150048.488266-1-mattst88@gmail.com> <adBrDoaNR8O8_hbG@creeky>
In-Reply-To: <adBrDoaNR8O8_hbG@creeky>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 16:37:43 +0200
X-Gm-Features: AQROBzAi32G5fIWKlgb2hFtbMGmKNfGCf-mmZLcR0rTAL4hN_O30rt34Q9BW5Ws
Message-ID: <CA+=Fv5RrsEqQ=nZbnKuUUvAWE9hJyhJMi-hHSL=WEWX--_Vt8w@mail.gmail.com>
Subject: Re: [PATCH] alpha: Add ARCH_HAS_PTE_SPECIAL support
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 3:36=E2=80=AFAM Michael Cree <mcree@orcon.net.nz> wr=
ote:
>
> Hi Matt,
>
> On Fri, Apr 03, 2026 at 11:00:48AM -0400, Matt Turner wrote:
> > Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
> > PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
> > that are not backed by struct page (VDSO mappings, zero page,
> > io_remap_pfn_range, etc.).
> >
> > Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
> > pte_modify() calls.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Matt Turner <mattst88@gmail.com>

Hi Matt,

These don=E2=80=99t apply cleanly to the current alpha tree here (v7.0-rc1-=
based).
As Michael also noted, the Kconfig context doesn=E2=80=99t match upstream, =
and
the index lines suggest the patches weren=E2=80=99t all generated from the =
same
snapshot, so the intended base/order isn=E2=80=99t entirely clear.

For a quick check, from the different patches that you submitted, I folded
in the following locally on top of current arch/alpha/Kconfig:

- ARCH_SUPPORTS_ATOMIC_RMW
- HAVE_ARCH_COMPILER_H
- ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
- ARCH_WANT_FRAME_POINTERS
- ARCH_WANT_IRQS_OFF_ACTIVATE_MM
- ARCH_HAS_PTE_SPECIAL

Built and booted fine on a UP2000+ (SMP), so the overall direction
looks good from basic testing.

Might be worth respinning from a consistent base, perhaps as a
series if that matches your intent?

Thanks,
Magnus
