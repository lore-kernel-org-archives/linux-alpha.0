Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04803DA5CA
	for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835134; cv=pass; b=uod9UXwx2bCNxgqW5D+cXM31RzlV2dX5/SzVi7v8iVfiSwwd3EOgOLMu9Vv+y6stY2FC7p99rn5Eijof7UeO5oms3DTcnbtq+0nmcarHwJJPDQEeoRCdmYNNFTRwgcEoES1bNv/gDxPlAS10hyRRXhoGS2jbylA8Y8K6G/ANLnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835134; c=relaxed/simple;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfousxzQ1tTsDm853eZKZJTNjoqg0ROqdi1J493WxRwXVQBIsM9JFkJMOMgLx8V/eFa3PPHYR26QugmvzBJ3hHxX9rF3gfv7mTaHGePeUa5r2jIUuAyU8NDlF6fk+O8KhzYBBoqfRtGmh3H6PaxngA7pmvg5E5tXIv67ZNfjMeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=cs+zJ0r8; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="cs+zJ0r8"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271257ae53so9590777c88.1
        for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=emKn1U+S1gYsHcuObD5SvmvgXjSNCMtH52W6pYfeYHLjy3mD2x7d2Kf2yUoAdzzI5e
         64HA94vq9xJ+bQJLMAgjsmLqmGCN0vSH6pJ9X+gsFqYkxDBYqc8eAqpB6a5gyeVIKINb
         dPR245RxwzM/2TbQMs/2YdFY/rC5fHRBcrJdw//NnQz1eVlkmJLfxLYOZ/g6tdrhMCDd
         kV0VvjqewHYoGLf61QKPeqXRluZltUrBbb3ZwTcjCNK45zrRdGsfqRc9xpyvra9sOafM
         H/Lnm4/zjTYVrDFbwpwEyP/R1lCl+DYFxYIRMTdHMWZ9WloBa/qhLo05nHuqK6JEgvfb
         0NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=J9XdvBJ4DY6Tznm15kVRTiu2zj6+F+uu/vMRr1t7ZMM=;
        b=a7CUI0QBlhoRsS1RZetnSxxsEP98yBv4AwWxJ/ooHnKCP2UaQsh8+arQzjqhBkWyIZ
         EBctru795kgZ3vJh3E2MOo5waT19yMO4pIUbgELkUQOHB10G8s3g1xl91XdjoyXZ/WgE
         Sknf5r8G+j7hJ+sc+nVXWEES7VCijTzU7gdPwTgEyBd8Vyd8AR20exAt7oJPozX7pcov
         V2b0NU6uTw8oPPwjBpH1hcmS4Ch3d0F8L5BS5UTrety6+Vv+oidi+6mOdxxXRkrrNckj
         9zOblbXWmTqo4DPoh/KmWqH5bXMuCvHNsqMnNemWNMZ/VB/HtEztTgV8Dk9dGcsYM6Yj
         Kv4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=cs+zJ0r8E1VxbeERL/6orYDfRzBNN0xV+FBDuuOmam2/EuHZ7scxaUctzZ3REo2LBr
         KdQSu4tLtUeUQ/Am7PGmtjXBLQ/7knpdVClf5erC+tpkhYxe59BfVvuW88STHDIDr49T
         TpKPrBeobAalm+DfnxseCj+mCeyPg4AFXq4Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=tOVSdJcHyU/IKPFl6napZiHAOTjvEJ/FzwWEXaFo8kn6f4cch+kFa6ZxVcj+lRRsZ6
         fP1lrGD3uGgh951HV+usvOlXhNbFfG7cY8jc2SurWAURtax8qfm7fkMRyBsSgdaRFTnl
         X1B1A9WdfnPSIBJ2GUK2Bp0IX5DWQS8qwad0dzwzfeFRiPupu+OrQZ12bZHPGPbRnSRO
         OoxOhhM314ePzVCypAqTs00cVVOwrFpODh7QuTcIs2BNEQ+FRhTIrSqDKRA+XoSV1ueZ
         xIFyPkuMCOkgswey0dOhaCcpGDecLhsyKdeMxABpbgHv3/gw6IY8PDn60+xWdEyJ3LtF
         Hxtg==
X-Forwarded-Encrypted: i=1; AJvYcCWyZG0P1KdXDM9q0B3xsbmU9PKdNfeYOggRklsx6VMPu1ndHWwpntxCNL7r1jK7fRD9rMWzhtHxPP+uhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIX0HUNDdcjQvP2WEcx519aYndP+KO1Eu6eu9rBmLhFtuByak
	B6hNpxhwsSulyT2A7IQf2PQuW2+lCrDyxNn4+/xhgDqft3mo+DXkZxawMDK/cRNU0mh6u794vFm
	nN+bRgV4Tby6RJeNuwsKpUE/dXzWkDfCo/3aTl1ePtg==
X-Gm-Gg: AeBDietip3AVLJ82QhFpGYlLQ907LMSVJnY/TZtzUbkS4gL7/5RIh3TvnShfbql2Erx
	xe2yLh5qeZvvuYgPG3FGh5ZJmvyzG16UF80KGvLVN1AshF2nwSsaCLgTWlwCT8KtnDp2emQ8SBH
	TdwNfXCRYg9F91L40Obu3BBzL12YCKnOYCqsUKFB6S24SbqtKxd7PUJDRpyYnmQlXC31v/Dy2m7
	pcNCv4Kyz8xqKElV99erFnXBJBh4hsH4u0Dtpa5sm2MqYp77NoV4WaxsI19EuiIHJxmi3jaE2jb
	3tBv
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
