Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997A5345EDC
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206848; cv=pass; b=lvZ3mWgFoOpO0OiSXZBCTnzaFt3HbK45pJ0YaYndnFRejf21dMBzaW7Y04HbCJVloh/ZOej5eZcXzoPlY30R+2kdkfz20Y40d7gTltJYj4UhqUeAiQAScjtv1uItYXK/e8N14sf1NRPtQilMhtWv/JltQbT/C0OUNJxDQBHOTww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206848; c=relaxed/simple;
	bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QH0lf8n1NTKKtKrNXVtbDqgKKpIt9Bd+sVKZ21gjldcg+WCXj4K+QceGspjMT+xXU7Z9ZycCJ6SnNnPJwQk3B4/Er/0rfQUxdUwEti9fbFC07Cwc2gENM5FsnXCJbjGrKa25BuIvG4b5sCG9HYVp2duBbJ0EP5fheWLx1anurIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXl+CIHO; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXl+CIHO"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3aae7df0971so3014541fa.1
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 20:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206846; cv=none;
        d=google.com; s=arc-20260327;
        b=fj0g6Ux8bcUqEZZxIv7O3px05zhhdlH9GyFyf9adiKqX99kpa16RIJonvEo9go5TRd
         hh8kbpKCMwdub+a659RQ9lekyd7knU3fqps10ERIGaj+9YY6t5xniyVvLnuu+IRgRcV0
         x3shg/IBtyV2uYynzilzpjk0r1l12vfP3Vp1BZQjRFpfYASvImglGe46XN6GDsr+EKFK
         ReTw3/TTzW6RAQlCFEt1jPXKj852R21ZWQEvvFMC8QyVZNPk/UR5rq21+zVDwN0Y17tf
         s0Utlrf7U+9iWC6O1fBl+kHNQ1vxox0O5FGNzPyrde34IMKULLbXmw4H8+eSD4cAPljZ
         yQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        fh=TVVzzgpJxYi55uDFy+bZg3Gm2R3Lvf2hOJH2O758ey4=;
        b=Mgv9raSdxq1I8PqQEmKRDnnOs2NS6ddiac2VZtBW69PN7O84ziM8YWhyjzg2krJuB+
         8RJy8WR+xkD//tpjz/VKitFCcukM0LPI6DssCAS/SxuKX4yjTy7Ic2gZlSO+JmyTAmbM
         8eb4pgC051o58HvuMUcOkXVudLj01nIxHWPM2v7qY56PwjAgumc+R8N5rXvXQVo5tFXB
         D/jv56tCYOfeqdFLc9tQfrBr+poyg9vxXGTsu6HCcCxGZhyFyXn/NUYWcuz4YZG/S8iJ
         nbLpq++rt/7K/nDmrjw+xdH2cYqx+9yViS/8vxwt1oMCa0fZLAPSFwTEs/rMjVkoUIhg
         zLFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206846; x=1792811646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        b=OXl+CIHOj1hMI8kw/SyT4BIcnY5v7RpiFl7zt2KqtelZ/9teCMQ4KatucLpjKQwQWN
         ET7VnlbPTUv68KVHKQ95C/uInMxRlRUm3dp2CTqTtLAPXXHwTClhDMJZyersMq4TfUuC
         Nu+tWJnTn6OO5hsSv7GlAt+1Ju58LdE26EEpUVxC+OiQ1FICu01W9kGFNJLeUfF0zuny
         Fu8b5edS1p+tL0qUU/qHLpmy1OP0Bw7fPZyoziFjMPxSavC3Pd1SvfC9V7RDQ7yfOhS0
         SiG57QuU10zg9fEiSu7oYBKhcQmzCBQEJcAyUzc4Rsr4BV8YvrwyRIz/ENhn894iDInP
         Nx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206846; x=1792811646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        b=sGskuT+iCWO7b0f8ZqE7TiMi77tuLH16Du6cFCI/P1oZgoGk/eYMTeS3J/V37gURKr
         c7VmMQiNS0M45FIIKvWDkIlRdHKWTqxL+vV1YO3nMW+mJ5EtfKdnKLf1XchVzbFaUaMZ
         tpwvELWGdC+cEJNZQasklrQFt9pTwepYIJJBPgPNwscmTsjiryjMXjj6NyVXHU4B1AOM
         rYG324mfH1ol38ng81x/HnXPJHE0+a5Ek6lbnGB2CIelOmQtrzepKkPwFLOr6W0xt89g
         XKIVHh5NXiYcx7J2C1Wv9MyvoLh0Zu7W4FbqDrTf8OC3dZd+HryaI6gAlAtOQq9QqnMg
         BBfA==
X-Forwarded-Encrypted: i=1; AKwUvBzrFsb3vVxu/+IVJYBZ5CRMlWWbklAzTCd7llB3A1fO515XTL6UvYAfmKlZZcqAQpPMH1mI7jgMFBGmhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7EDga9kYmGf4he7byHBsDWcUOU5g+T0Guaz/ds0bXmNGh5oMN
	71gxI3lAMpIvWMl3OftXX0fUWcoInLi2QrSWDQpcoIudBKpqaLfr7bQJJtqCkAu392IHl5zU0GX
	bKdiNDi25jy6/poEVyXZbDBBzh2hOuns=
X-Gm-Gg: AYBFou27dTsVpkNidZGhjZqP5BY7OKCdC3xpM+XA/B2T5GquEDlK4qv8HjCt0yfMOGu
	/z0Ksxk0YY1ih4e4DTYaZZ167am851Om6KrNo0QL4OkWAG33i0SqypFpdWWUV10VaDNSpXjV/+J
	6fVZ8sXOtxsAV7EL5C5i2EgXWWSW0Z0CqrCDYPaJ8Mb1t2sOGIp5ZatlvQ/P3YylM6tnQhTMN/d
	+fdB/QBKuW0rN+tuJdwGIf/pqwH4R23VOvPr60F6tmittssBB/OwoLbO75P4z/Bm9sXak50VPks
	wIUxnjD6Y0Pg7mAYTtIQbnlYeQif58QrTBMdSLAd1uMkoqJgGUxUGDDgVX/E1PhyrR2H4OPXJfJ
	55+wURS7s3bV6q9etrKnsfDBaHCDDCsyAVeNMpw==
X-Received: by 2002:a2e:a9a9:0:b0:3a9:8450:813e with SMTP id
 38308e7fff4ca-3ab2928bdc8mr3488321fa.20.1792206845572; Fri, 16 Oct 2026
 20:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-6-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:13:52 -0400
X-Gm-Features: AclHuK_nrS1feP-_qqEt73pTZT39OWgFXhvUicsqBS5iTw5OJ7sNZPJxdgNy9TE
Message-ID: <CAEdQ38GpjWZKGvDHJD5Z=g3aPm7SC1h=ZzP4o+6Df5wCgj0_Zw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] alpha: decode Clipper environmental events
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Restrict ES40 live environmental decoding to Clipper. Validate frame boun=
ds
> and string-table masks, and separate fault bits from status context.
> Report valid notifications even when no recognized fault bits are set,
> so door-closed and supply-return notifications remain visible. A single
> status snapshot does not establish a recovery transition.
>
> Keep SMIR bit 0 and inverted halt/reset bits as raw context. During the
> ES40 PSU cable test, bit 0 remained set after the individual PSU failure
> indication cleared. Its polarity/latching is unverified, so do not call
> it a current PSU failure. Use mask 0x14 for the remaining SMIR faults.
> Decode only QW1 through QW7 as live environmental status, as documented
> in the ES40 Service Guide, Tables D-20 and D-21.
>
> Use plain door-status messages. Preserve unknown or truncated frames
> in bounded raw dumps. Firmware console-log scanning is independent of
> the live environmental handler.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---

Reviewed-by: Matt Turner <mattst88@gmail.com>
