Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858652;
	b=UFRSg3u+K859yHYealdrxLQ27hOJ7mjuYAJRr+s9AfPZsBHuS5Kum9EfMG8J2h/bjUWO
	 NZOH2ANzFDjQKdwXD0hcq3qKHHpM4JiRcuRtBYzUPMoIsA4dYimpBEza1PuHQffZiPa/w
	 4EuyrGm4qn4PGHGzmciEk7iAW1j4K46sSeEY6K2Un+4BOBicpi+ppFKeQhMLyt4b2kg7z
	 Lwlr1wZcbrKzioLJkgCutARF+2Fq+jZQst9rVrob+AG2oZ8HOjRu5Xmt7cxyrVbL1ZhVG
	 s0jwvVJVOnBuRleOKFObDpesDlFXt7nyA6cYuGg/l+ppvsZ7sgA/GCOznFLZ4ga9dQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
	b=ThzRZisTJHDsYnpwBRu1VntY3+0ZS/+Fv9l11ngFVUGlvM/MU6f+JCubx83ttBS2XcpQ
	 tQQqBJufO6qMXQ+eORwdD1fnCMB4tqy246SbVDTP/nrxOPsRhVMrGCjOI/PQ31wV+bnAH
	 gVRo9yZlDpmyk/TknjdRvrNreZdFg+ZVQ8VbozeF+nmW4SMFiaSn5Y/KDNylI/JWcg1+8
	 T2K6b3EWsxN/HXHsDiC/PNNRN1FfQfgRGQlx5s+TrG1O4UzMuXNddwYYRBmksIqKSv2JV
	 ok3qo6q5aXgrBFO2NkIkDShpN6Q6M2SVXhMQXRnRnsJJQ4LkmU8H4r9mAvi1KwCaEqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a44tx9FY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE11606A31C
	for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 19:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a44tx9FY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so598541a12.0
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 11:50:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794858651; cv=none;
        d=google.com; s=arc-20260327;
        b=mVun4ghLu0zaoS+XrLj5urg2hiyTbL2nb+H8zXmrvR1ZFAngo7jcjj+MGcpmN8tUI/
         z8pWnvyDmSnBa5ysRQLC/9hEfEVtmHOk04RsooFMaGdepMRy6z8vWUecOVKWZqKWISeA
         I9Ta6WrHDRAg6p/gY0R01YOHonh0omkCLaSPFsdAWUZmJC2eAlukyR49nKm8SiJt1BR+
         7iboi0NrChhQLo7bPGtXgugEeq87kRynNln49JlGgqJcpGiMz4XzLXU5z5e/dXD7QvtK
         99Zor/P5LwTCeEYWfey7RccPZ7EzDSb8c7TaUoI0ieRnYaklIljDMKsRj/iRGD6h+eWd
         uqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        fh=cSb8gWp1wLgUhGh7/TnBi42hDxUlljGzTVh1R1zFzwE=;
        b=ojoFo0kkVuMsy7//DnUvmqRkLAEhvRVPamxAeMeg+Y8lkimpayEcV99YfX+9xx+2TU
         Qht2WPxxoL164GJg04vESgqBjrjIahXyCBFONx5sFtk5RI8hYrgNzI5qSLLwKocz0mJE
         cKZ0J7ycLLUzRCY6OKww3lwWbBczYMTMZfncSsYmROQyMnxQtCmO1jYF4kqcFnBIiKbu
         aq+KB3xPscV0CxffEpN0VTuyhfpIvQwoFFQM2NOkExFOQgsoAXeGm7LNx8In7FIwAGSZ
         qppDd2G/ZR4lzU/ZbzHcP6PM4KpS3pdbcH833B15HDbLG0KHRYXaVMNuSrBI6ihX8xDI
         P1iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858651; x=1795463451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        b=a44tx9FYyulYEGe3djm9Dz0e4h/xYE50BzIFjZWY1zKfeBJKRnDZ7tRH5xTHnNkbKC
         YrNy7YuRVwhOfWVEbrk9cNdS9qLZw29MPMsit5oz5tz4efpaft9J5GLu9dExFJgC1GxE
         Fo9SP5H0u8Qh1mGGy8eOrfa8Jb7o4+gCQ6ztDG5atsUt8o8wI4m7iRI1UPAedfyZV3T9
         xYfQM8cLEkGF8gaYfwKGPKxknUriZVosfrn5SrWMrZBgDwvuOk2Up9e6zTMHQuw291wQ
         JN3IyTMeymXNNN+s2nh8650jxW8nzAbS2WkDJriAZsikKVfeinh6IYLIxDHgV1bsJwsd
         vrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858651; x=1795463451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        b=nxdSDSkEXuzexIKe2fEhAUu5plYGz+CzXClo/OW34VstjTxVFZZWL1kYrS9eFFzC77
         I3d4dCiJS4oUpxx+D+/4hHVvheN7LfCoPu7mr8To068P4sX7hovZb03BDH5grFENxtmI
         kIoLGdnEeo8U2X/RH6H/CYCK91eu+ioq3UrD5fSB56ifg953atmCdapID+Z4Hb0Nnb+V
         sAHGltRP9TA+OlPiL0A/22sFwJbo+xLdfTjmNzo6x1PE6bNrLn7WJvy79fBk98nszVJn
         76z751S4WyZ+IsZWrboBTKm45+Gw1AeoADfPH5UHwrxFANxn4AKoURsZBXfZKu41kusJ
         G+WA==
X-Forwarded-Encrypted: i=1; AL+hErFDRxn5CJl2AhpHtjv/Y8mOmcYAnawyVX58KWDp2Qt8RyHVi/TwNjDs36D26dfY+qHALxHmzxAbyMpw+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zhaBivyNh2ia+o8xJTBr8Wh+MQcB8nQENVpEM7oC/gv4HdqEU
	KaGx9P0o+nrlSiK5VOw0URY8P8iUvgT8eNE5I4iWq39TEkYkF4YFDl6Xg20388S2yNYngwinULZ
	S6ZW3AoEPqS+5zeAb3DkHnlVYY5mMJZM=
X-Gm-Gg: AYBFou0WQUODjzFiZLOjYYN6jPTbxOoiIp48XkacDi3Aw1VfPmWV6sQg+A2arsX8jD8
	tH5u0FxjnKWXqSp3oEX/7bXJOFw9aQ2lmw4QXOgB6q1kjSJU1GMlhMoipih7DzkbLnULOGYWh7E
	/Ea3vBOAqi1X8Jvwio7kTx6N31YvABMNHOLq2FXoUqFioX7XZCZ/UZtFqdjy00NazBtS41OGZa1
	SokoZyVl5FOI6RkyMiY0iFKwDSoJmFb6lWV++tVflATLy1aA6cBvoEq3JsyeiDbgpS3roDBtNxw
	fvLGtKc5t1PrXvVhGk8ccExDOOzvkf0GPYUwz1s4HGwvTgmM6NTVOx+5kfd7ac2jd1azWDKk3Cz
	JmvPzLs1rJbgKvLeH3WdtL4kYTd/N3y5u4TerhbPK2ZnJTtmXYD2h5bmq41vMbe5eVkIyjqoWSV
	Q37flaTwy5H+6ewS8ekRCj1Zg=
X-Received: by 2002:a05:6402:2b91:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b859739689mr380339a12.10.1794858650577; Mon, 16 Nov 2026
 11:50:50 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116152403.2672-1-ilpo.jarvinen@linux.intel.com> <20261116152403.2672-3-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20261116152403.2672-3-ilpo.jarvinen@linux.intel.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 20:50:39 +0100
X-Gm-Features: AclHuK_k2jdl-xE0SWqHh40PilxNCJBvLhOeyDjPjuatpm5yQ5pSESh5pEDEfkc
Message-ID: <CA+=Fv5SkcpskpFUCP-qDmP1vWqDiqO8FgSJJ92UvX6jGRfaGLQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] alpha/PCI: Convert to pci_bus_size_and_assign_resources()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Mon, Nov 16, 2026 at 4:24=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> To serialize bridge window sizing and resource assignment, PCI core
> needs to hold locks across both phases. Alpha nautilus PCI code calls
> pci_bus_size_bridges() and pci_bus_assign_resources() separately
> because it needs to do special resource alignment and setup after the
> window sizes have been calculated. At least the former would seem to
> belong to some existing __weak pcibios_*() hook but the latter might
> need yet another pcibios_*() hook just for this single use.
>
> The nautilus code runs during init, so nothing is likely to race with
> it. Converting it is mainly about consolidating the sizing and
> assignment entry points of PCI core, which eventually allows removing
> pci_bus_assign_resources().
>
> Instead of trying to do a complex rework of the code, which is risky
> without the ability to test on the hardware, simply convert
> pci_bus_assign_resources() to pci_bus_size_and_assign_resources(). This
> adds a small bit of extra work by performing the sizing step again, but
> the calculations should yield the same sizes, so it seems safe
>

Agreed. By the second pass irongate_mem has been request_resource()d, so
pbus_size_mem() skips it as assigned, and ioport_resource is never picked
as a window (find_bus_resource_of_type()). Only the AGP bridge's
unassigned windows are sized again, from the same inputs.

That does rely on the assigned check, though: if your follow-up series
starts sizing assigned windows, nautilus' relocated root window
(size_windows =3D 1) must stay untouched by the second pass.

It builds at every patch for the generic and Nautilus configs. I have a
UP1100 (Nautilus), but it doesn't start up at the moment; if I get it
running again I'll give this a boot. But for the Alpha part of this series:

Acked-by: Magnus Lindholm <linmag7@gmail.com>

> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/alpha/kernel/sys_nautilus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nau=
tilus.c
> index 13b79960b4b9..23a74fd4a83f 100644
> --- a/arch/alpha/kernel/sys_nautilus.c
> +++ b/arch/alpha/kernel/sys_nautilus.c
> @@ -263,7 +263,7 @@ nautilus_init_pci(void)
>         if ((IRONGATE0->dev_vendor >> 16) > 0x7006)     /* Albacore? */
>                 IRONGATE0->pci_mem =3D pci_mem;
>
> -       pci_bus_assign_resources(bus);
> +       pci_bus_size_and_assign_resources(bus);
>         pci_bus_add_devices(bus);
>  }
>
> --
> 2.47.3
>
