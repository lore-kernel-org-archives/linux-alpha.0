Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF182368D51
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300356; cv=pass; b=rk0jgOG7+HjPeGdvc1/qc7XR3yUebOgyFB/54UU3gLPvm6jQiIe5IqV04tnKT7y1cBR+u+iG8k95AIoi6XkXRYxTC+c/rlcebvSE0JDihsWKiavZHLLmHAcVXUzXBzogFWl86zr+8V1tVNIlWFqdrdYJntjwuqPO5dnt6dfBNsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300356; c=relaxed/simple;
	bh=GXo9+kyJiWo57Z8BPpholdXaSMtUXKxAaVUML+pqcf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOdYLa8T6/w3X2GjrwTwbc6T0VpRYtpbPeX+TyA8980Fh9eMNZxjDi8tXtjqUuxHa8veIVRnJpJse1R75Q3/eueJv1MYwHxAUPcpTWViArBrRXtSo2wSUWgwbD0qs8oV0VGKIiTbFeB4GvbutPcHa/yg/pDiJGH/sTSDx0kjOjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6DBdI0P; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6DBdI0P"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so1767399e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 14:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300353; cv=none;
        d=google.com; s=arc-20240605;
        b=H2jAyFRIolr+B3z9hxkFZvMjghGRpeujV1coe/Q0VMnqQXVZ5hXV8mM2NM3yarEtXL
         FyBRcaufIi61lolCukz47Zy+SlBtcG7bBmnlFveYbguBH0NY+NQ6ZAWgXkhAH/DOoyMm
         X5UTa+gzXRn+JEMaWpbQyt1kb6vkfmW/Oh+iZ5+6TPYPrX16TZQxL+ecWDj+W6Uvz7EX
         B48JNuk7+DlIJWXvbPqUpd/hVGsJIu4cOIN8j6mxLV5gfsu3DDKg/5dIEbi/VQaeUiZp
         pCGXAdmkyvyuOz205hUvrgMeAzeqxnqagkZyRACNHCiuxhEJ7r1HxyTDA+uy3NykCpI0
         X4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VEuiy7hG+3xakys1U3iIdKkNxMu3fQpCTZTtVeqmLvA=;
        fh=qqTNpNmN3Nf47ukBiClevzZjuDF7LYMyssO7vq+Qrz8=;
        b=U6oQC4kFDmGZ0kSFyCzhhuOVuA/1jY5sqwAUgmZVrWMXOd5ex8TqPTjdcFVkClTwSA
         +f48h4mk8BiAj4s9JLGeoVZQVaKxg10P1Ua1I1ZK/iZGE7bIb3pLrcXIcy+HzUnhKXa2
         JmG++qMxT+k5IHJzqXuz641P53LyhUH7wvgHkeuADAvjKwr6OO7yTlC7wYAnP0Xqm2RA
         s8WOjik/Fp6kLb653sb6OMhJEe83M6pS2q8q8x4nsfpA8LJSnqfgpoxXAoLQ1BDBsIWI
         YqR2R2qSwMO4fG10MBnuTkK/DNKO5tcAieHCdTjbwSxDFzVz8c7tIJfouS6BuwvE/DRD
         1vYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300353; x=1781905153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEuiy7hG+3xakys1U3iIdKkNxMu3fQpCTZTtVeqmLvA=;
        b=h6DBdI0PS4eZh8cNXNHcplhua10z/KsSChhkPA6WGqwegT+5jDdL0wPrgF/k1eBuQg
         tcbmZaQIhdkFT/ljQsYff0TbJtT7pztGTUKyjguHND8HBbv7DaHPOBhbc1vv3UEfL+ev
         +k0SA207DCySEOBhqoaY4eY5+nEbZy5yHE7wHRURUFObBJQdSiMRoIMwZAlaMJnThq8D
         OUkgnzy5+wRy5MUP8IFKLcuc3Aqj3/ELnGrYKBxRYMlGCIeTAM9S2GDeqonT2HAswnYC
         MhFHz2FGq84VjdveL51V2NrDDcio1lkyue2nb4w7wmvIc4EZPmRi1Vg7ignpMcagA4yW
         OnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300353; x=1781905153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VEuiy7hG+3xakys1U3iIdKkNxMu3fQpCTZTtVeqmLvA=;
        b=sFyqa6W5G8fVfxG9QIh0XqvoWVc6ck4DzbKU9Bco3eYYRNoOIgacLCPG3+BA2jEYoQ
         HieochB00apDu31LADOgsLvUP7wtOmVoHP52qzxTw0Pfs2sbfj7gIqE6jfW9g6natWJE
         dbtVfU1amQEv67QgqlTH94RPfsOSoh0nZinpOqHygcat6WoN1y+qs9L2/+TAj/Twfwfh
         Pvqdiw27EVISA2X+WuQPWcA+kb4uEQwdslhj9ykrrzz0MXLrS4NuiOpN85FmIMomQfyF
         Yo+POeud2szQmSt8ZsLc8j5XtM865UaJcX95tETGiNWi7dtJ1dLZSSqhDcsA3jadZG51
         xPjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YCiXfHW0eTeZdQwR4iPu4I0fHAjtvlZHX/wCSt8hoWIKQZSsNFPJbLForhLl1+n1GPMVqpPrdpxEPkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJEFTDnBeLldfH5e9bi9u4k4Xy5Rvv3ECRIGcl5UVzlB37oGQ
	2h+UToft7dgtS0EQ0ocUODASIRs6A5ILmQKf5yaansBrn7Xr89rNtnJCSxnhIUXJEpj6TfLBK1U
	j/o96QSiYer+DkT8uTbhHFAOJbWsgFto=
X-Gm-Gg: Acq92OGMOeNFYLO53cxIPMBu+QCPBSHfYHHVbJyqmZQTLt/44oH9l7ZdwxEiFLspI/3
	1sOO3P56oxoVLdGQPt4XvVEWh8qTc6t10Ddv5wH+SFC8Pse9QAfDNfK8cIGDkKldkxP62CLMmhb
	rBmTRMmOrIZfFcNTSjJBXUsnlzMfum0ptQWoSXj/0QYzQiHhYSS2vtHi6DZca+iKyIcz2F1NtwR
	EGGpGfgnhTBcKBsttRAv0VCz4ZZi4zl5k2Onq1TVQBsfMDzBzYAMy4hj7YeUO5N5pDVMvQMymUq
	IjPGDqDbwHrBa5fOUrUCtqjBGE4ARGYHp7BpjJk1UQ==
X-Received: by 2002:ac2:563c:0:b0:5aa:b6b:93c3 with SMTP id
 2adb3069b0e04-5ad2db7bacemr998867e87.45.1781300352714; Fri, 12 Jun 2026
 14:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612203006.2265557-1-linmag7@gmail.com> <20260612203006.2265557-9-linmag7@gmail.com>
In-Reply-To: <20260612203006.2265557-9-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 12 Jun 2026 17:38:58 -0400
X-Gm-Features: AVVi8Ce0jLZbmQDvtziQ1-khiFRwMEw5mD3qWtQIG7sjHPEkA3YAm1xlM-5_Nno
Message-ID: <CAEdQ38HE-UzUZf=OZ4O2-cax+L797n7nn3cMQOOKdcuh4VaNWQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 4:33=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Wire Alpha into the generic entry code for syscall entry/exit and
> return-to-user handling, while keeping the low-level PALcode return paths
> Alpha-specific.
>
> Move most of the syscall entry/exit logic out of entSys and into C helper=
s
> built around the generic entry API. Syscall entry now uses
> syscall_enter_from_user_mode(), records Alpha-local syscall metadata in
> thread_info, handles the ptrace/seccomp skip decision, and selects the
> syscall table target in C.  The final target call remains in entry.S so
> Alpha can preserve its existing syscall ABI and assembly syscall-table
> wrappers.
>
> On return from syscalls, finish Alpha's r0/r19 result encoding and
> skipped-syscall restart handling in C before calling
> syscall_exit_to_user_mode(). Non-syscall returns to user mode use a
> separate alpha_exit_to_user_mode() helper, which disables interrupts,
> runs irqentry_exit_to_user_mode_prepare(), and then enters the common
> exit_to_user_mode() path.
>
> Keep the remaining PALcode restore handling in assembly. In particular,
> kernel-mode returns still need Alpha-specific lockdep IRQ-state annotatio=
n
> based on the saved processor status, while user-mode returns are handed t=
o
> the generic exit-to-user code.
>
> Add the generic-entry support bits needed by common code, including
> thread_info.syscall_work, syscall trace support, ptrace sysemu request
> numbers, and arch_syscall_is_vdso_sigreturn().
>
> This has been tested by booting Alpha with GENERIC_ENTRY enabled, checkin=
g
> lockdep IRQ-state accounting, running fork/clone-heavy package builds, an=
d
> running the seccomp as well as strace test suites.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Reviewed-by: Matt Turner <mattst88@gmail.com>
