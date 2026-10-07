Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6D37BE6F
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410271; cv=pass; b=Cp+jP03gtZsshfDWpgA667qmEl6Nzn0EGqUFD4Qd9YqrCKmeQ/mVYqF+Nhaz9Gy6q0czsu4cPhhp4BIbGvyBW5VnLqOIOOKKvIedUaq4jkUAYhDqS/Zhs6V6T6Pt0gqk/69GSQ5ceupFlV4MGgizKvEoXxedD+8FUmnipV2ZrNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410271; c=relaxed/simple;
	bh=jQIxQoCC1UvWTnm6K9i7NwsQ4oX20QZNx7RCZxsnUqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7KpNGfAg06at63gSBkI86gn0vdWRvj656IHLVfwPql2PVccQgR66Gm0dHJm/uQMapRaSgDf1WwRqyMW//ejZGPOuwtwZSFbE5nOSZs6k7In6TEIGdAJlb984UnIsttxucYL8Lin3FUTXYxn4x5Df0661FYdQ+Pd84G0VI2M59c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMqWumMS; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMqWumMS"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3650903a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 14:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791410267; cv=none;
        d=google.com; s=arc-20260327;
        b=SKNnUg7dM/gOq4+pGGi5BZ4c8CUUQ+oNJsLb4QdXs7U3YXCtRIPg+Y6bgaudq2upAl
         NmXIcgo7aibflHY+M97F78cv5VLrAYg5HLsLUdrk3JwdZk75x/Lj2fjx3nJ4sTLTRZZP
         wC3oymDjIKigJi6P/7wumiVxvlt7+lizAhhfR4zmmCyOh4tbI7rbB/thWyZcVKn8XKJd
         5L25v2QiYJUBtS0Oc5AmugADneUVJaUiGz5dDGhYuIGyksulPOhZMyPy7gNv/2g2L18B
         ckK/zdH+iZzjFRFXjWZ7sabhjUpb3554BTNem4PaOSjDFZitKNtvzcmac6TUHXD0tfRN
         E4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        fh=R5+zZ6Itp+9l7w5cPrrxk3gAhi7sHq08vLOJvRgPEzM=;
        b=iEJeNDbs2ejCvyK81d8q6xEP4ysybwcG2eb0jEB0pZrEz8h5hSjx/LQWIz+3o8S02f
         LfDFXzhma2DO6B+B5RESedclXHEP18LZa5hTmkvr8zoiD+IdA6r+ESYWJDflTOmKH9YN
         kvXajUtZrBhRvd2OKeQZyB+uGV3/U2iIPkRveKWB1FdEJUNJQld7n7ElwZWOPWE2Gg84
         efLUo9OZvmmgRL2FryhVbVVE1+j2Orf9dKPpXqHT4suQ2xFHcCbtBIX7Rc+4gjdeDDvY
         eh1K916Bq77cIydJKw2aKkP3ncoLVjBqJ+1Sj0aeJouJZAxEJDJNs9x1o/msBl+PtxEz
         FjEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791410267; x=1792015067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        b=RMqWumMSX7VswfE5np8HHb2rkTIIwLlAdwau7THDKOntyEqWqjqlFp+eJUSmwPZynh
         rqxTzQOgfuvPP9YzNHj9dB2+N3XO/Pc3HOGxd+dU+z2aHheHGqzgx0wA8/DVU+TTdI2H
         jOIemkjCRJtU3GFEzzmUnp5kCKBXO5HIHxcldTsIdmZHTR2gZGXx8Y5caBDEpGTdx0Wl
         zYg1hBG1VTluuPTKnTH2UzAkJG3tZyQxm/W3bTEvhs1rokkzwO5hSsGFG52oLn2TXiQ4
         e2aBgYlPuphxk/WZ/GwqhHO12CmyfdciEbAspaS+Gu6Ib7YAgwFwZNUakj72bqw3gkv+
         f8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410267; x=1792015067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        b=LP17blp9J9wmuCPc+OvIl0cCVgnjS6ahBhXyO6ie9Kc+Y14cjp7cbKpNognZWJrnY2
         cegr1vq4dxLVHCV/G4tUC/76UHKnR2DJhlwsFP7A+2lxt/yHejiiY8/vfeAKP7jvWvqP
         56R9wAiaeeKpHw/6yLzL/5ZqWEiUGcsglKp0Fa/ZC16mLNS8PTIauU98T9LxD/v+XPnk
         dkn7gfzPBsDjnaST3wL2Ui/WLlvODiscH1uRNC4t28ILWCqTtbXGImHSnGuuLl+e9qWA
         RjkCukUzM0JVuIgkOLNgNWOIrkncRPa3UqVDZCLyh1rcRXcPFfUKRCJAr5ZABco1bexg
         xj+w==
X-Forwarded-Encrypted: i=1; AKwUvBwXjLmriOgHEy1xRC+kPwjq8AF0LDL72hKOOLlHGdc2Yy4K8WmvGDcn1vlVAfq8FffZ6EDE5QTckkZsSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSkdMqbY2DM7Dtc6rRvKiZcXPwIygeS2u5v1C8REZxPuKlUjwJ
	taaRSMqBAW5rmKg+/2GhTBREzAgD5F/v2x93TpVF/cEGkrk4as3P8LYcLiGJ/hhyVpO6a2KzT9J
	JJcpuO3mkMdqpUGIqzDdWhA22aEfCJxM=
X-Gm-Gg: AYBFou3W7r2lVpSuoi9XK4U1uCWmPBjAbwso55Mb6cl1JZMNb49If0F9vFSeEyf4TNm
	4Sxb9l/z7U+GB/a66f/QaEhWmPTeof7UZOAkJqv9RueTZsSFlg26/IPtG8ybRetNoJAUmw0bLu9
	6pOhXWnl4aJz21DFn9jPMAL6ePEcJVDh0evnrGTJQPXrYY3yY3UMM9A4ED3exafBkpwAX26ds9j
	UE4MFEZRzEXyapkuIHWhNDfybiRSpPh9KRIqfBz+F+B1ZNaqlKWonULZ9Tuw+WjAkQG0MWWI/k1
	dJvzBTgEJDmxGgrMOvpTdTvVGp1tdncrNKoAFtcxjbxzmSon06ledPTzGzYhCCVlzZHXhXr5obw
	CR8Ql3Z9r8dURJpwJS1rFbQdeFx1LsquLJT7FfeIk2g==
X-Received: by 2002:a05:6402:2790:b0:6ac:70ce:ba8 with SMTP id
 4fb4d7f45d1cf-6aff454cb04mr3301679a12.35.1791410266690; Wed, 07 Oct 2026
 14:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-5-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-5-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:57:34 +0200
X-Gm-Features: AclHuK-ikuydpyluMIED3CI-KY7xgeSn3P1vkTE8gwFcrFveOlA32P7iSrQWfvg
Message-ID: <CA+=Fv5RQXOQML5UTcWMpz9WNqHjEVN59jDaX2QhLs7cUhgOb7Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] alpha: align hugetlb mappings in arch_get_unmapped_area()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> hugetlb_get_unmapped_area() does not align the address itself; it
> delegates to mm_get_unmapped_area_vmaflags(), and the huge page
> alignment is applied by generic_get_unmapped_area() and
> generic_get_unmapped_area_topdown() via info.align_mask.
>
> Alpha defines HAVE_ARCH_UNMAPPED_AREA and supplies its own
> arch_get_unmapped_area(), which never sets align_mask. An
> mmap(MAP_HUGETLB) with no address hint would therefore return a merely
> page-aligned address.
>
> Pass the file down to arch_get_unmapped_area_1() and set align_mask for
> hugetlbfs mappings, as x86, s390, sparc and loongarch already do. This
> is a no-op until alpha gains hugetlb support.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/osf_sys.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 7b6543d2cca3..61d806176213 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -38,6 +38,7 @@
>  #include <linux/namei.h>
>  #include <linux/mount.h>
>  #include <linux/uio.h>
> +#include <linux/hugetlb.h>
>  #include <linux/vfs.h>
>  #include <linux/rcupdate.h>
>  #include <linux/slab.h>
> @@ -1201,14 +1202,16 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __us=
er *, txc_p)
>  /* Get an address range which is currently unmapped. */
>
>  static unsigned long
> -arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> -                        unsigned long limit)
> +arch_get_unmapped_area_1(struct file *filp, unsigned long addr,
> +                        unsigned long len, unsigned long limit)
>  {
>         struct vm_unmapped_area_info info =3D {};
>
>         info.length =3D len;
>         info.low_limit =3D addr;
>         info.high_limit =3D limit;
> +       if (filp && is_file_hugepages(filp))
> +               info.align_mask =3D huge_page_mask_align(filp);
>         return vm_unmapped_area(&info);
>  }
>
> @@ -1236,19 +1239,20 @@ arch_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>            this feature should be incorporated into all ports?  */
>
>         if (addr) {
> -               addr =3D arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len,=
 limit);
> +               addr =3D arch_get_unmapped_area_1 (filp, PAGE_ALIGN(addr)=
, len,
> +                                                limit);
>                 if (addr !=3D (unsigned long) -ENOMEM)
>                         return addr;
>         }
>
>         /* Next, try allocating at TASK_UNMAPPED_BASE.  */
> -       addr =3D arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE)=
,
> +       addr =3D arch_get_unmapped_area_1 (filp, PAGE_ALIGN(TASK_UNMAPPED=
_BASE),
>                                          len, limit);
>         if (addr !=3D (unsigned long) -ENOMEM)
>                 return addr;
>
>         /* Finally, try allocating in low memory.  */
> -       addr =3D arch_get_unmapped_area_1 (PAGE_SIZE, len, limit);
> +       addr =3D arch_get_unmapped_area_1 (filp, PAGE_SIZE, len, limit);
>
>         return addr;
>  }
>
> --
> 2.54.0
>

I tracked this down and I think Alpha needs this since 7bd3f1e1a9ae
("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags"),
v6.13; the same series did the equivalent for the generic code
(7f24cbc9c4d4) and for x86, s390, sparc and powerpc. LoongArch, which
also has its own arch_get_unmapped_area(), missed it and hit a BUG in
LTP hugefork02 until 3109d5ff484b ("LoongArch: Set hugetlb mmap base
address aligned with pmd size"). Maybe worth naming in the changelog,
either way nice fix!

On the UP2000+, MAP_HUGETLB mappings without an address hint come back
aligned to 64KB, 512KB and 4MB.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
