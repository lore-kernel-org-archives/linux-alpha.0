Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A983438B5
	for <linux-alpha@vger.kernel.org>; Sun,  2 Aug 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785654434; cv=pass; b=c4dDu4BtXLyQiGP0kQlxYpohvfalA2+PfQiWR+aN7mSKlf5NImiD5Hua8xKV5H/zt5xeZU+GiBgxmrWoMmyJlDufHELPk5rSuTHatv6NGXB+ZcTUAqIiFPPN5Td236Fzxv+bciPU+zLUO6Xmvtt8YzJQL38nhWNG94tQVmzePi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785654434; c=relaxed/simple;
	bh=RCN2e3tVC71lg9oEPBrxox+v53mdZwdOJ8/TfLlunPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BASvaJiQ7PQmGhJkhMrdneReAOOovdizkv+32Aj00FB8tWv5cuCn+id8Dhgj7mRsyipi028lSu2CdfNZ0HGlpWbw0UDoZDeS7WYTFEqpG1M7uwpwQxPRae5k7Vfmrwu+TPhaS5FpMkoEW3r6GVTKJU2TskAJMrIvjrFnkADhrfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCnqNV8V; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCnqNV8V"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15e03c2763so445687066b.0
        for <linux-alpha@vger.kernel.org>; Sun, 02 Aug 2026 00:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785654431; cv=none;
        d=google.com; s=arc-20260327;
        b=rGl93ouL5dTzHY8zhmb6P5lDtenpFX8GjMR46u2HdEhyGPRDNpIY3IEX7XsnfXqL8+
         7DZTmilpbHpGTgIK57hrnHTjNQ27I7lVHhAWhDpXsZq2FkVUKXEiIjSvP0SMgo3kPqFS
         lFJfIC+xmx9kX2Yubc5zSygvaDSBufrXeylPiSYvx+jg3al+Tpa4bhQEJpskFS8ZlULd
         bobAVELOTBFYK+GXrN2PcVVlgV/E6k9VB83OJJbTzPCOZ7C1aQ7XT25asM5jK53AALZo
         i5tQIHe0xJ6rE6kysY9YOPEGBNBDnt2p7avtndyq0e4Vzyl9LQIgYsBO0B3K2HetDn4B
         ICYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        fh=IQp1NaqGsiEJ1XX5A2+t0SsL7RGa5CEs7HiE7nzCVlc=;
        b=b2J4Jd3Xj7EMwXZlt4GMjxm6HPboNMzKlqRoMVNLY91yDlZvAxlY+WSIIAxzvhAMOb
         +eir0ceGCL52FynNMqr2qt6qV6DYD92/3PDqcJ/tfdfs1oc4MwKb9fq6bQr3BvbLSkD8
         vv7Tut+jhsMFcIPASU56luaDk+m9wSgEqLGe4UTYtLfyPjl0euI015Sqt9rffawXisGy
         UH+svQ8vyOPOHRy8reaWdfrrGLAW713XiAdQojJBlHHmRd7EGWaIPaQMeCFFU1LfC5L+
         khgnq6ao372X3/2GlSjTARGyG/ISaRFxcjk4v598nFG/6duExhah8cV17dfma7G4q2wP
         3rrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785654431; x=1786259231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        b=dCnqNV8VvgZXDHfSPYwus3AMaEDxmiPoXnSgAdmdmY/lh+2R4qVRW2HmOt7DaYIjKY
         g7C3EYQ21pCW/qg9yzcNA7pLCjaWtXwX8m605wr/wsWBBkJsUsqwqthAgVUlpA2zFWoS
         EkzBh4+iPSF3GQbvBI6eXThlzHvF9N+hjMA+xdqIUGsfZ6MaQwef8P7Ujy6B96KNnsee
         J7LRRMQRba4hdpqy9pwKbGgMYxG+rD59gGRjuB/VLo/uaP8eNi11e4BGS66LYByYTwMf
         z86t4i0Ael5+Bmo6R2rBWwkgULnDuDw93YYrGch66QJsJHdFSLS4wYdnKwWWbXlALKzr
         e5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785654431; x=1786259231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        b=sSA/kzfNZKsyPjZTnM+fh0XS5WKQAj7xJnOUUcrox5+l4/5Lk022sHsjjK6M3d4Ey+
         tHHRDOPj2lTlboAWyvr/fnAT1zJ9z5uFbjtxjJP5rP5l5UOfM7DSvu7gl77DkuIl5gTo
         E6coMgJT1dF9b0BfPqXT+B9FRmv9sSsu4sm8AnSbmYrjhJXCeHFfpOCRDslZt3xYsaGY
         2DPbWD03eAiCbpoyIl3J9vIV4QkxFo1p3a34dYjYbEvboS0qvpEqTitVBzhQvcaEhbAP
         f4JoFbOy/vGzFDXc++ETeoi72p+3ANlD0Klm7HxgU2bnBl5GLLajigvJ8hvHZVq6OnmI
         cyKA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5bfxIU5Xa1CIM3BM6cLi0Q54RAJ4u9DJWqP0u3vLCeFgfO7/YdnjvBWPr0QgSCBKxVHFwb9643MQgcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqQ2Dr3RDxHESZesDOv776rTPt0Ljy5/OJYxGY67dXD0ResU2
	VgHXJtpSRWD3KEwpXLAdZZAuTBKgJvzbT53A9Y4Ge4LfedX23oj0UB+y0tvbVGc9ObgY2/4/9/n
	QaPOtFDzMaILt3yKo7h55ucqQ8xhqjGA=
X-Gm-Gg: AR+sD102EAyIefeqWzItQARdfMlFLGqWBS5KJKPe+jOuCPyD2irxdOM/Xorpq4PQiJW
	j70IDo/Ig8484elGr+QQFvC68rBI8DrJr1PLv8oYvlAK9wgHUSLBPJmG5hr+9PGItlIzJlesilx
	M53J3afKGuLSoQBw+BbCev362cB/lh9TT8UqzFFqXxPjJSgKF8WbBaQrf250OiBdDst8KmlzTCC
	m7GiRRj6FgeGPG9VJDVo9w0mgw0uHBWIXKsYsui2Bu4yYfbJ2n+gcQvRsiE6/HtfQ+R8rbJKRUh
	DW1dOTa7TrUQ+ZoM7ViI/vJGK8PYseS2uOcX9rYKtX593SIxbpeAsLeMSupxip6DvuLJ+RJD7yW
	s9j8jzYHApcU=
X-Received: by 2002:a17:907:7b8a:b0:c1f:2cb2:c448 with SMTP id
 a640c23a62f3a-c1fd316b628mr516066466b.7.1785654430688; Sun, 02 Aug 2026
 00:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
In-Reply-To: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 2 Aug 2026 09:06:59 +0200
X-Gm-Features: AUfX_mwtfmgkviDvjezx7grGX0HL0Gh9d0-llhAlAkkyNEcBgh-xOD72oQTUSZg
Message-ID: <CA+=Fv5QROOqTtQL7y7x8FDfL2ejJY+P5mCfDR1khJBDEGFCDOg@mail.gmail.com>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
To: linux@weissschuh.net
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Jul 22, 2026 at 3:28=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:

> + * Syscalls for Alpha:
> + *   - registers are 64-bit
> + *   - syscall number is passed in $0/v0
> + *   - the system call is performed by calling callsys
> + *   - syscall return comes in $0/v0, error flag in $19/a4

typo in comment ? should be:
 syscall return comes in $0/v0, error flag in $19/a3

> + *   - arguments are passed in $16/a0 to $21/a5
> + *   - GCC does not support symbol register names
> + */


> +#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)            =
      \
> +({                                                                      =
      \
> +       register long _num __asm__ ("$0") =3D (num);                     =
       \
> +       register long _err __asm__ ("$19");                              =
     \
> +       register long _arg1 __asm__ ("$16") =3D (long)(arg1);            =
       \
> +       register long _arg2 __asm__ ("$17") =3D (long)(arg2);            =
       \
> +       register long _arg3 __asm__ ("$18") =3D (long)(arg3);            =
       \
> +       register long _arg4 __asm__ ("$19") =3D (long)(arg4);            =
       \
> +       register long _arg5 __asm__ ("$20") =3D (long)(arg5);            =
       \
> +                                                                        =
      \
> +       __asm__ volatile (                                               =
     \
> +               "callsys"                                                =
     \
> +               : "+r"(_num), "=3Dr"(_err)                               =
       \
> +               : "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_ar=
g5)  \
> +               : _NOLIBC_SYSCALL_CLOBBERLIST, "$21"                     =
     \
> +       );                                                               =
     \
> +       _err ? -_num : _num;                                             =
     \
> +})

One observation, although I am not an expert on GCC inline-assembly constra=
ints:
in the four- through six-argument wrappers, $19/a3 contains the fourth
argument on
entry and the error indicator on return. Would using a single read/write op=
erand
for $19, similar to the handling of $0, make that transition clearer?

Michael=E2=80=99s successful testing on both XP1000 and ES45 also shows tha=
t the current
implementation works correctly on real hardware, so I do not consider
changing the
operand representation a requirement for v3. From my side, addressing the $=
19/a4
comment typo, together with the "TASK_SIZEi" typo already noted by Willy,
would be sufficient.

Michael=E2=80=99s testing should be sufficient, but I also have access to A=
lpha hardware
and would be happy to assist with any additional testing if useful.

Thanks alot for taking the time to do this.

Regards,
Magnus
