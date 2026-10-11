Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF191F1513
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742926; cv=pass; b=ZrwaM/WqNcVXZYQ+o3UBWuekXqS6OIy/5PiG9PopAwUg6T1teBVpPtUOkyxN2057K3PkpbBE7ZFozuDNxcLZPlzfkNCZZ1Dqe0J9iTtpxLFxwMreINX68QE5S9bd6IFFpzAuzGAaWEoU3XrYMZpLH5UZ1P1UICTz2s/90FRmrys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742926; c=relaxed/simple;
	bh=Ie3DVwxtrTARvN/IXnWx2UzpoABZLCT7hrEg9kiqR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYtUq/KVslv8kZSIApORldbcA/IkHl2HgqzXV1+yvedqWneORbGjhkJ026hNuyir2vos3/Ut5PFe+4mWZjUQpCMF5n9rsft6bLq0GHM38z/QSDSPf0h+L5tRygppQFuOD/2HKP8WtzYems64rYzb3Y5iJYvLKB1RvxoRlK7Icu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c77qxJtE; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c77qxJtE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso534461a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 11:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791742923; cv=none;
        d=google.com; s=arc-20260327;
        b=I5R2oAk5/LX1Xn2zjZCvHXGNdWEKNFh8DoLPmMQu5gqSTufB/HA+3gHofyQckaX/0y
         i9YcEs48xUOS2eh1F1FCbTlKjMRDFGPqQ5CLNrh50fY5zDvqp6mXJDVmfOt/HHiqoeIP
         rlQqIhj7q2RfbG79F+rZQUio0qa0gZck2fvoJpJLEEFikhaC6ddg6r+TsCr9mC0ppWs5
         rbIOWFPrV9ZCraZJJwcYezFaM28EsdPd1EsKrUyXQ44B+OVtMQ4A0uy81MMO6IBY6qcb
         fIy2Kpla8dR5CtqPNMGbdrDIK9LGivtdpKKSUhi45EFHBdnsaShbqC5lTbAZ1BNcLzmy
         OrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKsf9dlTT1Ex+NXpaHqSFDHmc8ysaVh/wh4jpalJAQk=;
        fh=YP58NG7im2ksHiKGTAHKF/+34HlQoZe8R63pA5de17g=;
        b=tAq1Op4ztDmbKw9BkBXw922ZOAtMfiDZQJlCmszfDccqBIBP/zGVreGuLsADrDz6Q0
         dTsmRLnpHVXpX/52U+sUOeSg448ysHP6MZaq1rupd3PwnpV1cCg4edz2QBNHObQK44+2
         S+iRsAWPLalWVQIA3YQCsUM6awdLWCLCMT9ABP5Ad52cpNSrb5IZefcchmOKlGmWg+Vs
         6I/yBXsy59LdLjwIy0KdYdddD43HyhJR7DOV4DM6E4ZxfVGULk4WG9PfW8gEXCiA0qOH
         4iMoISKtUl0SS81mJ96rJWO389+IsXIO8NMFskD5aBXm+nFzL+JDbtmVkutV8VPhQGjj
         nNqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791742923; x=1792347723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKsf9dlTT1Ex+NXpaHqSFDHmc8ysaVh/wh4jpalJAQk=;
        b=c77qxJtE22rhZqiFwMt95IhH4UZDdGoWYJ+GKoVJLa2fa0ktYuo7O6JylZlYHrUfFh
         15d+lkVqraMm+bOae9nTni/Yh/btyd/6Ffz1MJuf2FMCClltJFkYkwTkfy1h9vK1z3NW
         abU6on/aUR56X7nbafyniT8dQKq/6hSpgGDbyGdGfS3YScnOTQGY1i5Y7yqB+ZNRbc8G
         W6zpIdWzTSPCNTKBUxpmykJ2doD9YARg3tjJsSpAiUtwCxqsNix+3c+BaPGTfYSeQHQi
         uo2PflCLXpxPWCYm/NjKOSATm6Lg5U2AWdarCW7eQjz1nA9j9PoVv1nx9pjApkqTt6nV
         JVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791742923; x=1792347723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKsf9dlTT1Ex+NXpaHqSFDHmc8ysaVh/wh4jpalJAQk=;
        b=GxyZE+ovBYGPy+G6u5fYZ8itZcZkub1G8+OAlGO8FvkmTAVtQt0wfNRTWKd7qm4P/+
         PBwou1vp8rmquqTLKYUAMrTaxRHa4yGDzpcfdkT9Be2ScLUbF65akC2wJY2bIGeTlbiU
         kpNspgivI5EqGx15DOeaCgZHNES4RtIJUJYB6v3bx9dbsOCevkEaz0eBHwDDl8ZnTG0j
         ug63a9nOkIrrYIX/5zQ7L5C5UZJ7Ypfbjpfj8PoZFU5lurxV35QbeMMG6mriqz4KOz2M
         8um57HDXaEhSxicHsWUHuhWYyIEWouK4tQlK+dX6Wm3Cn/HqluR8oQkmtbknNUMjkFnu
         QoUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBZQQ62U+XmN3THOxnpXmN4+gTlTByGh+X1e/dlp/wl8lXv8lviwfhrZ0HMfby1qYClTTTu9fS98E4wA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQYp/iHvThkv8jM6pPFrNuI4OdbcGLhDbgUI+h3tNS6uGJmqR
	u3UFB1DsKEAGECMglyZ/YL3oEqfdQ51r1ozKxkpkdyx1/al+25d92+yaK12hNjFhIAQUniXmjHs
	kktJwM+20BpR+cKl8aJAh52J1GFXvLWU=
X-Gm-Gg: AYBFou2intg0pYhS35jtRjkWYufj5O95iWm4ZegZBgiy+UAstp3lZf0ARU+LZdtkEo8
	yx6qRiKXZ2iHK6lTD5Rk0eMiL4E9epIrYDpn0TxEQq3pcTfnM5OHvZ3oZU8SFfJrYgCjHkCGc+F
	0n+6cUIUx3GYx35WHkmS0nIgcNarkdQLykpVzmx0xQa/ai91/+Mn0VJWrrqSPrdLtRCRbKtL78I
	g1CcTqDm7QzDptrYlR1fuLTWDLj3PdANXKCqxGKKz44/pSjcknBLslChRKpXCC+9gEJSJknptkq
	96TqHagneqqfws1AVhOtsbnoo0WXTO15VmFWTcF/mRKd/x+W1WZIsuAIjXR9zHc4Ad62Ay26Ddo
	sbxgxnEPnGeJGMkhE2tchzWAPSCGiY/TCkP4jhyhmKoI=
X-Received: by 2002:a05:6402:1ec8:b0:6a5:f4eb:df3 with SMTP id
 4fb4d7f45d1cf-6b17c1de9b7mr7058532a12.2.1791742923302; Sun, 11 Oct 2026
 11:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-5-linmag7@gmail.com>
 <CAEdQ38Gh_t_XXu0DUGDzS3V6U_HX5R5TGVgYB8640TyiPtk4rA@mail.gmail.com>
In-Reply-To: <CAEdQ38Gh_t_XXu0DUGDzS3V6U_HX5R5TGVgYB8640TyiPtk4rA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 20:21:51 +0200
X-Gm-Features: AclHuK8dBgRu3beZiQIVtNwavLrJJ_FfYk2SXb1oQ09ZcwoLxIZRzHrBHgZts-w
Message-ID: <CA+=Fv5RE9vCzd0uvLrBnpwiQhNvvAAtaVJf=DtHnTqmjOZ6yqw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] alpha: decode and acknowledge Tsunami system
 machine checks
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:39=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > +#define TSUNAMI_PERROR_ERRMASK 0xdffUL
>
> This leaves out bit 9, and errors[] has NULL in that slot, but
> core_tsunami.h defines perror_m_rto as 0x200 and has a perror_v_rto
> bitfield. Which one is right? If rev 4.0 of the HRM marks the bit
> reserved, please fix the header in this series. If it is a real error
> bit, it is neither reported nor acknowledged here.
>

Table 10-42 in rev. 4.0 marks bit 9 reserved, MBZ/RAZ. The 0xdff mask is
correct, I've removed the RTO definition and reserved its bitfield
position in v6.

> > +static struct el_TSUNAMI_sysdata_mcheck *
> > +tsunami_system_frame(struct el_common *header)
> > +{
> > + if ((header->code !=3D 0x202 && header->code !=3D 0x204) ||
> > +    !tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mche=
ck)))
> > + return NULL;
>
> Do we know that DS10, DS20, XP1000 and the others use these two codes?
> The vector already says it is a system frame, so I am not sure the code
> check buys anything.
>

I haven't verified that. I've removed the reason-code restriction,
keeping the structural bounds checks.

> When this returns NULL the caller prints "Unrecognized system error"
> followed by "Unknown or truncated Tsunami system frame", which is two
> lines for one condition and none of the frame. Please dump it raw in
> that case, as the EV6 code does for an error it cannot decode. The same
> goes for the "layout unknown" environmental message on the non-Clipper
> boards.
>
Agreed. V6 replaces the duplicate rejection messages with a bounded raw
dump. It also dumps environmental frames whose layout we don't decode.


> > + expected =3D vector !=3D SCB_Q_SYSEVENT && mcheck_expected(smp_proces=
sor_id());
>
> Nothing sets mcheck_expected on Tsunami. The only writer is in
> core_tsunami.c under NXM_MACHINE_CHECKS_ON_TSUNAMI, which is never
> defined. So this is always false, and neither the early return nor the
> process_mcheck_info() call at the end can be reached.
>
> I would drop both, along with the changelog paragraph about expected
> probes. If you want to keep them for a probe path that might come back,
> the changelog should say they are untested.
>

You're right, I've removed the inactive expected-probe handling and the
associated changelog claims.


> > + if (vector =3D=3D SCB_Q_SYSMCHK || vector =3D=3D SCB_Q_SYSERR) {
> > + printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
> > +       err_print_prefix, vector =3D=3D SCB_Q_SYSERR ? "correctable" :
> > +       "uncorrectable", vector, header->code, smp_processor_id());
>
> The old handler went through process_mcheck_info(), which printed the PC
> and called dik_show_regs(). System errors now get neither. For an NXM the
> PC is the first thing I would want to see. Please add
> dik_show_regs(get_irq_regs(), NULL) here, as ev6_machine_check() does.
>

Will do in v6, thanks.

> > + if (fatal)
> > + panic("Tsunami: uncorrectable ECC or PCI write parity error");
>
> This is new policy. The old handler never panicked, and none of the
> other err_*.c handlers do. I can see the case for UECC. I am less sure
> about PERR, and fatal is computed from the live PERROR on every vector,
> so a correctable CPU error would panic the machine if the bit happened
> to be set.
>
> Could the panic go in its own patch, with the reasoning in its
> changelog? That would also make it easy to revert if it turns out to be
> too eager on some board.
>

Agreed. It is now a separate final patch, and applies only to
system-error vectors.
For PERR, HRM =C2=A78.8.2.4 describes incoming write parity errors
poisoning memory ECC
and explicitly expects software to crash. PERR also covers parity
errors reported by a
target on outgoing writes; the proposed policy treats both conservatively.
I've explained this in the commit message. I haven't performed hardware
UECC/PERR injection.

> The decode and the write-one-to-clear acknowledgment look good to me.
> Writing back what was read is a clear improvement on the old hardcoded
> 0x040.

Thanks for the detailed review.

Magnus
