Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F13C5826
	for <linux-alpha@vger.kernel.org>; Sat, 11 Jul 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772968; cv=pass; b=RHk1zum38Xx0zhKcca0y5psRD18ezgYHrt8EkbGHz4NACWSdyMS3onvuk7lfKnCS77jo9mc23Qf0CkzrRRyiMUBNWPCUZ7be8lI/+mIGPYPROnnPdDLAfUzu28oOcSvkfY5yn0tI4lboHBVPRJtxGqKGDW3bOyaCO34EOz35g1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772968; c=relaxed/simple;
	bh=lgplXt8OmmYK0O5s0vGlPCfavq5E5GB8C7ljQ3QichI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfjSMY4/cKeMDZ44GcXdaCdKqUAu2L6XiLewWQJHJhwGvRDmr39z7eqSc69sE6YIXOL/jO9SZrQAt7HaOM1zkKR8WxPBY/jzaSI3VZAydZvYvdkj6pXMSvN3JIu1zliH/M/wV6ViNxmLM/5/Y4tTzbbeWX+tKB1waXVnfzf1vyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhVAsJnP; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhVAsJnP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so2817324a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=YdbqcS7p5N3HWQcoaMsFcClwNXj32uCqHczWAOuUM6SYHciIOwLjWD6yxJKUQk/3Ig
         u6rDZfZRy9RFu3Ujs99Gylhu9I3LPuHd9+kTLeHY7DulvFf1pxCQMvojZbDIQcHdnOHb
         rIZCIsbnoThxqHTOagijx3K3uPcXQ3wZi0SPSOyi5SIbIYh0CTuIrieQu+NlYpzfubKr
         OQC38BXcsH4lCkPSBYpDdTYBBLPO0MffrBVQy3k3axUi6vc2v5qsypvxTW6SU94wLD4Y
         5bWJ4nEQVc5gj0l7ql7zuerGf5HR1DnJXo4VUn+Sfed0A0P37+wHGhZPIppfzwvJUoaH
         i8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=xaQJ6XLjDSuPD9Y0Rxvqs1QmvHa3TEQSQsKos0wd4u8=;
        b=XJ2wpFudD0agPVhxS5S3b8bNfLc6GsYYn4Atte1S6rEHf3utBTANgtgW8YN4GfwScq
         1nLqGoVHNgoHgptv/mSRbQEtCWXgE9i2xdJEmHjJiPsbB9HyY7mhs+5YOkdc/PTm4fXG
         A/ZIBD1Ya9AM1yXp8bRZQ1z6wC/elYV5Qfo609IUKDynEos0wbprusolVliPvhhd0zSa
         SLtZv1MUvRWhwjsX7d0kIuRV8VB96nrgs0de7RGHBtc1XW9c7iZDIDD3GoaaZyEke5Gy
         1Gnbiu9pggcxMuOWiRzodBOpN9mm9hEUUf+SsiCw0r/bIAIIQY+uYTKV4PAJc3RPVQua
         imsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=KhVAsJnPccLQtlT6BW0pZOI6M33Kq5peNIi+brKc9mXt9N7FYBNxZiwumx0gXF4fIo
         sAO6rzobNlVEoIHs9Nr5Ud7Pqw06Wde6xz1P1K2kPK3YZyfFF/QcLy13zXrkpb8v6zCE
         wa1FryKea8CiALQ/FW+b66R5gxrKvaJKvQ5Z1BuPJv6JghHzUORCw6XB09TKL/k9s/1r
         i0N8avEwa/AHjCgBU1q0AZKoEW1/H84E5Jz1kEDp/nKMXzLRh+UDioLCoc7tRKEjgsZq
         3/2AvXjdSUp8fEKFVNQm320lqiCV3PxeKpLmb2suZXyxqugmSpsqzHjcuuYpicZfDTox
         leNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=VJT0NpVsfAnmhiEvfXBfuyRAWD+unfYiJep/zN3Vs2yk/CaZS6BsqVTjQ7FZhrDUDX
         T/E1H2PvIbQc2BJRizwgjYbC1YWF65gfH2by1Izd/amtt1AIyOeORIGLNeyELnLPVbwm
         BnouXMnE0lh3099j1DbURZgJBAYD6MtXgJ2pk1dOj4Es1z9EZH8Nf5ratMvGrKglz53y
         J5U7smNUpe4HFLymkV7veF0XzuIrgQhcPTsb+YPtBH+/R+gyfhbvk8b2Z4QWThXVUssw
         kL2ngCwtKKFafFk32nuuYTvNnW3TUFcSVr8AlJLK4EuSGQbxnxmYNkVMy0c5BfcUiCHU
         1ZUA==
X-Forwarded-Encrypted: i=1; AHgh+RqUjfEM/0MMMgYeA5S6mXTFruK4LQTIJWCbdNaGVTxZndRm1q5XMTkaF1f8oapM1e8w0FhEbXHvd79viw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VfWntEb5yY/RJDkMo/uFNZhfJXEDJ4MZRbmBsD8uBuNq/jOl
	xX4DxJ2dqLk5PM1k4z28mhh2TO9tSLsvPTNmpTjQjbNze2b2+8mn1i/IUborSUadCywKOnIJr61
	rMmcUCmu4FeXVqUY8GeaWXjFD8Hw4S8I=
X-Gm-Gg: AfdE7cmhrVzGCiDxb/4w/EB7e/f677ACQd3xq+SmhhDxJJSD2L7yOQO7NCvFi0i5ul+
	9vINrxgpMgv0AiQ+RvkKoyMFs4GlPpz6+mig/sjmmCpLg1LidXfrFFrQVHqiEpxt8sL6USXpxWl
	ezI1WaZNhhXDYPG4+myTZo/7HrpbSmI0wz+ATLP11upIISO8iKPefeHuCI4d8Z9nAbbIp27/OtC
	FhljkDjCAlcRynVAeYEh+jW4HmPBekrZthREGG57SNp0p2a2Dce7sqgHqWXxv0Ng3VFvcY6Dib8
	T3iY1pAeYwYfFFj6c1P7QpXrMtXnmB1BlF7/SUkVMT3rc2VSYWcPmSYh9W8o6eg=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
