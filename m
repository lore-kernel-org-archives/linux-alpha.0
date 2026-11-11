Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382814;
	b=F003HVd4JNi19Eg1J6cUDQwrn9WehsYJybU9fXzRHzNNL9p2fvl+TsJ2ngItHIDQGpPC
	 Wh34ot6mTFy3H2frscvbkPUi7OEeMY2gB2GPja5ixq2bLhzNJFTdSMPoEa02c5kOvVM0C
	 dNQO4Oonyvme9c3iloDd73dweJgpCSCA+tbNJHHe4MEcS8Yb0mUtqmgq5OnBRt0aa9XoW
	 aeECVyv4zuq1KtZ/umQ2Ujc1TN9Svn8zfrKVDlDqk9JBhjzkArxOa4U5uzb1qQwaxAdY7
	 D2Yflu5iypesQrCcPSO6yk1yqcV2nCy7FUZW0/KooW4bU7LxReA5sTPNOL7Clb9luqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
	b=N9om+EosqiMU5zF3JXJekXu2zhru51AAwwszjqmrShAX0SjFdFgzO2zACupXKpHHQya5
	 Zar9kKlkJfJnDhbJjJyjF1JnO2Wqjwj24QVpgxU1hzYCPWDIvLDrwNO+jaI/IROnx5mZ/
	 osX//yf1yYbjlr1shu2h2BAELb+GvaCHAFWXj8c9xUFJBPiZgxPJe8A30n2BK/sPgT5G7
	 ypeZ8XMErsr6xAy7KrW3FXueTHL0bIE0DPEuOzHEV+GMuzOzlrdVMwVMfVJMAEulVA12a
	 qwrgDmPltKE4sIMBxHS/TCODiyJT9h5EU5nASfqcL+/yZ05hmnnwYPHJv+wu+P7NiQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591C606A324
	for <linux-alpha@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C591C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1830771a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=bPswj1XigDjZHrecRpYjaeKejpX/+gTVUXRd40eM27eRa13q5ifG0VBbFlaARvq7+V
         WMJLQJD3dD5N9jmoVD9oVNTCVOUOO5/PciKiI4ye/SHCiVTDHQeZkO2xjSrj1AWqlnKq
         M/mj9n4KvOd1+fa+cVV1qkqTFlcIlxYanaOSNQxEJQ0e57/Dbdhopxt5/ItlYdJhqF0M
         VWpteDBtgrw5xjhM52sMJgfTfTiVvJmcqLtESzm8dF28yeC0xbOH7G2Zzn0dLiM7JGQq
         2mLgIatxsthKXl1tOgtamhrdPXUhVHuFknpEDAVwP7zBKxIDJjU7JXksYRrA6B6DHzJ+
         pkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=dzjrfAFb7j8qwwvjSWWZd2FRbsaA/9CWw9g3zUineYs=;
        b=OU1JouE5ATyV2iSdnGBF7xptp9lNQve/VR9SDW3FOc7iK6I6ufR4PETS/PGW5ZGsta
         0AojBDpvba8Z81F5Qw3sceHjoSOauw/J8P5kXv+kiptctMW/I8Q9mXVUNVTjKx+LiJjX
         ai7daQmgDBwdxZ4Nr3VSoz69gnwbrRwK1dFSRrxq8O1TA5QptQweGiVaPKYLRAa1ta5c
         2qmU3492yiGepSH0qhgK24SyqMwS7qGBIfh2VURIcKoP1FqgTwj5L5ifu6WeV6BSjOIl
         O6DI2YaG1KM7ZITEJvKcuHTxUOqsp/M1RCAiLMZnsj3KM7r1FyCxy6bvlMOjwUrI4Dfo
         8zHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=VCD6QF64cq+6EajKVeH2KGvi/U5cBgOq2QaZUPujN9TUpScC8tW0bSWQt0oDUSy4JW
         S6Z8D6nWlIJvYo0C12W4DfrOkGdol86fJwYUUTyy4O1KRs5ZZZUMVLH5TcN2PkElzTMC
         CDPcO/9EjC2evHTSCepGDSbwuoSelf7KCGcOupsWhHmqIXstiHNkS+oNFTvRiDsE9USX
         LiWsrb9RYjjdGp3t/FMvX1MXOCXDbkNCM98PDcj50ceTD5evbGSrKBzvVmJsknTflsiz
         goYBb6lxDQzfivXfrbKsifTYJfLVgLYCutTWcyI9Jo7kHyPrf094IrOod562TSGGHij3
         JFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=ZDdPyam0hhTSfIMKos0sgpGo5GtRC0USXZQTXOFMo9adagKlPHOwxYl2lTeGlYyehC
         yck1aTbfB0KNX8g+fTBSy0K2qH9ww8cgt3VCIRsbQXvLMNHTbxrgF5A0Ezy5yOWuhKem
         H/iC7fgQ01T5+e+/w6bfJKBCODVXj4WwrCiPBJqyFWxvacQSYJnBlHE9U1Uu9zfUIdDc
         gfuhg7vUwWFgE27sAGpzimUi+JdDOpGxQUIAouuSI+rjxxcnmCyqt29Vm+JhLCdb0ea5
         J02CxAMv10PUKqJKTR7W0/mOig6fuQyuHs7o/aMRdABX0f/dCOsOsXrlaAgHHdRS/FSV
         90Qw==
X-Forwarded-Encrypted: i=1; AL+hErEH0pBYCK5uv6KT3MZz1tvUCDCG/xFdnDZuigTcOB4dMRkXhtXcMzft2jO/7Y5YYYB18TWSSG19+OBV4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wbSW0V0M97nv+APyH6jv6gmfXd5ukQYqzaVueyCiOvODzFscw
	1+B/KeJVeRxOF5dSK0TpqyZjIoOEUukPTHisodLPnFmQ3PDrxCmjSKhlihjbZ/6r1rnAxIUK7tm
	lDSypxm88jkcYL7ZTXQsCIpAIJ822xW8=
X-Gm-Gg: AYBFou0Zjza+qpOqbvjMQd6/Ok5QbLySmFDDpuOnQs39OxR5JEXgaRja6P+VAnsO1tE
	eSwTp17MWH24XmM1JmaJS/0qtAuO92xb4z7lxdJGpMrf46BCwlQnjL+F8B0Pd5VA2m5mgSlAVeG
	PaAXlnnqg4gkT9jQKjsdtMSsj2LIlAJwBAQrbfESXIWdQQmPKwDVPD4iAL00sXZYK6AreXqaN0I
	FwECqHt6HYN5YvV72bt6+/YC/lpV0i4awoJpU/9BqVRbDD0a27xmMqkQPJkFmGCV8oCgi5zsxVJ
	uzaVR+8y2V2tD40H7M7e//ksdFJvFuyOghHgNqBRlydsXFz0QsyzX14p1I1flw7dIxX1k98J4dq
	q3oBRK+DieFUeATddRcHuknSky7TMIVPjUbto6+YAKLpe7yELXkpcPzY+wh2UlxYUuMcyaQ==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus
