Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CE1DE8BF
	for <linux-alpha@vger.kernel.org>; Thu, 12 Dec 2024 23:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045816; cv=none; b=lsed5BYowDQ2pyQEyQUF2HWr0jxkLcinWlEIxebnAx2MEj63Y3Vw1suLRH3PRkmR8ANowOIgnzdbZTBvqm0IMsxSdMum0Zw+jhKMtFB0xTI4SNJHWhCbGQQRDWIPjXsaTpok+NiS3bfkkrFVFm9x6RT3der4W0CiWh4cNPMSUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045816; c=relaxed/simple;
	bh=YixYuP2QSvvAB0j+FbFdxwsiIeNWHnwUpFWZt4NpmFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZNdLFxkmySaE1ACgnUca7ucWvygDB2gkCIsY+RfUxfPjGJytdxW+vRtopRhQDfBV4QpT22Ai9MGMT3FBLHI30O2hRqxW90BEIAgIQh+H1/Vfkg4VGJoLP6yTq48PLnKzL6iQmwup6ifVui4/KDIo7B0nx8RbYc26QI8wyUEiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5tx3GVa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5tx3GVa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso178514466b.2
        for <linux-alpha@vger.kernel.org>; Thu, 12 Dec 2024 15:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734045813; x=1734650613; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YixYuP2QSvvAB0j+FbFdxwsiIeNWHnwUpFWZt4NpmFI=;
        b=X5tx3GVa1Hf1dIzlkYIM5yMZSngPn0RPgRhQgt4LCvFP19uvxKj/b7/y2/PxetsSWS
         Wrtk+8szBmrEtYIfFB82nAkbM63T9X5bYsqXF9rCIeZMciTITrSOr6+MrAtR/cfjCXk0
         6f3nIMZdlIitMkmxNhjgEmlhXk23psXKiXahCjMfPKQBu1g0gI78avfP4ApALYr4Yrw+
         h9KrWWgTGYMT3gdB/0Zqb92G72TRzFPcLguXJEi4t0NPnwKBWQY7LDJCEr6uTsmAGS7T
         2rP9P9GDnhTTJW2twv31pG3HNeKjwTqRoL1IWwVfuMZNv2fh2nWZogPb0DmYAroy23wb
         zEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734045813; x=1734650613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YixYuP2QSvvAB0j+FbFdxwsiIeNWHnwUpFWZt4NpmFI=;
        b=dBqesEORtSkv4c3NGFktG6ZMAS71m/5Zpt17/l49Y1ZA8fqAsmCdYHBUWECRF/QZrx
         cycAkXnd1bo65AUoIX/WnCCSgSajTDjn+Q9j9LlBrnCq/NHoDa4syFH+k8ux8gZuLv8V
         bW9O86b97mmGywXbrzRpi+RilUMJwtrmImzlxl1MUp6om0oY1w5IQFLk6NyrJz+GHSxW
         VBcqdk6tKJXUwlgYtVlSExuS+1H8PM02bhUvAZKaUCTzLhfJ0enKgTCQvDqMQNIVG21k
         QpHCIDO991/fKGw3dXQf/qrWiE7b8vpX6lwYB0CuyuAEaUMcGlcEb8OcRBO3A2BzvPdb
         Gm/w==
X-Forwarded-Encrypted: i=1; AJvYcCWh96/f4kXtpLZfynFvVBJFmJ/W79KwF/wHTLSRwQLNmHsAmXQ+9nOu4fbc0l9ip1ZX4fpBfO1NvnRR8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYI5dW4tTHjv1D+6qMeym3+rGL712RcjNvNKZYxzoFlWFvRo8u
	6jdmjHjicdewQtWSEcXuzJorkvF5nVkYd9fl8KT5ovGu4RRXFW0j1V5icTD0DqZZaXjn0cPezwB
	IlgI3ddBeTuDfrSQblKSkz16lZRA=
X-Gm-Gg: ASbGncvoRQ7nzS4UPfXXziWXaZeCmkN31OX8krGHu52uGQRGeYn4cy4KSRgfwsM08Gj
	qmgn4uJy4hgsd9XsfGHwrySQlFe9oE/O8JhMWbw0=
X-Google-Smtp-Source: AGHT+IFF2uGYL93tdQsYiLLxR8WoxjcqxFQvoSIPRbQQ9Ea7wf6J7rzxW/2rX95YyMzWMct5zBlFK4XFxAawlkYBpqY=
X-Received: by 2002:a17:907:c0f:b0:aa6:5d30:d976 with SMTP id
 a640c23a62f3a-aab778c1d94mr51828566b.10.1734045813248; Thu, 12 Dec 2024
 15:23:33 -0800 (PST)
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
 <CA+=Fv5TG+Vc80VU5ofb53iRXOpFPHpgqYb2Ck-pgQrwahuDb4A@mail.gmail.com>
In-Reply-To: <CA+=Fv5TG+Vc80VU5ofb53iRXOpFPHpgqYb2Ck-pgQrwahuDb4A@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 13 Dec 2024 00:23:21 +0100
Message-ID: <CA+=Fv5T-nfjjGmk1-r3ZCU=SmpmOyrDW+FS6joZd277Tt8hGgQ@mail.gmail.com>
Subject: Re: Kernel Oops on alpha with kernel version >=6.9.x
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	"Maciej W.Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"

Hi again,

I did a bisec on gcc and found that if commit
3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b is NOT applied
will generate faulty code in the RCU implementation on alpha. The code
fails since the when the fram pointer
register is used for accessing local variables the stack gets
corrupted. When the commit is applied, which it
is in GCC-15.0.0 from 25th of june 2024 the gcc compiler will generate
good code on alpha which mitigates
both the rcu_expedited() bug (network interface renaming) as well as
the scsi module unload bug. Not sure
but GCC versions from 10.x to 14.x seem to suffer from this. Maybe
this commit can be back ported
to those versions?

/Magnus
