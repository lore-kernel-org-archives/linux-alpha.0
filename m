Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095FF1E5B88
	for <linux-alpha@vger.kernel.org>; Fri, 10 Oct 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069382; cv=none; b=dyiIS//E1WfuZ6X0lug0e0jH04lJyOTr3TrZRdfwZWm193/974wmc7fdLhU9+5aNiEa4lyFqLySYgRgJcGhaXstOCm6xQPQDVn+ToR7rxiiMrjrKvYiv+wpwYPpu1ANHtQ4TQXRC5p+64ZhtMiZfjnYI54zIluygiPCtX0AWS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069382; c=relaxed/simple;
	bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDGmlHw8OTcWu2JZzP3boY8EIydOy5T5UGmD95Zcuw2yOifvCU6bACGvRcXutFLx0yRZqUjLhiDJeEiZw24XtX53CFW8XYEgqRvBk/uaQmR6GWH/g7m5WNkQpmykEcQOX1VPD4SaAXhA7mZQjCe+qYOl72t9DHzsS227vc/+x9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDuL5tqL; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDuL5tqL"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63605f6f64eso1461984d50.1
        for <linux-alpha@vger.kernel.org>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=nDuL5tqLs6F/bqWcdATCSw3q6sR4xH9PojO9qOD+5CVFhCKnIdXYLqb6N9qP3a90AK
         XcWKwh2rGBNpBKIw4DXxov8U2qs0Dzy6gXk8vFfvDusYiZmPGdnri/OyTQj/4/Q9hjBA
         AP9cRpfxElOVTqf47iRfDxq23HPr72skNOU/r2V/uYwO0u5rdlLaDJlfE0FHTHhwxXRY
         CxV+l2MjGbd2BdsN32iKqGDmRkhB4tNQBtMagkevAiwpNidXH4OagDZ/3oHz+Ju9tDVq
         V/7yZAk0s3YGeHhlLGi653f8C0CT7tXpjc3Ab8zbhGaCEogKGwXedDHs/+NW7Be9ThrK
         SjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=DFDaHgXFBmB7ThfXpImaWgoz5u5PhupKYSRejXWpyrpoWH8d0gxmbv7CqFP2G5ZRyx
         rqKfvss4QjydHXIG9QNbSdUDgQr34zMHMVtS6GKBahdIuMgIYV9VOJT0LIrlxBfsbeDz
         0GSHfZin/2cdUg21y0XMzrFdX8krujcWdvvUBjoqud7EuilOdV3CDHRBNQ3pUciAb0sH
         kqWlmTdod3wiH3R/hP4B3oLu3YZDt2kHd1UNaPP+rHnDuJaJ9qD183KLmm3laqWUOQXB
         j2njrV0tKyZXhUGuNuBr4svO7gpXU7u4cnnA3Xq7yaoOa1Y5hvpUMewcbzZ8nnk3fLIC
         pemw==
X-Forwarded-Encrypted: i=1; AJvYcCWeHfBF+dzy7gGjjfkZH22dRMnaZkpVLPxaRO1E/oAQPNy5UIjweXMtUf+S6kSehWpaYPJDfqhlBLOijQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfak5FsOP584RZP6pUhIIBJMGCNCX4YGKr3W/8rm+7mbctDW5z
	TR4OCoi9LUwac2nbc5/OLVr4V8/j5HwqFreUIdalehHghopFxpqV+aq0v7s5MloIM0LO8bWIPYa
	VunOnzotxxJ8nj4rOiDMROexYaXRHxrg=
X-Gm-Gg: ASbGnctN2/x5mq2ke0dmlnFTFDZ305IUvdn5eMnmjZYeVlALydOsWl6XOGf7f50LOb4
	TFw2KPQwc1/EECf65XMMaTH6Os1z29XurQ/MPgXnqZ3SggSbRULPuht9SfzfZgmvEaSXtWWLzpW
	wnVhPpYhMTKlojftmFDk/xbZB1lJFMI3hco44PNTusP8j3i6MfOdD6XUs213KjkRKP4ugAh54Em
	n+62EDirSnZO7ocsSek7ThGJR0GIsYePdZ9
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 8:08=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
> I strongly suggest picking different names given __builtin_foo is the
> naming scheme used for GNU C builtins/intrinsics. I leave you and
> others to bikeshed that one.

Thank you! I will fix this.

--=20
Askar Safin
