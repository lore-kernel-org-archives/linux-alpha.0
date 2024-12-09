Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA3189B85
	for <linux-alpha@vger.kernel.org>; Mon,  9 Dec 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731884; cv=none; b=HewnkpFOTXv6kBUDcOpbHaSgXYBgaboiyyFJ+VZGBH3pikiB417HCxdFUOPmlSoi+u8L/ow/ilNkJiOa5Map9zDd5tNoWeB6eL0TBq9JKpWvT/6Xv+rta5kTYl1KPdMJ7gooHKTeyp80+4cnxkALA3au9UXQ9A/apKNufPKLuIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731884; c=relaxed/simple;
	bh=EMMVAhqvsok8+jrby2Irlase1bXcUqVVDtnrl/lCNZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtqeRrjEc0iWWvbPD/tWbOeN9Hd7igeEhQwvWKET0Bkm3nd/BEl9wt9z0qz8Os9oaMmif7cgfxi0tR6ZEzJPvli0v3RoxMpnYfHVb0yDnrfjguFCocEKx9SSulPvhcJipndeeWHCceu0ocISzAEngg+wxjyAa47XGcARC0NM+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsC8sL6H; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsC8sL6H"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401c52000dso848363e87.3
        for <linux-alpha@vger.kernel.org>; Mon, 09 Dec 2024 00:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731881; x=1734336681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EMMVAhqvsok8+jrby2Irlase1bXcUqVVDtnrl/lCNZg=;
        b=LsC8sL6Hh068a8tVVYcyQ+uuRa0lGyQWYnCQeCA9w/3CpXFSi5L5Vi0ueAxugrK9q+
         ktYNMT/SD9HAsUo1GxWTPolrQQ2bP0vX/zefE3Fwspuv9fx0P529jhK0u4SEA93url8x
         MSNayo0RehoBl94F+WoJQUg0xIw9K7r/fpQOt2sZ/SI+addYl12rWCjHpCWXSWtV74dL
         DuEQWY2DQa5PKoYfve2SqNj2VAyRrzlDmfJ168v7dvtFO9HFXjpEmW5yYrb9oZVFXRGu
         mCN2dhgFIEutZBXPhIv5oxJADYdczH/HgBTOw/x8xphG9ss9FsirEJdwu4AZj3UTo/Ft
         2Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731881; x=1734336681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMMVAhqvsok8+jrby2Irlase1bXcUqVVDtnrl/lCNZg=;
        b=l+TtZOXIxPGjLWADkK3G+M7hXW4YelVc88n8h3I3/rOcAbF2fLtZhLIs+L5Rv7Uy08
         bbzOiDLv3VoUtkUdZ0JUUzPukIN8z6fILvzjmdJkJ6uX2jGKMyeremIKLffsb8esrE9o
         vX7VqXJ9giwayypHX1EsNt/4ZHgQ08PZHjGlupoJqZoEdaZMDdfa+cdxlazzCoHJScBn
         evP1jFuoHCmAWEUYLKVzu8uNclAZhWVdhvFNS1uv+M+UvxjvtxB34tTWD6ytPsHm+NWo
         bNO2UZpgVJ2gPMYHVrRNGtmiVWkLUyed/NtEkGqr62+xQWcy68CeiiTVOBICS/p+si0p
         K6SA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQFhCxObnn+QNOGccaAzQPXBQ1B+EPFapVxizjFWLlTTnkA2NMHw3wJyKBXLyFdIiyGLj+GrFM7tM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaOdo8T4mlOYPTLTSu1OzODVpSPsadwccIw7nMqScFwIvGpWX
	lfqTfZvd+NxVbtHVvkpWa55ddXZBSmASaSNq0WU/VJKwEi4h2GJdumrxip7AOD1+mm+46/heXYM
	kc3ZFanU1uqR4mVyB3JriuIge2Bc=
X-Gm-Gg: ASbGnct9/VN6lPGaV7jMwsR1MzOCh3Vo0G6td2xalZXAAK0cyMnbmLqdnfwD/GjA44T
	W5u7u2cioiwOC5SlabBiLZA5EzUGj8A==
X-Google-Smtp-Source: AGHT+IGRL3096LydMjAsKPpyK1vAqIa4BT0xkb1eB5bu+gEQG4AhdyxQeyVq9cHTC9LyJYFhma/VrIjkyMZ85x0Eq10=
X-Received: by 2002:a05:6512:1048:b0:53e:21df:427e with SMTP id
 2adb3069b0e04-53e2c2e8a0fmr4657908e87.41.1733731880551; Mon, 09 Dec 2024
 00:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <51ce38fe2fa34ec79ad07a96feaea597af07bac7.camel@physik.fu-berlin.de>
 <CA+=Fv5RaMF2ohojG+U0MG-dpLHS4x-Tc41+fOLZwrWqu7T0L0A@mail.gmail.com>
 <CA+=Fv5QH1nUO1D1=Osqic6mNN6vLxiLqvNA4D9uAUgZA_w+7Tw@mail.gmail.com>
 <0b338882a82c3f505407cb313b89a2c7f891d982.camel@physik.fu-berlin.de>
 <CA+=Fv5RDcgm4YSX1AcpOgLvL=XXKyA=71ZasbJSc7+79Kh_Xpg@mail.gmail.com>
 <d9330edfca0fb34c69a68c56924fa0b074b26d29.camel@physik.fu-berlin.de>
 <CA+=Fv5T9nrQjGHOR+42tfgT723TJGgyVqBY7CwY4L-gYSoWTag@mail.gmail.com>
 <c661a771a86267c158d7f2eba1494fe94350fb06.camel@physik.fu-berlin.de>
 <CA+=Fv5Rxrwn0SEMgjufJcxSaB0_gOiKBjXuZnSKzgKakDHeCOw@mail.gmail.com>
 <CA+=Fv5R+8y2hCq7p-xo5qZ0CyinR_0aAndUkoEAweCVs_95SMw@mail.gmail.com>
 <Z1YpKFQGtMWF3yy3@creeky> <3926f510ba2d3069ff038cdae256ed5c8438ad19.camel@physik.fu-berlin.de>
In-Reply-To: <3926f510ba2d3069ff038cdae256ed5c8438ad19.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 9 Dec 2024 09:11:10 +0100
Message-ID: <CA+=Fv5TG+Vc80VU5ofb53iRXOpFPHpgqYb2Ck-pgQrwahuDb4A@mail.gmail.com>
Subject: Re: Kernel Oops on alpha with kernel version >=6.9.x
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	"Maciej W.Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"

> Maciej (CC'ed) is currently working on improving the Alpha backend in GCC and he would
> need access to a real alpha machine to test his patches.
>
> Would either of you be able to help him? I have taken my XP1000 out of storage yesterday,
> but unfortunately it won't power on at the moment as the power supply needs to be serviced.

I can probably set something up on one of my systems, I'm traveling
this week but I can get back
to you guys off-list regarding this.
