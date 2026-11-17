Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897873;
	b=dV7XWKKPRtqUKkyK+p7R8GnOlEudGb8Si+KEPP/8nv8uFemMUdxKewtPfkJDKe0zpbrL
	 bXCvQSvr+2u90sOAnuHWMO17bwg8HYhiEedqni8l0IwX4BZLZ2revbHR67jjY69syV2zH
	 fp+1XsZSN7FYcIHnmUkyR+j9BIiNOovLC9+sTN4Yd8EJ5PCpnMd8j7QL6obIyrlITNCM4
	 2UGniDGXGgt0yzG0+o1ep/9HgJ33qoR6tu3hXhL+BU2OubSt2BkclsDzg3tFMiDkuHcwB
	 rbPYxouaEmDU3m3cTjM4X4ZQmk8Ww4xiIj4LSYLTWwyPDowL76uZUuYa1EBfvUUE6zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
	b=1AbdF/pOyF+pnBwcm4W7sdott/c0ORqEmj22zvPvIL5+yja8NO39s5syrYKsWzlrae4G
	 1BGDJS0UA1gWa1hcUVBJT1/K78vjCYqgyDjxMkkpSiVnOvX6D37XpoexmRnggoW/nUZLi
	 l/J7O5iy1FM1aJYNquj8CVM2I8gkvK343RjjUrb2w/Ale4X4LQexLn/M86a4BlYI8kCvp
	 yW7BfzooNr1T+xDu03EeAkkW/haY19A3l8s2T0Mzkazlp6F2/e56GJ4F6bIP7P0liQNXK
	 qL9GjmXMKPZc/6FkH5IuSS5+Rwtj0RzCCYxurpPQamyg1EyWqkrEkJk28w7TO0FkkEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUFbrFy2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C609606A323
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 06:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C609606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUFbrFy2
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7efd3bc26so2956927a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 22:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897871; cv=none;
        d=google.com; s=arc-20260327;
        b=kXAP1E663/vAPrBfNh/s3dNPKDDr2ON8sc3zitcLjYVds9qIiHvu9eiiYkfLx9XZaD
         foCx4jAhYZmwQ3RK1R3/4Y6LM7W3L/pcE5sa9c/DkSnf/8orZy85U5VvV6BipScqD01s
         1RE3PC1D5a6R/wXvyWJT9tEg9E+hSDebPbfNdDX07vKPpvlcz4HrQhHKe3A/KsqfSeKe
         8SQeoLTeYf96hvF76SiLQ0/1bhZLhnOdir8tEIXvQNFSBgddMQT2uVlH6oKOGgLVDyPh
         mkiMmp02PQJONX29S3zoKb4X+1tjPtoT7t1tAUYUzdmat3JX7iKOhi+2Z/nxuq6AjNFf
         QBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        fh=0PfcMT7Wp2ZebWA/lu1JKPITwl47tbTdSNih7oPnAvk=;
        b=W2yKm425ixqUOOtCWdlIfpKXkyByR2imS914rHCMooZyuncZnSbN/pw6+kawjd/Uj+
         Rb6JaI+aqeuB2NR+1e6u76p5WJlN8VehReJwcqmbWcP1an+mHm3XxUkOgYdPySwNvqCk
         zx4PMCvsrpH+cW0cRQsF+XnEYoLzhPulqTtEPmXrpOMOyECUhXePnzAcPfmfGdpZg9a1
         jqs7blrZmFfCb995IEAeXqE0iOFuAIG0yWhkirwUOddz/gaNISaytyS2huq85jitEyyV
         epkZMFg7lzCqHvmbztlDFzOQt7tQAGsFzKUPUS1ehhLAh1iqBl5Bo10iFMYMz6haxndB
         1VJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897871; x=1795502671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        b=tUFbrFy2oVRR4D9dkth8PLtX8S+v90L+bFtrhKX9m1UuYrgY9tbNg9L8I33jAMcvqs
         8wtUR6CFIEwrSNV78pMA8IYXASYQyTqAeiPy/G2xz/gN99ddC07qWcV0yfH36XGd9maH
         BU3lNPHRyLukmyQ7TQOzty5meGpDKprrZMWPzbreXyCrvAcNigAnwOtK7CzMmtCehri3
         HE95W5EafhGtjlImAXRJ/YlYizoDU8kbh/YVuQ+Lwgv5JYD+qPrd0Dlw1HrhkSbLc2Fu
         qy7MJERiSetm3cSzlquq2MsFHjK8IVvZ+ZyKc7B5hw7sudZq08B6zZgoBO9s5nRfF9e1
         3hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897871; x=1795502671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        b=riRuRNaf/fm0TZ4S1ExtQpDWPg2te7lswZIqinTiK50ZcOKH58rb9wtkNHVeHKEwx4
         FF34WUmiMsKMwuWy/onw8MonEyx8cB3MkqHi7m4+4LcduD39/qkT2O4XWtmaumoxowvu
         1csdFGlCfx8UsJ4WNPA7u6vq6z7QacKrNf2BbzjOP6zA4l7LkYbSLBYO1iwfFRWsYvPp
         rwsqseGob3fUjUHe/mXxE1avFl9tqR2BQ3adc0q0Nkp7038W/bPFEv1MRU2DtmE5xvBC
         p3+NIHG1EQAw2YGWYop+e2VqtTOVDIALseAogzIqanLDw7SAxEnawpZmqfEZMX2V151Z
         O71Q==
X-Forwarded-Encrypted: i=1; AL+hErExyP23O3hiKWxKJ0R1yC7ZEuOePMar8trFz2QLj28JSTR0JjhuGpova28oLEahShmhlUWGnO6WLZpXlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oYtmppN4xYy3rnUNqXotfwS9qSR+ckhzpUVrv9thWGLPsu9L5
	9HSesFYJBJiHh/Ddp44jbXpy6EkECCe7+YTprXPyK6lhSiQ6sg1aSGqUj4RBaStiSSmsddLjy8P
	ETiZS/hTbnEaNZp8u1BjouvAh83uWYeI=
X-Gm-Gg: AYBFou3+uma/MZgzxH/5sXXL4v1E2jpShurp+XfMjuQvOz7LucKsNyJ8844I/EryImJ
	ezWkRsIQgQQp1U35B2b0d5klk1q+AgTPJGwR+Tku1t59+Py5kE/izQAvaA3m86NC3e18IPc8BzD
	fh93z0JLcXNExE6j1W1NDW7iY0fVlqSbCdLzUY5kh/WU/PshU72ggfcKYlZChJSodbCae3b4TZE
	VSebgqzO7goXtWyIqOELNIQkYQajyRbpCPRFkEeSzxWzZ9TS+1rV6Ss1KZCyX25J1jhl5Ck9BWg
	iUxtAwM2u1kZjMjNc1KQoWjOijH997IrALtj+6pnst1HW7v5L30FfSpvXUDTHQqDw8pvNzil2dL
	W5BIXJZ6xn0Vn+k/LtQPONHqtIs/jQ29Nw7CGz1CSSpkgO8XxnKc+ctra67bPN/OdEGSPsqfhuD
	tuCpbnkGCWS70w+9/eUquAUhYE
X-Received: by 2002:a05:6402:c704:20b0:6b7:b5e2:cabb with SMTP id
 4fb4d7f45d1cf-6b7c0bb993bmr5955812a12.8.1794897871015; Mon, 16 Nov 2026
 22:44:31 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-alpha-compile-v2-1-846bb099b319@kernel.org>
In-Reply-To: <20261117-alpha-compile-v2-1-846bb099b319@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 07:44:19 +0100
X-Gm-Features: AclHuK8YsvjvZp7sEaeIsouBlxaLyp-jgfja8tf63lB_xIOqlJHi3e63Ijh0AdQ
Message-ID: <CA+=Fv5RbQbP5Bd3J-xyHGPXxcKO_T5TuU-eUZygf7FKfi56jEg@mail.gmail.com>
Subject: Re: [PATCH v2] alpha: Use symbol assignment in SYM_END
To: Linus Walleij <linusw@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Nov 17, 2026 at 1:07=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
>
>   Error: junk at end of line, first unrecognized character is `,'
>   Error: .size expression for bcm6846_runner_start does not evaluate to a=
 constant
>
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The generic SYM_END uses .set for symbol assignment, but Alpha interprets
> .set as an assembler mode directive. Provide an Alpha override using
> ordinary assignment.
>
> Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
> 2.46.1: the original header reproduces the reported errors, while the
> fixed header assembles without warnings. Symbol sizes and the embedded
> Runner bytes were checked. A full Alpha allyesconfig build was not run.
>
> This patch was prepared with LLM assistance.
> ---
> Changes in v2:
> - Use __ASSEMBLER__ instead of __ASSEMBLY__, as requested by Thomas Huth.
> - Link to v1: https://patch.msgid.link/20261103-alpha-compile-v1-1-9e93e2=
260a9f@kernel.org
> ---
>  arch/alpha/include/asm/linkage.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/li=
nkage.h
> index aa8661fa60dc..275de8ac693b 100644
> --- a/arch/alpha/include/asm/linkage.h
> +++ b/arch/alpha/include/asm/linkage.h
> @@ -6,4 +6,12 @@
>  #define SYSCALL_ALIAS(alias, name)                                     \
>         asm ( #alias " =3D " #name "\n\t.globl " #alias)
>
> +#ifdef __ASSEMBLER__
> +/* Alpha uses .set for assembler options, not symbol assignments. */
> +#define SYM_END(name, sym_type)                                \
> +       .type name sym_type ASM_NL                      \
> +       .L__sym_size_##name =3D . - name ASM_NL           \
> +       .size name, .L__sym_size_##name
> +#endif
> +
>  #endif
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-alpha-compile-efdde587115c
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

I've already applied v1 as a6424204bb55 ("alpha: Use symbol assignment
in SYM_END"), and it is in my published for-next.

Since v2 only changes the guard from __ASSEMBLY__ to __ASSEMBLER__,
could you send that change as a follow-up patch? That would let me
pick it up without rewriting the existing history.

Thanks,
Magnus
