Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205CD36402A
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408668; cv=pass; b=aj+jQtDMVyRPGx0Sy/NOJrt2szd41R0e6MnCMXbsZRnec8pdEsms5RrqK0dbTbC7JZIRr+4gChrnJm84xhaphEl+1BUWpvCsbOsXr6jMyQTxEzd7giUJRa03Z7IxYS+QLSX5oRFwoLRhvIRvbXfZRUAOAB5Lh+OXGrmbMHlVCkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408668; c=relaxed/simple;
	bh=jyYp3pb0AgusDhktJ+pxszPoIX1VX2C1hCG1RwKoqyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Utj3peJ50FkpTzdzbvF23KgWUsKv/f9cCpgPVbMAxKNe9L+Hei4hcuUnCaJbU0fppu1cTeYECJzoQ8tN0uqPMmSH4Eju9cJItYvpwOxHcy31dV07v3LfhW45i2nX/HUpcTBee3RhItd/kOQrorzV5jX03aEwe6qvSTGIj/K8Vz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdavwPz+; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdavwPz+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e6df2742cso328618866b.2
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 14:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791408664; cv=none;
        d=google.com; s=arc-20260327;
        b=cocW3GU5M2DO1jTSo5QvXasBTu4Av3oh4M0cUeJ2uL05JB3Irkak0vT/f4gmASuEVj
         b2FErOezygjAE+TKLtfj+gYKCv2SpY5/h+L5iHe1Ov7CWTH4aOFsRmxTO0oqxq/K6tn+
         3sO/P1mGyglKAgWZLlmDjg4+b2obwvUkMqAh0+6KOykY9kIHBnMS06bGOm5wnuOSQI6q
         LY3zsFLpoHub7tfiOS9RDno3a9OEA6nx595LEuK6zRmwH7edc6bIMp/84fnFNjh3+HKH
         Rf5BuBMWWSVlIncyLZTROLP0/H+zDQDb9s0a/HiMY+DY3LWdpr5BqoGl+cCoC03i1WKx
         iPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        fh=m0+pJnZDRfLTib61oTQtOypjXlxwCF3Cg/S9Bokgm3w=;
        b=St7jfLCNMf0zi43RCy6JBWX49nv5Ky32cSmwIBoFweRsiOnJ9M6lpLt5hjgl5xIyKK
         3uNrxvdClCKvUcd1evrjRplA29aUFOl6d7+89ertl4n7/JBafdPQZX4vzL0EDnNuUM4G
         12cZJbAoFZfPgAMYZY0NmXZk+5VJY/Gzkgys2kJcu/lSj3WaeIvi/RS1Dg/IDw2b5JSv
         /fpaIDKY2vOtgWvUmv/LqcJr5O+IzxWR/9gYNg/0ICTxQFdlSRYb5eMnR+fUZMHEf5nN
         n11sKgC0kRZGvvuWgUP6C+qpUHzC2IASuTLEnkre/MqucO5GNsvQvsLeqkeYdRQ961FD
         qcoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408664; x=1792013464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        b=DdavwPz+K2dI57XQHDTKfcEw0jbzVlyL1jcQNXVwNxHVnx/xTqgnUOUy5U8QP/96ch
         70TCCAaR4l7gAUYCmXo42dqJEBgkY7n21wRT6zg9Wu3d8Zj4/xBTPnPiJRH7ANCBRblZ
         apFQi45loGWPwGUi9LVMBcMzWA2YQGcIhUmjdd5nUj1NHfOcz7mMR7DQveO9NGOU6pu2
         vLWyMG7MUPv4LTc1OO/Csjfzp9HhsLNXw134KRe5I0Nu3ipaCwwRzdarI8/x1tsBW4n/
         ZiqWsiWb6AhkuyGMKFCL2PLHjJl2gw4gMvdk6BBy0Qw8JdG6NGOQNycsJr8R1uh2vs1m
         DWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408664; x=1792013464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        b=mlMzLCevnRjYGYwwG0LGrPvdp9PtBPy0aPaaGRftNOPIe1gVLg4rDi0lCIM5MMQ3ra
         qi4uWPuvdnccBsoGQInIfJROxD/fqSQmybMRTOjm9iumo1CruVM3qb2sGkLDdzdqJaDu
         Imfatb3mU+7Y71O6DnKCxCc7+Y4UnNxU7CUV+dqWJHyuHs4FPfirN/txBFj2I1DAZZA3
         R/scnGKlFmIsqXtpV7SVDuAUNZlgqJWLkc5qNgD+4Bw2DaX8SdNW1iRVcS5Js7armmV5
         he2rR6JZK9jQ2/NRLfZcQR1Gezgo5dDfC4sNbBZbBn8TYNZ+5ALtcX/tXoOBo+WxLipL
         wEnA==
X-Forwarded-Encrypted: i=1; AKwUvBzc5cEiHB7AmjKgmZYkxKEIh73achvn3QZWXDPW8tw8e0QerPcNI4P/3w8gx9NyyUMJFelN68a9gPlTUA==@vger.kernel.org
X-Gm-Message-State: AFuF++m0qi8hY3o8FSIOt5L+1LKaMSmE6SuLhgY+miD1FB4HunRcR3if
	XMXrE+McugOvGKoJsvaD98L4iCObadJc0aLHhqHa1gVwBcYUfBQT8XUccVLDLB/9tp3cD4aiH+g
	wjTDptSJCxVGG48nyANyfI458v0GocSupf/tH6Zo=
X-Gm-Gg: AYBFou00c/eld4oF6CMH9zhJD6jwXL9XCUd9Cbvmj/LeEpgk86W4JV9rd8sDftvugCk
	ib2Dl7IA1FoJkV9LGdk0P6GBH4R+kh6IfQPKv4TV9TFGfH7TRIZYr3Rt9jYBkyFCAD7rSnm90AR
	XhDFyeo6j196asJB9wWuRS0qrMlPWrLfXfTUxZE94KGNRoIUA94AAi6N/bmL0tRvVXl853vbbMZ
	uKmWzQyUCwXq6koE31mz/vCaH5OFyJyedtPZ1wU199L9URHcrreedQ1tGREhI1OtZ4vCNXI8Dlq
	lyQ4RY05Kmew1H8/FEkmfHqSE68rFW8W4BVM42GzLyO0ERccP1BQ0N1kwRgvWPdRUKLpSQNwGHb
	IZWCMB2y1xNWf7zrRha8nX5I/NJPnPquA1ZOuvb7YKQ==
X-Received: by 2002:a17:906:c14c:b0:c2a:8d00:f8d0 with SMTP id
 a640c23a62f3a-c317bb373a6mr376649066b.4.1791408664109; Wed, 07 Oct 2026
 14:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:30:52 +0200
X-Gm-Features: AclHuK_1O1y5cBqpKVUa8hYIbFNU87Dgww6OpAlAPQAxMQLFzeejAiCOK92ZrOk
Message-ID: <CA+=Fv5QQ4KKDuMzjqxWKoWsKD70Z6XSa8TGzUq4XgB+OWGLS6w@mail.gmail.com>
Subject: Re: [PATCH 3/6] alpha: clarify that _PAGE_URE and _PAGE_UWE are the
 Executive bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Alpha Architecture Reference Manual defines eight protection bits in
> PTE<15:8>: KRE, ERE, SRE, URE, KWE, EWE, SWE and UWE, for Kernel,
> Executive, Supervisor and User Read and Write Enable. Linux uses only
> two of the four privilege modes, and its user processes run in Executive
> mode, so the bits it calls _PAGE_URE and _PAGE_UWE are in fact the
> architecture's ERE (bit 9) and EWE (bit 13). The true URE and UWE bits,
> 11 and 15, are unused.
>
> The names have been misleading since the beginning, and the comments on
> those defines said only "xxx". Spell out what the bits actually are. No
> functional change.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 8a175e0c2b42..d123fd0d4091 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,10 +65,18 @@ struct vm_area_struct;
>  #define _PAGE_FOW      0x0004  /* used for page protection (fault on wri=
te) */
>  #define _PAGE_FOE      0x0008  /* used for page protection (fault on exe=
c) */
>  #define _PAGE_ASM      0x0010
> -#define _PAGE_KRE      0x0100  /* xxx - see below on the "accessed" bit =
*/
> -#define _PAGE_URE      0x0200  /* xxx */
> -#define _PAGE_KWE      0x1000  /* used to do the dirty bit in software *=
/
> -#define _PAGE_UWE      0x2000  /* used to do the dirty bit in software *=
/
> +/*
> + * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, S=
RE,
> + * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
> + * Enable). Linux only uses two privilege modes: kernel (mode 0) and use=
r.
> + * User processes run in Executive mode (mode 1), so _PAGE_URE and _PAGE=
_UWE
> + * correspond to the architecture's ERE (bit 9) and EWE (bit 13) bits. T=
he
> + * true User Read/Write Enable bits (bits 11 and 15) are unused.
> + */
> +#define _PAGE_KRE      0x0100  /* Kernel Read Enable (bit 8) */
> +#define _PAGE_URE      0x0200  /* Executive Read Enable (bit 9); "user" =
in Linux */
> +#define _PAGE_KWE      0x1000  /* Kernel Write Enable (bit 12) */
> +#define _PAGE_UWE      0x2000  /* Executive Write Enable (bit 13); "user=
" in Linux */
>
>  /* .. and these are ours ... */
>  #define _PAGE_DIRTY    0x20000
>
> --
> 2.54.0
>

Replacing the "xxx" comments is a good idea, but these describe the
OpenVMS PTE (ARM 4th ed., Table 11-2). The ARM has a part for Linux
itself (II-C, Alpha Linux Software), whose PTE (ARM Table 22-3, the
same as the Tru64 Table 17-3 this series cites for GH) names bit 9
URE and bit 13 UWE, reserves bits 10-11 and 14-15 (SBZ), and has only
user and kernel modes (ARM 22.5.1). The Executive view comes from the
21264 PALcode loading the PTE unchanged into DTB_PTE (21264/EV67 HRM
section 6.9), whose bits 9 and 13 are the hardware's ERE and EWE (HRM
Figure 5-27; mode encodings in HRM Table 5-5). So I'd keep the names
and describe them from ARM Table 22-3, with the 21264 detail in the
changelog, maybe something like this:

#define _PAGE_KRE       0x0100  /* kernel read enable, in __ACCESS_BITS */
#define _PAGE_URE       0x0200  /* user read enable, in __ACCESS_BITS */
#define _PAGE_KWE       0x1000  /* kernel write enable, in __DIRTY_BITS */
#define _PAGE_UWE       0x2000  /* user write enable, in __DIRTY_BITS */

Magnus
