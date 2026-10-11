Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F33603DF
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745916; cv=pass; b=BH25nMMlvAP6pR7IEkDK+WEve0RThsEQPjsOkbn0CtBLlKOB4/IjERQdstnw5FmY2Z5NSnEPfXOJL8jrjbgkdjy4uOHehhk7EyXasoxSN6LpkiggU2ILoBgueeCoS4f1j+BxblWK8U3FpNgFByK+73qsbCAYhfypINum/+B5ErI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745916; c=relaxed/simple;
	bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uz7NcXKiJyoBQF8kb1Iw6nctuvja5o5wLEHTeGm3PC4gnN7yNxxxJmmJ1SuyPlmzsXMGqMtnYiqNLC15c6Pc0lukFroKq3AM7QUQhij+AEV1r2sD+KewdktiicMxYkf1U+FsacR9p7YTPFZEon/sTKqF0i3XnhgfLfLS8TjsdDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI/aSWYu; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI/aSWYu"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2a4e013a44so182281666b.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791745913; cv=none;
        d=google.com; s=arc-20260327;
        b=I2PqqscgxAcIDnoqpxXqhjqtBKLs5VFHa1APTWpBNZcJFwNPLie/CTkBK7QPI+/w+U
         2eLQ1BWV+vB0RG3vkpDZRlMxVIt+RNTfKSeavHNlnUsYIfDg3WBg/E/vyrOVzpB+L/Wm
         KGkgrDxTDpl4GOnYQzNvWd2Lf3biPLLLPMQZyYICKPtMTW1wxni7Eg9PohfI6yPkLivd
         9XVwr0VYkqg3gQlCXOjDagSc9uwdNw1QuUpMD4hToSuBTfD7xyL8vQTMvf4H7tWQO95n
         1k9I8pNyirrwSVaC0nPJ8QyHhKEJCPcGvbkohZjQk4fq5oNcUiv9w1u5mhuLIhSg69l7
         KyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        fh=GPYCYPx2m7gFcYNENBaBCBJYuhQbnxdJVVkIYD1/ChU=;
        b=c5WyzivOiTTg07LTOcMbPQgHCvsPnVhcgjbd5oEw1/jD/shdZEfnGjOAe00/4h265S
         3aE9IJsW1ovHvyc0F/DWa4zK/7t7xnXXL8lw7fZTbwUyE/CwoIL7TkGeAzkG74YoxIUQ
         9c2x3MDZzKR8V2i7KTyuWQcMEljRqWqsKzGmB7uK4kKTSj47G53WY4u0/3R1drhTJifN
         bpO2LlWUD25CJkdOw8B9XShBM1KqFtzdU1pogHioxI4Y3Hjyvlqa1cRIy34rObPRGCiF
         /FDfQQOLn+IwxcVxqf5zZinhrc0ZpgQFQtR4CVhoXM2A+3S/V5fiPRfUXoQqtBDgNRG6
         uqwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745913; x=1792350713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        b=VI/aSWYuCmBTpN1oBI8uRoWhn4JptOFIAoAZlwq2feh95SgeabhOjZDhEzyahZcH7I
         vE9VaasWAUHVaXB5DnyrU85/CF3Mf5EdhPT67MGt/lLI3VNcr3Bptwwo7wVwSRYlBVxY
         +mLdDuG3mR/CV8sKahHX1vfi/qnv+wMGn6/u4d3Wd2r9/ybt3N+CwE6xKrP9+wab6+bg
         rta4e0orn/XLlzoJgXdEUX7XhWXDDTPx6ZqVTrri8gupLZ8YupZ9TmQvFjqZmtLlPkXj
         ml40mNL7WYyiWJ9Gy3wQfBdY9cpKZP8Mk7yCT6q7Xy4eJhRf6GPQ2f5TBYJbs28eKBQ6
         pn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745913; x=1792350713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        b=w27bLeh9iJyuqifkXfqJsbQXfqQUywcy6rg2rYsfXehERvPheqZN+gWxvKC6sqKBX0
         sf8H5UvHljCHko0x9V2HBxHtZJNtBhoxjzc7Io7ukPqEt4ly4NDI5Hqxf/N/M2T3WFWW
         WaKX1CyyJFmvQp/Q90g2i8hWvPfRd0YGiAa4L8jP7hS42CO7a5IGWjL1a9BwdGrEG8Mt
         8YI1Rut/GA2m9TvGUnCiXzq2APJ9fVFTsAJ0Xcoxw2hD2zraKmuDGkUPVPFd5FjJU4MA
         APMJHIUXm2RMsHHp68EqqNXt4S/yKfOuktFHor0sxuEof76Znj0mcvYLSLqJZVsec/hb
         Vgdg==
X-Forwarded-Encrypted: i=1; AKwUvBwPeoyDsq2K7BRmIg3zBSHtkZzU1JJo/fGOrK8FewavrtbDUhaT5D4OBNAuUNH3k9ZE45jJ+4P//BbgrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VIId4wZvGwE5jkjSWUVlESml41F7MU0KgidwIVGwk3n4dfvf
	On+j+CgHW/YQqcZeDF9glognu9e69EGLxgK9/xtMMHUWdikP5ICxztzI0pIFqAOM7ttPKq7+6lF
	jxK+8LAyhQGX4DwdyKjgIVLl3rusfyfo=
X-Gm-Gg: AYBFou2rhuCs4QL1zAOG22yUVFp3n09O8K5BbUiXrqu6kqbb3Cz4xW2iY+RGWTeqPXA
	NLXf/MdR0eeAoS1qmdQDFpT+R2MOjd89e+g+wM8Ueym1VAAg+fTfV5+TDk4N56cZx3SjNWWMJeL
	BKnz6jhQJbFcUFrDc9xZb57uAEFpT5RQNzKcroTMa+MkrvsN/7aKK1utQYll0b3IWWZpsZPKsb+
	dpBZbqpb0NXk7VAm2izjx7BHaQrcmMJZaRZ3qYl1Y0TIuJ21RNFYMp5B6vT5mxENg8/gsQAKG/8
	F+Ypu6Cd+yxCjEKKj5RA+ucONjR1Ql1QyYRd1p2PPQCUsDIr1GvgV157BJTDWQ9EAO/5yAlxUgK
	rm7iz+mOiFXuzP+sj0+ub9CEPexixAd9P1fn7gEp8Ww==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id
 a640c23a62f3a-c31a9d579d8mr750287366b.29.1791745912785; Sun, 11 Oct 2026
 12:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-6-linmag7@gmail.com>
 <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
In-Reply-To: <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 21:11:41 +0200
X-Gm-Features: AclHuK-dUbRkuwk_AXsSuyEHFuI0dJIZDATgrqCDTIMSaLJvGfEFJO26tVyLUDk
Message-ID: <CA+=Fv5TbVBGq-z-CTiYf9=Hi-ZKvpCzi2fH=dSopg+xwDrMpnQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] alpha: decode Clipper environmental events and
 retain Tsunami console logs
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:40=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > +static const char * const CLIPPER_EnvQW5DOOR[] =3D {
> > + "",
> > + "Set =3D System CPU door is open",
> > + "Set =3D System Fan door is open",
> > + "Set =3D System PCI door is open",
>
> The "Set =3D " looks like it came along from the table in the manual.
> "System CPU door is open" reads better in a log.
>
Agreed, removed in v6.

> > + if (!(status & MCHK_DISPOSITION_REPORT))
> > + return MCHK_DISPOSITION_DISMISS;
>
> An event with no fault bit set is dropped, so a recovery (door closed,
> supply back) is silent unless some other fault bit is still set. If I
> read your cover letter right, the "enabled again" report in the PSU test
> was only printed because SMIR bit 0 stayed set. Is that intended? I
> think I would want to see the recovery.
>

You're right. The fault-only filter also suppressed notifications that coul=
d
describe recovery. V6 reports valid notifications even without recognized
fault bits, together with the status context.

I've booted v6 on the ES40 and repeated the PSU cable test. The individual
PSU failure indication cleared after reconnection and its enabled
indication returned.
SMIR bit 0 stayed set throughout, so this still doesn't exercise the
all-fault-bits-clear
path; that currently has synthetic coverage only.

> > +void __init
> > +tsunami_init_pci(void)
> > +{
> > + size_t i;
> > +
> > + for (i =3D 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
> > + cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
> > + cdl_register_subpacket_handler(&tsunami_subpacket_handler);
> > + ev6_register_error_handlers();
> > + cdl_check_console_data_log();
> > + common_init_pci();
> > +}
>
> Two things here.
>
> cdl_check_console_data_log() follows console_data_log_pa from the HWRPB
> on every Tsunami board now, and this has run on an ES40 only. It is fine
> on QEMU's clipper, which I booted, but there the log is empty. I do not
> know what older DS10, DS20 or XP1000 firmware leaves in that field, and
> a bad pointer would mean a crash during boot. Can anyone on the list try
> it on one of those?
>
> It is also odd to have the PCI init hook in the error file. Titan has
> titan_register_error_handlers() in err_titan.c and leaves the init_pci
> hook in sys_titan.c, which calls cdl_check_console_data_log() itself.
> The same split would work here.
>
Agreed. V6 follows the Titan split: error-handler registration stays in the
error file, with PCI initialization and the console-log call in sys_dp264.c=
.

> The table sizes all match their masks, and the subpacket length checks
> look right to me.

Thanks for the feedback

Magnus
