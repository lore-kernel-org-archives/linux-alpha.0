Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173545D925
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730142; cv=pass; b=R4TAVRa9E6xmq3y1lL7xqXLz3hyYW6WAnbYaIF51HClyGO+zqjhZmAKhv9LHEJZFvOKtf+qM8VpheE+CmW9Uu7zDNdtwTEWcfMb5IZ3evnjHfcAZaESNXHDJ4TskaKABmaazrHfIw5hyYngnHqO/XRq43Pc018a/YjkZsvHY8ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730142; c=relaxed/simple;
	bh=N7/bXLCxSKzME25oFTCMjTUc1fspZktULBquef1LNnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCZA1lDD6S/mvLMyciLxy/h01UfpmZXmhFu3F61iWYrr4tKLyAuZAlMd6oSjsCRCE7dn/zOyWrDIBQ4vEhuT0HziIzXVrAdUrUiMlgaxk5jNjR3Q8yEcO3CeGno2mbeW/LLvAisF4hX3jQ1/Cunfb2w/8Vwca5bE7Xb0CRMfE3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSIm+ZuW; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSIm+ZuW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so133075566b.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 07:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791730139; cv=none;
        d=google.com; s=arc-20260327;
        b=Uyfd9pUY4GcVoAS87ZtxN5vE/zNYt014yxgrYRbMGjtWba+wuN4MxxYbFfBLr+jW7K
         igfGEZESG/unwYV8ZCURJ7OeIU++2T7UeeYezriZgQy5HceSktedmOVO4mH9PB/ugqRe
         BDBXPHRb8+rBHLUIuJg3FWN3cDzacJPk+PiEO2xDUwAXaKm7WpJJQocaZW9iXqwPhTgX
         JVEzQ3l5D5FC4+8ANvDfnY75+uNCbmsxXVEkq/2fDoCtaix7nnjIeBknx3a7JTNxBa4/
         dhdBcubPaGtTwsfQELSIQkuTuGqfTEe3hZZXS0MD+CPqq8UOMwXOJjKKTlfocPfVYN/7
         /zTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4RkeVc6VkMZ4IMU3dg0M5Mik1yz8UTsHowUxZB7vFDA=;
        fh=7yBhcabq4ZjXKKHaUkfu0BfmYgMY8WkhCa4n73A0LjY=;
        b=a60VoLUKf+ZjaB2bFuIZio9RRHQIT2Ex8UN+43k1EUdhqC+zBmqqbICBKhzf0AhaD9
         XOCFthhQa+ImIwX6XeORkefseaUDz7JQVif2J/n8sq6yr/dwUc/u8cHpL7NVk2/DeZ+y
         nWHQ8ONk5pFqPKU3k1ZrKC/uSSorCepE1fYnK+nRBOp4FGQVin90VE3mWJFKCIJbbrB0
         LPndsILR4QV0kEOKr0ZyfdeGB8+Yn7T9qISuBDEqQOAqf91av2m76dadVHUZzRqevPnk
         FEfv+sru0bKwhjqJnbFxH0Topi1VYJTM3I4vO0mhUNTR8PLpcMIKrz2MHdisXChAxqz8
         lb0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791730139; x=1792334939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RkeVc6VkMZ4IMU3dg0M5Mik1yz8UTsHowUxZB7vFDA=;
        b=hSIm+ZuWJ7GvatqAO/yMWyqLsatlGbn3H3lVNLELHW1jNqe4Qt6PO6vaMgr5MEo7WZ
         bRa4YmFE4fzg7YXJ3AapJS5ZUdIa+LPo8VchpWjdODvbwsvBOnyov9XxlxPvr6l8Vd8r
         UTWN5TQamHBanlyeH/pu6RIffAJKQ+q58OSM0hOsStmMFWkBOzBSbkILb3TQY1b6Dzq6
         c+QEe+euvby3jUReoMel9pBiTAPMcFqCIWD6T2W6kEx0L8WM35+VWMOfNECWhuB5Zrzv
         7ts96nV0xqeRGonK+9PX1crZWfjJLf0UsAvWpjPT7TDyKz0fTO0d6aNCrYlDbN3lyZsW
         181g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730139; x=1792334939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RkeVc6VkMZ4IMU3dg0M5Mik1yz8UTsHowUxZB7vFDA=;
        b=VBsf0dSc3C8vTEDsoyZSu6zgED+Oali2WtsO+s2EbIEu+qSGEo+a00BtkurwotHPb5
         iPzmMoWuS2EcuFmN4yDUUPE0SPpcX0L9MQyvHFehH5OwHXDSXn3D6TNvUViqJMSpKnq7
         sYlSQaiW3l+S0e25PN4GN/nhjxsjhZjZgLODq3b3Yz8jqao+G644wOr+aNr/2+rsdwNI
         xva2ol27TLlSXYx1/66IkFjVOoNIGRCtIRpsCqpS5mjeCdLnK7q5IFQa4zasDlWOFT9Z
         YmeuWNjh2E4wvH7SvUou/WmQ5HPwjLi+oknCC2ANqnzPthis5Hqvw4vU0f/BE4B8ghqp
         slDw==
X-Forwarded-Encrypted: i=1; AKwUvBxZTpeUxxs9sEtvHZPlibfKQo6UsbHCGlGRrmQjeFgIFzwlkJHJ1pzmrLvSaVvRRLOUkvLFWou/Sy4LZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFuEsR2oenRJ9o6KFUUQTce4GaMgKAPys+ODameZj0quw1QDWm
	QyPSaQpL1ewJhg3p33AMmZsD1fD8SZQMwl0FGYr98UrMJRNOyd71+pSTKsOHJmTkNAtWJcoXNxo
	ZOpKyuKh56Mqkr71iVkZB3zTBeyh68Qo=
X-Gm-Gg: AYBFou0yrsg9ymgjoNOD/tdLPCNpwDs6U53qKJt+rJQeQNNJwmL4ASFD40Lx5jqhlz5
	SewckLQjJ8wcuaHAcrY0xbBMK1lR4gdxHXIWXgpzY1MVekPSnGvQR3/56x0nWGiVA6jkyk8teMI
	jaCwFs/AJsnX8x8WjECgHNVQ2nTkkLsi+ZjdbT6s6QANDgSOb4aMij6vK1Cc1wIgUQ4uJaXfue7
	jSl0YCMUg/cW5gamUCt+7QAQeW4UuBoy7hhTU7fC+VHCYGGGH7VQ4royXlUlHjU4l9+uGmbD62C
	T2FzXsyDq6RSUhIIG1q1aCEN65Ff+nKodt1tJKoIN1RSNhaHPAydEgw0MVSk4vFQemlBF7RltHJ
	uf0IqNX+0cuYkOyjvXNzRuIvCz3l+YMzInFN9ZJTvY4Q=
X-Received: by 2002:a17:906:f59f:b0:c31:7495:e57 with SMTP id
 a640c23a62f3a-c31aa0dc6b5mr668779566b.44.1791730139254; Sun, 11 Oct 2026
 07:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-2-linmag7@gmail.com>
 <CAEdQ38GtjhbEipnuTbo1EmzNNAE9=6p3T6MfTnMq-6okmE9-tQ@mail.gmail.com>
In-Reply-To: <CAEdQ38GtjhbEipnuTbo1EmzNNAE9=6p3T6MfTnMq-6okmE9-tQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 16:48:46 +0200
X-Gm-Features: AclHuK_Tz9vD-0GaHu-Hko6cZBr-CRRYjqry0SEF8pHQaIVGQ0ve8CeJLxTsgbU
Message-ID: <CA+=Fv5RTAXFbGTN+YPb3RBsw2s-52oVRzi_HgMuiB4R86YeY5A@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] alpha: load the MMU context when switch_mm()
 switches the current task
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 1:32=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Oct 10, 2026 at 04:24:27PM +0200, Magnus Lindholm wrote:
> > do_shoot_lazy_tlb(), which switches to init_mm from an IPI. None explic=
itly
> > loads the context, so the task can carry on running
> > under whatever was loaded before while current->mm says otherwise.
>
> Two small things if you touch this changelog again when applying,
> neither worth a v6.
>
> The second line above is short.
>
> "while current->mm says otherwise" only describes kthread_use_mm(). The
> other two callers change active_mm and leave current->mm NULL.
>
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> > Tested-by: Matt Turner <mattst88@gmail.com>
> > Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> Your Signed-off-by is last on patches 2-8 and first here.

Thanks, I've reworded the changelog in for-next to distinguish
kthread_use_mm(), which changes current->mm, from the other two callers,
which change active_mm while leaving current->mm NULL. I've also fixed
the line wrapping. There are no code changes for this patch.

The combined TLB v5 and MMU v4 stack has now also completed an extended
SMP compaction soak on the ES40, with three CPUs online and
CONFIG_COMPACTION=3Dy.

Over an hour, all 23 cycles passed:
  - 207 lost-store rounds
  - 207 stale-read rounds
  - 230 shared-mapping writeback rounds on ext4

Compaction was triggered repeatedly during each cycle, and
pgmigrate_success increased by 193374. Continuous kernel logging showed
no new warnings or errors, only the expected drop_caches notices from
the writeback test. The writeback settings were restored and checked
after every cycle.

Thanks,
Magnus
