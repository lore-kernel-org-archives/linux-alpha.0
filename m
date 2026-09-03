Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5843F8CD
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469322; cv=pass; b=C0halP/xVWqrAFS5FmkHwv2XOHlkyB/zSYX1LYCkPqw4zd6LaA6XSqgPKAoIWE00hr0Hqs4bzaVq6qEbxtNLMs7I2rd1N5VjTqbLnR1BcMAjfwfXSscPUtGniqmqZpgRim8/8OalbzKQmabmbq9TBoIzam/HapxQO5GogfWozeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469322; c=relaxed/simple;
	bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wna7eLlUcbuYKlHunDvE7tDvixmpsrUso6gjajxzw7WF/xKqIHkKiSlnlw9mFWg8ErW4Ur3JxdtSIOkfXthiP2coITACiqGS3aGXP21Z5ph3hVr7IfPEZ8HFsOnauekEBfyq90C2S5qWux/ZjpaLEyJKlq0hjgGvat0AMNL6hB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5xt2vE2; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5xt2vE2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso293778a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 14:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788469314; cv=none;
        d=google.com; s=arc-20260327;
        b=pY08coQogIexGuwgs/qghXTKTp3pf22/suzOl/rui70me7jPw4+eAtspTM3SLtR8pZ
         /gHPWRWKWphPVTbWUkm3G+KgUd9N3Sax+GbX5FO5qDm1y9JZ2KfOfwjp6lg885F4bFXK
         9UM/e8rr1NSLcnuKARrZgoxZ9alM4T43JzpyIYvNKO0y8Hm410YCT9dNviRetpUE+gsb
         o+NJ8Ou/tBDkFGC5ZImaOQqTZcmfGezygiDPyWsOp67iZQMsDjZ3764S+NYqnjC/hxpH
         9RugR+s1LLela7Cb+7iGQGIzh5L0VUJzu1oU7Z1c0KQ0lOFJm7pFafqWWe+Ey6u6TCsX
         e+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=sFNabsdPwO/QD7eYGXHPsZgUEktFtDeVIIgnaVDw3eiZ97GB2duS9JptE0qiRRKTAL
         5Ja5Fa2qRTnORUpJ6qgpWCrDDuEfDC+Gi/n2LBij10Mf8opvHQXL1g/clAySjz4SedtJ
         BUBLyNY8o3pIyC2NWRJ2pkqgsyJ6qmSiGPNuc13GI7dNZPE1uwgTHbK5YbzA5YmiKecw
         4sgsUfLlKLLzsNvK1l2D3aO84K9PBiw5jttNfTFZxcAAq7Da4SdMA4WpvksiGMK/QA0o
         ki6FC8wfrp3bhffSEL3Af+C8PwVy6fEPpoUyO5RNW0hwur9yFqbZNltQVJPSJMI7ZEVG
         32sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469314; x=1789074114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        b=N5xt2vE2RzJ/NfHM7WD28B6f7yv1s/jTdsfkwSI/n/ccrJSgp8f6v/hrHPgW9JQ23Y
         hSj78PUuRWnKrHvt9u/40pDvz8yR3zi6j08AYlBcPH03wM1eVTRW2KbYnvGXPfWA1Yp3
         p1WuCdoOyqzZmO1Zvtnw00UKNHx08zAJpZhLb2XIXgKfo+2F/YFA+Vr+Ur1J1uiJXmbD
         dk8zXV4xA0/p0DCyF+gSWNrnAf9498VzQFXHAWoNa0L/oD96CTZTdYj0PTMQfuz1jkgE
         F8dH7y8EnHt+oGup1ALB1CS2cUffSMxP9F3YPqNjFNYhjH2ofGK6EMJD+ZGD6Yd9XPmq
         2W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469314; x=1789074114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        b=Jv1gG/s3Qq753cytlD6t3LUG5nrnlPITGTHK72+ZeKBR1qjeh0/guVGqsPDWkCiOMk
         ILcN4zibwkv2c20VDAz0Mxd8nHdLv53G+Sv5AewW99KTiDhHSaQTdUcVVuqLFpPF7QbL
         BqbmNUmWJdn1Mc/Q3opQXvu/WWu7r5NCPC3Y103/Y2R0OMJDYVIhevF3LfVsykw0/Sjw
         emK80QVrGjUmHdTj0YbwFfLfcJ3haCPcHGxUT0ktpfGCTYzUC69ldiyToowZ9ss84ggD
         eJyxM2aA5y5dzIDNGgIdq75DWBjRTU7CkFmNvbRr1nsWcn6A8Dxy7StWi0PDu23ofkg/
         bzBw==
X-Gm-Message-State: AFuF++mf4dHQ23O/ymWX5udjqeUkrc8He6h0uO3uAvuIGXkWxBwKpZQa
	w2p1KrH8qlt3hY5g6UHovMCgAKcQaYbSVEqcfdbJI3brAT/a8eWpr6oVg6j1b2HuKyFHvhDeTk6
	Obx2McZMpQFMLhzy4M6ed4SbapeVHR9w=
X-Gm-Gg: AYBFou0NygIdDquVDNGSuMJLrU8+9Lt+1IrCKzmTSlH9TXfV3UxW2i23JcTwL7hWvQZ
	/fs8rNRKAfDdrjoIqweR4QWO4TwcZTMCYYaG4o34n+lbt7GfTfekKzV2Y1XMCtrkz+DrYtUxiQX
	nW34vhFpNh0l7lgLTUaW/oDO9Li4DGQV6HJzJQvefBVvw4O4HoPS8yCyAbSrwO9EiW5kDpj7Coz
	+JSLgGpfjuoJx6pkL+BWDobENsMhfLrIZAIDytvS5oGGjDXJTIrnrV1xXjFGBQMeR4YELbdVaDB
	ZGxPWSZfKPdbI99TYBSerkgoyxGdikarQGP8qzdf+Bq8NjVizKR5hOjqhDtpnuFklUS+QdIs+FZ
	bu9UuNMcLPVohfw4t8zcxLKn/uzGcYm4=
X-Received: by 2002:a05:6402:3203:b0:6a5:f9ab:bdfd with SMTP id
 4fb4d7f45d1cf-6a7e8cb104fmr612198a12.0.1788469314120; Thu, 03 Sep 2026
 14:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <6e7a5e56a201a74c00d1615a7ac1d58d385194eb.1788277742.git.mattst88@gmail.com>
In-Reply-To: <6e7a5e56a201a74c00d1615a7ac1d58d385194eb.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 23:01:41 +0200
X-Gm-Features: AcwNN1UctXBCyXjdQB9DOXuPKYOdbWfSfCWoFp7K2RjPmXxy_RlgE8G6kc8THUI
Message-ID: <CA+=Fv5TkaU7+yoU-MeHUo5Qs0jhVCexahSubAkzqSyhN+HSdXw@mail.gmail.com>
Subject: Re: [PATCH 22/24] alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP
 support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Implement the perf register sampling interface for Alpha. This enables
> perf to capture register state and user stack dumps with samples,
> supporting --call-graph dwarf.
>
> The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> in switch_stack, not pt_regs, so they are not included.
>
> A switch statement maps perf register indices to pt_regs fields since
> Alpha's pt_regs layout is non-contiguous (unlike architectures where
> direct array indexing works).
>

I tested this on an Alpha UP2000. Basic perf recording works, but
user-register and user-stack sampling still appear to need some
additional work.

`perf record --user-regs=3D?` reports an empty register list, since
tools/perf does not yet provide the Alpha register mask, names, or
IP/SP mappings. Adding DWARF call-graph sampling consequently fails
with EINVAL. I think the corresponding tools/perf support could be
added as a separate patch in this series.

There also appears to be one kernel-side issue with user-stack
sampling. The generic code obtains the stack pointer through
user_stack_pointer(regs), which returns regs->usp on Alpha.

Alpha already has alpha_snapshot_usp(), which initializes this field
for user-mode register frames, but it is currently local to traps.c
and is only called from do_entArith() and do_entIF(). The interrupt
entry path through do_entInt() does not call it.

Perhaps alpha_snapshot_usp() could be moved to a shared header and
called near the beginning of do_entInt(), before dispatching the
interrupt. That would ensure that perf_irq() receives a valid
regs->usp for interrupts taken from userspace, without adding this
work to the SAVE_ALL assembly macro.

The perf register ABI also appears to be missing SP. This could be
provided using current_user_stack_pointer(), as in the older Alpha
implementation.

I have some older Alpha kernel and tools/perf patches which implement
similar support. They target an older API, but I will send them
off-list in case any of the code is useful. Please feel free to reuse
or adapt whatever helps.

Regards,
Magnus
