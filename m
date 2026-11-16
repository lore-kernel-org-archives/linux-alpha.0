Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794852645;
	b=GONquFnNOqNpddQ/1bKVPQeIEsi2SG04+6ZwofR3dhq8hLnk13BEmkrZmn5yJ4eD2pAb
	 xA/Jsvx1w4LE5f0e5o4/pIpstAJ1N2mzEI+MM7yo7rQiUTnWzirEHx6m6GV5Hm+u1uqWk
	 sOdp7+s3cQ14LTbYqbtzNS0pBMG0s27bg7p12AE00K2vtnoAJ9wxNDDz4tXWiT38gKN8x
	 KrDzqIVXUKod1tfdhFHKQeAxDaRB+4WkJajzXG0fVfyKvtWuGOjblLwyEiw48v6gQNEPE
	 fZoDRR/T0HUw6tVaZ1Z+YW2tY7dwbjX85B49XctF9ZxWlFgSQs1zMIdaHcCm8ekIDzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
	b=H8o2N7QH9xg2ODXQG5YxCybnB9pYLMKzy9Yv3aQv2Bthvysrcw59KOPg8FdmZAIFsRO/
	 Otsh8AWTbx4epQ64um4QMNGGTkIQ46r1u7d2tTZZSJ4+1CIE83pru8TGWKkA3bBr2Bzwg
	 R1plnfXO+Man0dqS/OIq1YQxYSbIctNe+I1mXNGwYf8RZP2a+fRwT3nz4pwUV6tLude/I
	 jKCvj49rH+7qnQztzcad43Dj3cEg5QauqA8bD7BsAk80t+aAtEgKCpRwTqejrui9fK/AR
	 lAECcaeI4Qvf2pc9Si9nVv/NWD2SPzu6WOMFxioK24x/pgkXLrVWrBmsiZFLF1hO5nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h;
	arc=fail smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BFE606A32A
	for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BFE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8082af2ffso1893121a12.0
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 10:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852643; cv=none;
        d=google.com; s=arc-20260327;
        b=jJvTdjctF1fc2Nes5noHAcXhtAZ7uskkbiwNuAXGXTcJ8oJ8d7FOnA+kSJMgGPxYo7
         TIMxLgE8TxUpBNBPZjS6orqlnArFuvL6f1W+grPc1CkHnTWksSNSd6nc/tkS5Zz74fCL
         3fcPZLksZpOVgHeD0fofZYI2D+0eW9ac2/bm++QL3p+ZA42ZkjyWZXus8zY3cCWcN7nJ
         sLiGeKAfketgWGVaRa/rBzvDpJHuZnnCzrB5LNxJBR7z+f8yrGXpvJzvagU2UF7aW4DL
         p8eGlkPXvpeatZvu0FKvi34lEeplqAcXJ9Sf2dNFTB7zKLZRhXJluH/1MyuAcaimu/AF
         PNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        fh=CtECahIu8rnUvXO9XgICe0KWLHNUugSr2Q/4W2UuZaU=;
        b=AJChGl7tEUxNeQiVT52mWVD/LQAEh4bwOgtKd5BYw7PA0EMilwtVIiQE6UjK5H2Ej7
         lc/onDEg8auDQm4kT3syKdcpplyTK4IWxjln2vj74cUQxBRzeRTMRx3GOex37fqcr8WB
         xM5sIVX5/VXla14ViwIa8tTdxZdS0sBkPu5W4FabJlol7b2WcIb0tXUSOjcua7xqlwYs
         aWUz9IpdyAs4DvbbXha2n0jLUqq/87laiPYsMh4gDml7+urbQA7twTyjf0f9Gt2jWRZ/
         McIG/FPtQRZoeW4bzS/KDQbENQLoaC3Dq3uuFkHBBtPJHeCz3DIvjCIom570ccsuTXWJ
         ZzZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852643; x=1795457443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=x0lt4j5h7o5ZOIupC6QpocZBfmv8wFzUHnqEUjT+qXXHs4fqM/212o+JPya3Ne+Seo
         tLIn+ce71Roeft17QbgYTLYZCJ0+SlsLtt4o2OLm95aLJ5VyGYDhMzriK8UdMTHsHNnj
         8mTqTlr5/Ax8I+pLOcrqBMRwU57PT7keOGJO4t4tmQGJKRYz/1wZ/uaK+JY6cLy80yx1
         pkobwBcMhURP6h4GfSR12sTX8GLQ2Qvn5juEllVfsWcYtDCP4X7X2kujH+BqvT2pv+Ny
         N7Wj9fipbTOHczIeVSeB+l1xH0/w8nez4g0GJUB68vMGCquO73GzeOY0af50BLWOXJ1z
         6RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852643; x=1795457443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=g8G4pXomXr3CVyzWTuyZx77hshqngL8aA0yJYVNbt3O/SAnnGaETPKmJMRwgnj9yvl
         g6JwUPRIkMaRvM5bRAhsFuBRzq/hqk7g/LU2RWYVQPwczZXWp/LajAT07Dy+A4YyG0Cx
         TlTgdrceVnlL5Zfb9rlyf2t0ccf/V0UBJWDjeeFdr6YMm7dtm6DrJOQ7EBYLd2QhTXga
         3d6lHFPJWSA9lLeO+Y84/lKVhXuTFfc7dyIaZ5p+OQMQetqBQT2Yx2nSUNRItSzwuoFA
         Uw8Z+h0Axf+IZPVeOlBNq2D20i9qKt8+ls88hvIx+w9DbTyMstO7zUIJaTPTHuwv2om0
         hTMQ==
X-Forwarded-Encrypted: i=1; AL+hErFKnBYqj+rphAihoRaiQhBXXjgorCCozk12qhn4N+aiCv00r0yyppM7DMD6DWzLYn8GphMm76Ndg8DE7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+512rrIRKx+W5M9rWj5K/lTF3sIH2sj8OrkH3zee9cF34KDqS/
	Wkl7XFQUZ7r2SQT3vzzX9LZgz4vB3wvkmsPD+Fq+9p6GxR4OV/oQcTdv4JBSnkHEFkWCgJIsFtJ
	2YiGQYpwpb9UihtCVtPl3oqvGUxwqkjQ=
X-Gm-Gg: AYBFou17YtrhEIJ0X/fUpkTOeD6r/oD73M4PoRREv+dEd4bi2or/9OVObE8vXGZnHnU
	O2dMMAvQ8RxtjXgn038B6vXjJA+mK5EC0TODkK7OfsQppkItjzIN5EiA6IJi+nkRKPE+/j9E/El
	0YhTWf+BhNul4FaRFjaVVFT7lSIc0FM3Wks4L1kDke2mvCGIm/XPIMMaXVGt618KLD8JHRM/ap6
	OGh/ws0f9Yh9PFuYlx8tU6LYxPx8mhoGIBc+lPSj9awteZ8C8eGqBYDG7NFJfCPC7aoRElAnyJk
	bGDct+IBYxad0J8kXiaNdcM6kz1ZdEFBMPC8ClDZkt/R8r2KgIciO43QkaM5wvYwTifgqrN7Ylh
	ER+1A+m55UnNP8MyIhOPpWmsGvUfa3cI97OMO/sMrS8/oM5XaXFHQK18ZFcNte3Wvo3rzKeGrf0
	ARuijwrE/0I+rwRFMzwXWCO+r/3zlA22Ys13Q3CRdkgNJw
X-Received: by 2002:aa7:c4cc:0:b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc27a9mr6612692a12.22.1794852642773; Mon, 16 Nov 2026
 10:10:42 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114184720.373178-1-renzo@cs.unibo.it> <20261114184720.373178-2-renzo@cs.unibo.it>
In-Reply-To: <20261114184720.373178-2-renzo@cs.unibo.it>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 19:10:30 +0100
X-Gm-Features: AclHuK-3zf0u-_tVqqSwOuwnlXe0JuQIB0eE-s6YSpQo7rK-ZYPGihb4jDlFOAE
Message-ID: <CA+=Fv5QPMYffznpkrEhZ3pMWtpHwNUUa3OaHxLexu8S47a7tRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] asm/ptrace.h: add instruction_pointer_set
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Davide Berardi <berardi.dav@gmail.com>, 
	"Dmitry V . Levin" <ldv@strace.io>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, strace-devel@lists.strace.io, 
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Renzo,

On Sat, Nov 14, 2026 at 7:47=E2=80=AFPM Renzo Davoli <renzo@cs.unibo.it> wr=
ote:
>
> Add an instruction_pointer_set function for architectures that do
> not currently provide one.
>
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> ---
>  arch/alpha/include/asm/ptrace.h      | 6 ++++++
>  arch/hexagon/include/asm/ptrace.h    | 6 ++++++
>  arch/m68k/include/asm/ptrace.h       | 6 ++++++
>  arch/microblaze/include/asm/ptrace.h | 6 ++++++
>  arch/nios2/include/asm/ptrace.h      | 6 ++++++
>  arch/um/include/asm/ptrace-generic.h | 6 ++++++
>  arch/xtensa/include/asm/ptrace.h     | 6 ++++++
>  7 files changed, 42 insertions(+)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 45d1229344b6..1a6f073e892e 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -33,6 +33,12 @@ static __always_inline bool regs_irqs_disabled(struct =
pt_regs *regs)
>         return arch_irqs_disabled_flags(regs->ps);
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  /* Syscall emulation defines */
>  #define PTRACE_SYSEMU                  0x1d
>  #define PTRACE_SYSEMU_SINGLESTEP       0x1e
> diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm=
/ptrace.h
> index ed35da1ee685..0a121f6e3bfc 100644
> --- a/arch/hexagon/include/asm/ptrace.h
> +++ b/arch/hexagon/include/asm/ptrace.h
> @@ -18,6 +18,12 @@ extern const char *regs_query_register_name(unsigned i=
nt offset);
>         ((struct pt_regs *) \
>          ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #if CONFIG_HEXAGON_ARCH_VERSION >=3D 4
>  #define arch_has_single_step() (1)
>  #endif
> diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrac=
e.h
> index bc86ce012025..6e8a8f0daee8 100644
> --- a/arch/m68k/include/asm/ptrace.h
> +++ b/arch/m68k/include/asm/ptrace.h
> @@ -18,6 +18,12 @@
>         (struct pt_regs *)((char *)current_thread_info() + THREAD_SIZE) -=
 1
>  #define current_user_stack_pointer() rdusp()
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define arch_has_single_step() (1)
>
>  #ifdef CONFIG_MMU
> diff --git a/arch/microblaze/include/asm/ptrace.h b/arch/microblaze/inclu=
de/asm/ptrace.h
> index 17982292a64f..69e10658d7a9 100644
> --- a/arch/microblaze/include/asm/ptrace.h
> +++ b/arch/microblaze/include/asm/ptrace.h
> @@ -20,5 +20,11 @@ static inline long regs_return_value(struct pt_regs *r=
egs)
>         return regs->r3;
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #endif /* __ASSEMBLER__ */
>  #endif /* _ASM_MICROBLAZE_PTRACE_H */
> diff --git a/arch/nios2/include/asm/ptrace.h b/arch/nios2/include/asm/ptr=
ace.h
> index 96cbcd40c7ce..d120d8ecb187 100644
> --- a/arch/nios2/include/asm/ptrace.h
> +++ b/arch/nios2/include/asm/ptrace.h
> @@ -70,6 +70,12 @@ struct switch_stack {
>  #define user_stack_pointer(regs)       ((regs)->sp)
>  extern void show_regs(struct pt_regs *);
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define current_pt_regs() \
>         ((struct pt_regs *)((unsigned long)current_thread_info() + THREAD=
_SIZE)\
>                 - 1)
> diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/p=
trace-generic.h
> index 62e9916078ec..632d4ce3334d 100644
> --- a/arch/um/include/asm/ptrace-generic.h
> +++ b/arch/um/include/asm/ptrace-generic.h
> @@ -29,6 +29,12 @@ struct pt_regs {
>
>  #define PTRACE_OLDSETOPTIONS 21
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  #define PTRACE_GETFDPIC                31
>  #define PTRACE_GETFDPIC_EXEC   0
> diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/p=
trace.h
> index d0568ff6d349..97b14418955e 100644
> --- a/arch/xtensa/include/asm/ptrace.h
> +++ b/arch/xtensa/include/asm/ptrace.h
> @@ -103,6 +103,12 @@ static inline unsigned long regs_return_value(struct=
 pt_regs *regs)
>         return regs->areg[2];
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  int do_syscall_trace_enter(struct pt_regs *regs);
>  void do_syscall_trace_leave(struct pt_regs *regs);
>
> --
> 2.47.3
>

The Alpha change looks good and applies cleanly on my for-next,
including the generic-entry fixes.

Tested both series together on my AlphaServer ES40. The ptrace
selftests passed on all three CPUs, including syscall skipping
and instruction-pointer modification.

For the Alpha part:

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
