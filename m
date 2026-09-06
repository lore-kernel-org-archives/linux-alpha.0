Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A671A2F6577
	for <linux-alpha@vger.kernel.org>; Sun,  6 Sep 2026 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727741; cv=pass; b=g5ZhiE1t90stQJ+OZHvmQVcxJ4BMTOa3GWyK9I7FV4FCxCtVJhuGoWWutzvM94erkSTOnW3W7lOJe8QM3fBiAx9tipc4e12lTOwYas9xSnfIAzt3hoG1AfABvpsbzW8MQMThMZ545/RaUoZR6O85PxuWQou2zFI4fOEfY+2Nbyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727741; c=relaxed/simple;
	bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/DktgWgvN5c0b1ELOvvgFE9+l0sx9CRRnOyBq6pq7+vBPmFER+febIysHQcESBXiDS9BrDSetUW0ey/OY1sCcJjyigocnQtvXxSMKZbLkolmiyZFzy1QpsO0Ulw4uktQTTu/h6n5bxIlwpk37qL0iAZxQ+3TmDR8HRNrWTm210=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZk5KDXz; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZk5KDXz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so31551871fa.2
        for <linux-alpha@vger.kernel.org>; Sun, 06 Sep 2026 13:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727738; cv=none;
        d=google.com; s=arc-20260327;
        b=lLqAS+q8iWiAgUCbxM8Zgx8zF/bVfsEPXjcgPzW74m9zrzx9rhiLN04itRoNYSZLY+
         UteXiHYZhSRq7/lLRvEommQUgzulfvm9Yf5D6nxOFp6BPdI06ekBZfr7v0ejS4pbLniE
         pxsEve2tlfI/pc4aKwqxUn8LRmdKPatXfpL6PvONP2xc6eNNHRvHCJ6amrVCBqgk5CDm
         xoZ+xs2Ven4TWN5nGxCN8XJRIm7ovR+sT0AXxZhboP0+R29KCi5/Bt0mDsYo8FEhA+Ri
         mWxeouX55O9HVmMFxP/Je8q8dgIzg0L2ne1p5TK9YiC3WCd45MUpPhQLji5Dh546vJ3G
         9zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        fh=xFPvXxP5qp42ST2xIsC7zNI3Pn/EI7NCwNhsifFmHnw=;
        b=QZndJQDMg4C5wpytjRWx96QumgX5Q+jHaKCR8Dxq/UsNVqxPezubYWG131nxqHAlEL
         0+0WBRJ0QnKvxbSOKwylOCHaBEMTooBJeoSXpzVGEwoMSdgWP4scI9frNcpBlbQN0s7s
         HKAehIHjpbXoYwtV3s7HshwsMWlr78ufiDMqUh7880eS38KzKRtbsijyPe4Cezt/TPQu
         fDiQC7zxcClVtCep97m/VLRSgQAlFpbENQKrLh69E67sZZpmH/55j1EvHZ+2LiN5+Fhf
         hSDlq/L9zUV+lC/seWKyvVg8sawiMWQ7jLPMlZUNP0DSULQihSu81Wc4S1FHje+DsYIq
         u+pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727738; x=1789332538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=cZk5KDXzUETzj8RP8JTI9IkiZEty11Uz/+7XcIxIdfsEdrw4wen89Gvqxcjc26irGP
         Fon3+vr1MngpXMTwXeyjEcQ/OIjz/vDjLR4EvT0P01TeWgBxnT5Vw8YMqu4W0H/jhdvQ
         NxR581SALe6XyO0zhxuz4HJsnq684Pa3R8coRqaEntbIVbOsW3iGgpACx9bWFpW7sGSA
         tm8x5uY55U6S9aHUX8RCXDpAXtzWEZdtW5POhbJn/VNYNBs2ulN9Rk6Igx6Fdr/9CKMR
         sZ+4lZxRH+JwaR0hpUYqpxWgS/rftIxaeGgUwjgDkNUUuhuuXe3xLtc8KpIjPlEPwZY/
         GSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727738; x=1789332538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=VVJgH9n8GJjh3S2hQhYWubKlhnb6ClBDX2tIKLlXz4BXjxlmGY3JkabsDxJsUIOf2e
         I6fCPBWp/DZngSUp9rXi6ROHEmyuob2YQpHfe4/8SjXr2ro65MwRIeGxi7CmuLa8tGaD
         f6g8ulQUFSFLPxLBRkiBXO6XBzZhHG0VewDUsgLGaK8RJbLenKk0iOLb+WbdXkKuBBg5
         a74EmTu8kEXxl2yW9ZNbK1MO4gchUPN/Wrx1P5GljHbL0XEQG6jx9V2S6BX7UPTD8I44
         TB8HG5RUU9Zf63RWGq5biOAQFUcSq7HE+uYukn4MfBLYxpWTuHKNeyOEAAPeOncOYbts
         rLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa6lIkkVc6+Ebcoi/9pEd9tGWbBqACLw/EdhvkuQs2medCXuwLON7AKyu6wCIO1gh3ds4i+LrLbpEo/A==@vger.kernel.org
X-Gm-Message-State: AFuF++k5Q0mJNvt1IzY8dHlmdYOnH7meD425ykjayggKi2SYqewJn8pU
	VIkJVe45rIrdJwrEwiLhR0kW8vKW2X0LxWp2xur+e8x+52reoJwF1OQ+7poUtuT0Xqc0x0VYLTN
	0c/yrjt+CFKXZ14gCmLQ/imvUNwCtCMQ=
X-Gm-Gg: AYBFou2b7zzUOt97uMq+Jikrmxay+r4YpHabj8Kl7UELnBiF2LDmG0qHdLLSZKA8Uoc
	2xL4DziT0DJlHZwJ8AQWgzZkhpivVuOCIpLlEWb/0MKfgnTz9wJONv9mSU5WR/QcEVxcsdZsu4Y
	nzVZz+il09kq8StEY/Sw0RP0XqCHrEbm0ZF+EAEg/HmwnvGaebFSzKvoon84GxgKm8ZnpR80r5w
	zvacHsBwtRWSMlQm8mJz6tYucdFg48+NF7tI+koQiAVeawbIYIwIU2f0wvHeNwBswysMIaRxxrW
	gVk2I4wHYy4Twt2xszFAbrKWdmC8s61ckKgnPYC/HY1BuRRBRxsiq0ulDXcv9mrkRumjX3xPd9F
	nk2E=
X-Received: by 2002:a2e:bc0d:0:b0:3a1:5172:c287 with SMTP id
 38308e7fff4ca-3a371b1c774mr20550341fa.5.1788727737292; Sun, 06 Sep 2026
 13:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
 <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com> <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
In-Reply-To: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 6 Sep 2026 16:48:45 -0400
X-Gm-Features: AcwNN1XRBHy89Hz-biLi2GuAv1p3kMnxoZpJdzyZFQd3kQ2qcC8_lvRB8_pS3ck
Message-ID: <CAEdQ38F9KRFWj4BuzWYvbN9xf5brhwfUZuj2DC92iR-b+2fhFw@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 4:44=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Matt,
>
> On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > Implement the perf register sampling interface for Alpha. This enables
> > perf to capture register state and user stack dumps with samples,
> > supporting --call-graph dwarf.
> >
> > The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> > r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> > in switch_stack, not pt_regs, so they are not included.
> >
> > A switch statement maps perf register indices to pt_regs fields since
> > Alpha's pt_regs layout is non-contiguous (unlike architectures where
> > direct array indexing works).
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> I think this patch still needs kernel-side work in addition to the
> matching tools/perf support.
>
> HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
> stack pointer through user_stack_pointer(regs), which on Alpha returns
> regs->usp. However, the interrupt SAVE_ALL path does not initialize
> that field, and do_entInt() does not snapshot USP. A profiling
> interrupt taken from user mode may therefore attempt to copy the stack
> from a stale or uninitialized address.
>
> The proposed perf register ABI also does not include SP. A DWARF
> unwinder needs both the sampled stack contents and the corresponding
> stack pointer, so this cannot be completed solely by a later
> tools/perf patch.
>
> Would it make sense to drop this patch from the current series and
> submit the perf support separately, including USP capture on interrupt
> entry, SP in the kernel perf register ABI, and the matching tools/perf
> support? That would allow the rest of this series to proceed without
> waiting for the perf interface to be completed.

Yes, let's drop this patch from the series.
