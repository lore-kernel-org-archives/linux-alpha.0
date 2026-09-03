Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA5331ED0
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475936; cv=pass; b=GWtnYE+fAT5At2O7Lf72SWKpfMpgNT9oqzrLBSo9SipEivPZMHv0D9HJvS77fUikojVcoAmKL+tp29BlXUC7NRyNPXyAwuPstWUKE3psQwHKfUpnorz1fFFhXL9LqGeKpfCAt9JWgxCoSKpRro6/0v6hM/Zegk52/gavwITkiL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475936; c=relaxed/simple;
	bh=ZmPc4WmPQ4TognNj8aZb7s34rIht8sNcA+bzZjKGR8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0V0avB9QJoVj5ksF6h3P7PNKoEhtAXD30pRiWPKazxIlXRk9aV9OysjOLU/wtuEPhL9JYbXPR0i2iSGZqczPqQnZkwmg65/tUlfrXGLt40HUnDujOPyFVkDTdb8MSLEyQUbrEYztwJ/P45WkBE2zj3C15n9NWlwprHeAbpz4UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVxKceZA; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVxKceZA"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so435416a12.2
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 15:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788475933; cv=none;
        d=google.com; s=arc-20260327;
        b=Krw3SfrEsQkzj844vdYSiYYkfM/ilrbmHOjQlZhfUb5+7AEtO4lyL9TbBmlwhbYKCY
         Sg8vzBDHdczeggfSytijLGV7JAyL+UKumGthhYst2g/aavICQRrwUDgPqMylQ5yNCz0E
         kcF0TyQAngu80bq2AdMYjJE2+6UganNfDCOXIdvlmLo57kgwdaMA4a0dH/XtvWNWsBcj
         5xBT3bUGdcek4YxWrSnsRdkvFozSy0sPqAu/DHZgxjorU/1AH2z4QZnz204JJNAzbN05
         vQ5cKyWbTNQX5I6thmeN3YqkC7jkHERQUfZuBxxUl3MGf9N8+dSir8hjZLViJ05z4SNO
         41Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=msmcuvuwrG/l0PFUeuFroJ/OtV64gKmXDPb0HAUDMySq/wMhtD8sOThIUH5Uy8jk37
         aXSoPKBX4yyuTpzL3+QKJ2xm8MrbqKPShT8JZvd0WxctdCPi3+FimlV0roZGiTuqPDc2
         caBh7VXF9+f3JTsVS5OFn5UzVwIEcS0KTlJAGI8uF7syLDZRq35VpbEhAiHSMXCyHZ/n
         JGSBTgtLLxqgmJX3Ddin2k3jz6JKYlgEtnkFmPSpJPwB876gJaRDYpzFL9Wc3lPAcSEW
         1MO1KNmNbHL9Xw7pyWOHfK4QFjkofLAiceHToU6hW7Fv1GR8qEpmrZgJGSfsKxVLd/tk
         Qy7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788475933; x=1789080733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        b=GVxKceZA2EhY7KqBOQRdsmedgtUa/GRLBldto00lhJP4fwLd16jqvyq83QYKNAOY7K
         ltWD0Yh2OVua6Z0MgoOMF9I46KMy6ylwj/zK71KqZaS0ULXKxBNtH/Y4Z+qq07wTT3NU
         Q+AdwD55UITJV5hnPq6pih7zZwldtBo5nDz8da0Y1jNNfBlNR3MvdKK/Siku1kfmiP97
         R7nScbUiYfN0K3Y5OFEcXQOQelpPSjS3AJQUWyrCbETPoDKZJF+zVO/2k//mNE5QA3Zd
         VYwEBLfy3XO7HWWcg/z541GMjAGw8q62KvJgZw8fGxLrWpsP+1qZhraph2VQtqgTIRcQ
         E8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788475933; x=1789080733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        b=mhip/TQiVPj7jYA4E2+bdYZuE4BbRtDAxnRP3gmGDqu5g6SjTkVJiUoQ6kYLtVzqGy
         MJnD4NhVTMREihxmL9YmnyliVfleTyV/+hfnugjrX/axH7klFh6oNvsVGVdY0DmhibzU
         eAolEgG/FtoVz04hfj+80NhlM+pi4OmRuYZIOtDDR9Qwfjlk/XxjKOy1iDvH2MwKax59
         M/s9eEmLqhpQ9QHMYVF4nouW1xuRk2smz8MwU+EaGkyA45jEliypxstw/O0wx4pOfmud
         T+OTqnAHpbE9mhWx0x+J6CZFCk0K0k6z2sqmisn0S7Rz4i5Q8YLpvaGjX6i0cb7gLBx3
         s9wg==
X-Gm-Message-State: AFuF++luEqjWdI/ewcziLl9RVOvcbD3QFXYo80w1WEwdKTB0wJNgx0nD
	vKGi3mfd7Uk1N936kA+j1lb3xFWdKdCcO9747wypYXGxafTnBwsVWESgwiPbR8YROw7LIePKRo2
	67hqtSepxPb16WQi6M7SATG8nHtZXDuc=
X-Gm-Gg: AYBFou1yvLEN5BZZu00WBBwG2RCi7eUcoOqVBdM4JWicLDdXTGL86F6oIifl6UNMXnp
	KQzLrhogRysFELnBbm5/0YawwcLL+qppjTSirdnWe4JgSDXa+Bc4kOjjUe/Zt0ixIFbmR75ws9Q
	kC3Kzpvwc+VEbSviyE53O97eaDA2hhqzlPn2RLaUv3+I2ne+TqPvKZ9gxiX4DxrY2uAgdBEpfg6
	HKQRtES648iM/ggtZSBUGm+Ym4NgF2ro2F9P4PAdcobfRKJYSaUrcps13dvi0GGEApqIErAnomb
	67KpzmIrKgDAfuxNVN+rVHMx+CkRHZbCWomrkeGfMruRpMuRkW2qeMFjuuikrcvZQGBltw8Dbui
	bnrxlsaUa2UJ0v9x6H1Z5unByW9uZHsQ=
X-Received: by 2002:a05:6402:210e:b0:6a7:ea53:f627 with SMTP id
 4fb4d7f45d1cf-6a7ea540c64mr80938a12.38.1788475932683; Thu, 03 Sep 2026
 15:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <c3f15d6aa4553dca5c79a4c587c7df0da6cc95b2.1788277742.git.mattst88@gmail.com>
In-Reply-To: <c3f15d6aa4553dca5c79a4c587c7df0da6cc95b2.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:52:01 +0200
X-Gm-Features: AcwNN1Uy2v-ASCgUPQE6KQyA6Cx3iDZPVRSJ4sK-RQ5SG8pj60gUcCoQ8GqaZRE
Message-ID: <CA+=Fv5Q_qZL5q4JEDJkteD_LGM0-f2wEtmBncnGANywJNiOcNA@mail.gmail.com>
Subject: Re: [PATCH 15/24] alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> CONFIG_DEBUG_VM_PGTABLE runs a boot-time self test over the page table
> helpers: the protection bit accessors, pte_modify(), the swap entry
> encoding including the exclusive marker, and, where the architecture
> supports them, the huge page helpers.  Alpha implements everything the
> test needs for a three-level page table without huge page support.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index d7e2859aaedb..87fe81bc4709 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -4,6 +4,7 @@ config ALPHA
>         default y
>         select ARCH_32BIT_USTAT_F_TINODE
>         select ARCH_HAS_CURRENT_STACK_POINTER
> +       select ARCH_HAS_DEBUG_VM_PGTABLE
>         select ARCH_HAS_DMA_OPS if PCI
>         select ARCH_HAS_FAST_MULTIPLIER
>         select ARCH_HAS_GCOV_PROFILE_ALL
> --
> 2.54.0
>

I applied this manually on top of v7.3-rc1 plus Alpha GENERIC_ENTRY v5.
The Kconfig hunk needed a trivial context adjustment.

I built and booted it on a two-CPU UP2000 with
ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM_PGTABLE enabled. The boot-time
page-table helper validation ran without warnings.

This also appears to warrant changing Alpha from "TODO" to "ok" in
Documentation/features/debug/debug-vm-pgtable/arch-support.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
