Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057BD3043CF
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596288; cv=pass; b=EPLn0juEBBecIvelJfPlJkjuK583NXnJgDu2B1VqqlEipsIBylrf7t3Gs6Mfrj9YIWVHGd+jvBWtYDatIK4KxHrIaxKlzohhMtbM9zteTHOMIif1JjXDsJxv9UAA0U7UsB4Keewv2CwjLECkeGD7RdTnlB6hoNtnCmsAR9PlDwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596288; c=relaxed/simple;
	bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoF6NpC6XHHG2N96ihSmIklSX4r1P2Pvap7BuJ3eDtZeTt7Azktiaup48zUphjSjewRko6g/CkUNIVgWjggk/o5DSgwf+1Z4q8uvpJRTQ2vOHKmDAUC5LrtLCdxZ+ZdP4lQYI0s++akS6hWfnd0YtUK/1Hq5m9do71zWCzbUSTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGxKbipB; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGxKbipB"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a7858d3a20so3035981fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596283; cv=none;
        d=google.com; s=arc-20260327;
        b=XBilGbDSjckv8E76R5xUCpCN2WEtWRSuz91kEbLa5s28eqFouzb2dN+krojwesKgCU
         o/Tpo/hN4SWsKeW8nNjSsjjX44m3r1B1G/pHOorx/R7+ZBT34MT4Rj/knEvCFMrHjxUB
         6Fm4twtxTogFYjhL6QaijFJu7mUnF+EHRgP1r582rortxqkhPJB1YSbxHhEpbl0Rd466
         sfuYoCNvX8XnGGAqZW0udPPJynhefpJ+WBSY4eWfYPOp93fPSUM5lw3UpDb4VcA165sr
         y4udFhP/Zn8ANwjAJ1YK6vdO+451yvUc11kRRV1C3ChwDvOU19+3Z/DTtPenjsmEzLbu
         /3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        fh=tSvrRDK3wQltce5Z5Lqp94+r+Ng94y25NyLLq/Sf750=;
        b=rkbEWUUrDdUJc+sjR2Cz7+8Zy9n1gdK/ZAB+tXh0qyPOt6SSN+uwYeXmIY8lnUPplU
         71wGSyYFIzeilC5FP6kAq6JLsKmB7eX8+mYuJDcwCa1ChPzsPqa4tnYY8ECO3Oe9xTzO
         1NAZ1zfRZpG4Bp3BrL5niMwByzcjyo4baWmObKr8JC4G2XtXVzeMOBnqwNeBZ8zjBebp
         vezV8qiw+vJLpLXVnGTJT8uy8P1OqXYZEv2SSqHacwsq7RUMoHR8Q+MSxeiVtk3FnBeO
         YBjZrS6ox30L15A7ZrUdGV1CPCG+Aj+kxX8HSPC4H57HGqb6XZJIwWKed7XBhFFlukcn
         bEcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596283; x=1792201083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        b=IGxKbipB68o0TLV6KLhgXmUvQAFN+0RSiZtmxi0ppjf4fOzeorM1N+AgzHHCvAo00S
         zemG2v8PcZ5y0hG7Jkfz/EjUUfoNGyeGFkozYyHR1VZdvUGJL4/p4upP1AcYdhP44zAV
         D0WVuRxaFq3e+tQPiPSrkFt+VEksullte4C2QE/qFjNKELOZJK0F98Q8XEOc87Rrq8R7
         LQvrmUv9sNYHMfMANvTO7NR5VC2RnX1wIG4ix+5XJhwrz42UiIDmkM8ayVUE9d4tn3I1
         l8KBHamES6AOV94Mm0f9nnXkE1Z8cl2G/KQbxTAqBAZwEz+vmFwWHnMWUMiGp0OaKbEA
         vbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596283; x=1792201083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        b=EtdyRYoc6NVCVwtPtFJRXCP6cd/wNukdkpN8qxhPfYNwJgmtHOD7fwZmeygrrZgPD0
         EhK+UMH9vgSW81Y1wWhCAA13A9D3JH58602F+IFkRV2NQpkxyKZ/xzwIz5a36i5j5rNL
         1QFO4JicXbejzoLIfaakqR5TXoEWW1rRp1mXhFFMy2L+qKqMxA97m4Z8qalXQcrw5ttI
         eBTyv4Z/mRBzJjnPvyn1oC7bEH3/D/uI/V5HbFK7lGTwGus/AfXxoSt4qq2PnaSehUOO
         nmzw2uLI9AbVpZ9MqOl7bM2IGygjIRR/s0DCOi7oSSaay/lDo1m0FFHqzPaVcSQnYadO
         8QCw==
X-Forwarded-Encrypted: i=1; AKwUvBwCt0govllA1khAkK6XduUYp/E9RlnSQQK5SjWSSRNAXXC+X6ymlVpiZ3wAJ6Hh3FaFmgGffyeaH/zUpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIoIqnYLf5466Xie15C1fxkh/MxWH4Vk4/whnQed1UHqtszU6Yu
	DKelZSMg6GezsSP+5KbiJZceoxyNuFVG4S0yUmnHwjkZpxuNwU/PoeTpjRQ22Sj0J6n1124iW6u
	1Z7AnfYY8GKcqojqJcylzMv2FLsaLygQ=
X-Gm-Gg: AYBFou13KwJ92zp7wCevhmkH05qNtt/WZZyJibLbMU0k6/PLfXIt1C1bQzTl5ERvY0b
	HqbVkpNSapdcYZI7KCyvOL+qfPk3SwNwiuzAjHbIKVYJnQrlLYgTfPG58iZf7FXibNC4YwPQZfs
	PVYychKCNuYF1fTsgufG7+GUJu1HWGZ1/ydvrHJKaq/+fyZv1DHaoVf4F0UaQYR+Ql+1xxCuGVZ
	MabdVN2HshYhCjipJS0BZtFdpew7vn5rFt8PRHixUhEppgS3Xhy06tdPa5KEnUavvJO2LjHG+NL
	WISA5xaEla9JQhVteN3rh8q+pp1VG8LgH1MoI7oOD4LNWd3+44w01vtet3QT0MrymO66xl7k5bm
	M8uU0vSQgCjorrItpMdKRyjiPLPhhIcl/ynqdSUKX7nftYiNmvS6hkB4oV1t/rz3PS9iaUeM=
X-Received: by 2002:a05:651c:198f:b0:3a9:6f4d:b32b with SMTP id
 38308e7fff4ca-3a9c52535damr7619141fa.4.1791596282763; Fri, 09 Oct 2026
 18:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-3-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:37:48 -0400
X-Gm-Features: AclHuK8JgdohANmvDTbCTJI-lrC0lc-owpC4Q1qv3oLAqF_LxjHp5E7akWIdg28
Message-ID: <CAEdQ38H7aFjEouWvwkVd-KX5+fW-+vT6ap1QRvZDbiRp9+Natw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] alpha: describe the Tsunami system machine check frame
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> Define the five system-specific quadwords in the SRM logout frame,
> as documented in the AlphaServer ES40 Service Guide, Table D-19.

Reviewed-by: Matt Turner <mattst88@gmail.com>
