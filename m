Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4C4195D0
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409084; cv=pass; b=S1w+Xy2yMsUUEemM41endhLLvW9ZIx4+H9A+r73b8dKqJxu+0PwI3zsMXYbydi4Y6FEc6HQssAX7zHG/oLWD8ouZpByx0kLD/B/ftbckYqPSbqaq4FxIeoGFLvwgwOo82pyghv41EmFWnOkSwpbmDNr4H9oGdZHsCFe4VceU0vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409084; c=relaxed/simple;
	bh=NzcreaI1RFMvfvimJoOgzCzh1pxXnio4qwyB0Dh8ccs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsZCl8WOVSGh74cwqOXRrh1Z9PgUHUkodUX5taTVt7gq5L5l++Cav3GbRkOlMXhyueOzAClqU5q/oOIC8JK22AoCoG8OYPMmicYXJ2lfHKyvNPclDpZVmHS6N1XHdVgAnEBs5rMol8porlWEh36OnPVm5JjR4vkKpRpSqAm3iAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INdkZyL4; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INdkZyL4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c315a445752so339146166b.3
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 14:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409081; cv=none;
        d=google.com; s=arc-20260327;
        b=TWcmTWEUYRKVmJiuR8pJeeRGFRxiXlrkGaOdO1Gg+r7BGDle1uyuVgWHdOhbrVsw0O
         KczHUh/omfzpcGYnQlpx3VygUQILSpxBadJk/YuO/0no+1otczQ2YqKixU0bn61MX31z
         NqgudPj9USBlWMnH64p2O1pKttihvLVmvVMtvlzbLs2j9nFvKgTrwoSrjCxDb7i8fDyu
         lsqdvIJIWmabwjnvPf7REGhFSIbe4Gj29VjKml79IbRW4Tl40UvGgJQyGdixn4kru8Tj
         ZPI2duD957AJUR6EkqHLu+1/QvOnqJp3qmRA4qCa9EbpeZ84ZyMgg6l2culLVfaGOMG+
         ftuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        fh=LKQE0HwTOxqSx52vmqHp01OA60YNTB+U9zITAxKH1I8=;
        b=L1ruXScJ1w+DJH6tLE1DvlBzopASzBNHE9WMHkmwviMcPbRfzVpRkG//y5cI6HVBi4
         KeRl67RhC5XUhyEFuB/K3sc4d8aVT4Qr4X4ragFxJomVO5rOyvURxVmMUyE75hvFKTx9
         MnONnW4L/kllQf3XzIlBD2ExGls2v8Z8cBIlEhCss/Gyza0NsS7qBzkwQdjJM2SR3NhK
         ZZxr145We6c3V47pXkCzAS7SHlxhztqL0PtuKaJcgCLrUkA7iZmOYzlPmqXt8f2rn708
         0pPEAFDtsaNncARev8FFp7K7Xe/KmTeMD/nkXDJE861gA+1Del5Ew4Vf7/0r4WIrq/mE
         0ClQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409081; x=1792013881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        b=INdkZyL4guxAzfAcKevUe8XHzZ6mx2QeicPqSko69ScnZqAy59xB1SeLhJW0QP6PjF
         ydqrs35E3Qsn0QOpWw2fRYNEdFLEVndLRQeLhdyfUR6yyJW04SgzC46ecPsRmU6aqasq
         aHKgb5ekNeLa58Nq/9GobNmHBTkNlBhngSeVcAuUW62hYTAangN2RELtoqQI2DT+bASG
         OOwBFSwBPuXJy+Hn4CYTboLCl+e9z2MQT6y0MiBfpJQVV7RE6Dj1spNXOO+wZuv3oe8C
         9JiuQ8RSaL2Y5q1ILH16CFAhdS8ltneBtHPKRAOgk9MKW4+K8FT4NYX/uDN7cC//rNve
         bP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409081; x=1792013881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYC06AXxDpIadMdoNjvj9ZAubZeaJFsW4WdTyw2S8TU=;
        b=gInMHOXxrR7EnQfTLUXRJMB5Mu1+AAjzjAQer1KAt+VVyVg5yrXs34QH04GApI1fKY
         qXr1WQCrH5KcXtfEDP+k0sZGAi+iEGWYE44P8CA5z0is6Bs8S+igcL3SuCdIIxvXUWKi
         A12Isujrvs5+MzXOBJfQ6p+7IvLK5Yavsa4o0KcUITOENbaWzQ2VFGgeB/ybOZRA5xEl
         EzHuo/f+YJroibxKbZY3bUxR9Cdk7hEWSiM41PxXkVYtJuZE9D8SfP1FKGn6mVTnwxJE
         N72IWnstfjt5W+elKh8zLF5LfY3RlwwWcuTvBi1K6WLMyMppUfwAflK8t3cG+TJMEwEp
         jB6A==
X-Forwarded-Encrypted: i=1; AKwUvBw+E056z6jZZVZQlubeBiHv8p2Jt+eZfq4nntA2WsQ88ZbDdbeUVpb6hQpMfZU47kWIonzbliS2jdGdAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVgOxtXUc5lVsQcVUbPXjNlQcjM082bc8yXV1FPIXQGcd9hELn
	+rXjWww1xbEFZDbKvLDm5m88x6JTrhyaMHkeg0oExC2WN/gdEk04tHL3gJaet9bdnv588guSQBb
	owhFnlsZSKBMjYtmZaWD7Rh4oZ5CkvrzNqXXFrv3swu71
X-Gm-Gg: AYBFou2OCcqvT00H+sFLmnrmRRIF3lUvzidHQTZGyw/1IHILQ6Jf3T8h7vq5gAbfhCg
	r99CvGfbrLm9EQYSp2eAxd2iFyW5lkQsozFwcP/hKL3eHkNa0WrpTAWcXKhi1RwgqLA4P4z3zQe
	Nk6WhJwezA9y38W4EuUqg187hCVDQBxnOGPwNSTqSxVsMCXyWimVPCuoEcC11ACpuMlNdz9q0Yi
	FViwL4u3f740J+zET+WL4iop66FDDECj72GjzOUJby6b0lquCMsXOjG1QznNs6xjqfR3TEQspUy
	fFX+7Q96ERbRLK77diNvQ7Bu3nC2ol/SSMjzW92c9HeuX3GTobNjEoCxgSN4Qi3iv0xIzU6/yff
	sAiOzLvy37Exmc2viQA/uHCvrTgJw6/CHJE1pypGkRPxKVww/fLXymqpNmT9fn/HjYrZLgpkZBb
	yBEhg=
X-Received: by 2002:a17:907:7fa8:b0:c2d:c534:969c with SMTP id
 a640c23a62f3a-c317bda9b83mr348405866b.21.1791409081382; Wed, 07 Oct 2026
 14:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007212314.969336-1-voytikd@gmail.com>
In-Reply-To: <20261007212314.969336-1-voytikd@gmail.com>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Wed, 7 Oct 2026 23:37:33 +0200
X-Gm-Features: AclHuK8dWWKZmSjpIJHYzCSo6w3ggm4kF9-9AyeDKpnNH8fVKUNw8pXnfrlN-YI
Message-ID: <CAAX90H2mnKHb0ZEpEgqOkjHU0y5maUbevYuo17gV3BtmYNtbdQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: remove a duplicate line in Makefile
To: Matt Turner <mattst88@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Kent Was <waskent6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, forgot to add Magnus Lindholm <linmag7@gmail.com>
Link: https://lore.kernel.org/all/20261007212314.969336-1-voytikd@gmail.com=
/

On Wed, Oct 7, 2026 at 11:23=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com> w=
rote:
>
> Remove redundant duplicate line.
>
> Fixes: 234306038064 ("alpha: Fix bootpfile and bootpzfile make targets")
> Reported-by: Kent Was <waskent6@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222101
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
>  arch/alpha/boot/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
> index d8dba85e606c..1ac823d93801 100644
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@ -99,7 +99,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FOR=
CE
>  $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
>         $(call if_changed,objstrip)
>
> -LDFLAGS_bootloader   :=3D -static -T # -N -relax
>  LDFLAGS_bootloader   :=3D -static -T # -N -relax
>  LDFLAGS_bootpheader  :=3D -static -T # -N -relax
>  LDFLAGS_bootpzheader :=3D -static -T # -N -relax
> --
> 2.55.0
>
