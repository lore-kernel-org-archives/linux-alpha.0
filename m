Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DF2DF71B
	for <linux-alpha@vger.kernel.org>; Thu,  9 Oct 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008784; cv=none; b=JJ1kKJFeCG0oYvaIjlNDEE++qJcwI86/8v4Q5rK73Ap/pBdbhFhRd52QL2gkvOHeholV8WrwUJogmDWDKgPWpez9IpzTz+S74Qo7vLOIuUqRpZG95zHiTCtIXnfng1nFU/d6Zeu0z1d1Uawxeflitu1fubRP+85Wufsfa9CmKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008784; c=relaxed/simple;
	bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXwfF5ownZwPeBVB93kCipNIujQMBa3+eksIMLaMhSd6GCPV+8T0aaQvjIuFfSnLM26Gi9bu0WtBg1bB/mcDV46w1HQobaKz/dEkFq3MDcDYWBdewA/EjCLbvEj5W9a8KZEROGwdUJNqDA9Wcu4uLJwJD0X9027i8PIPSu9IVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNoiJ37l; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNoiJ37l"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-77f9fb2d9c5so8835997b3.0
        for <linux-alpha@vger.kernel.org>; Thu, 09 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=jNoiJ37lCUQ9Hrm2hMpur0n3OpmXylsTAvQFzFo0gEHLdPW1H7xLOEfZx9IMP3xJGG
         VvaFojxgSsr0dFIBvT0p9gx6C2qVKiKNUQeCfRio9yhV6GZjq9rpyyrteqxqW9Ew3dBm
         wtvaqMjirKwpcBo4MgJpiCLn7sWEkQpEyqFiwGTjc5zHrlT4QCRizWiXWVk6zMf3FYYn
         bzUTIQSKLADIffCIHWelPhf43EqQYtzVSfMGzuGbrzIwj9QJsP6FN+oluyC+bzTKhDgF
         5nZ3Uo6yeEy5h0e9DLaazODqWGp9Q080LEkzOtn2P2FcQKQiw+6Kon0LQ4PFBZDDcg2+
         Grtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=GdIdpnRuF6rFeNZHQM4kBiYiaRYQO3RUsbg1Kmb7aNQ8QC0JiVPetztiNftMjYDnIF
         7z1hGGOBATQr0J5++qcwvhivWtT8tmVyVtA7NjusoFjtUf/lDR+qxigxu7iKEHYGvv39
         4wZwvRPYBrBjwjmbg2pyBbxXTbeTa2F/wXT/jQnQm2eENGv3guRIlccyG/GGJHRsUn0g
         ieCXcKdhfMrnDz6udZCdAg9I9AYxzkL1aqRMiamxeogmV8g3DKahQd49z2QakzjUKSVI
         XitEzXItintV9YF2IlQw99wP/nx0v2OwCs9+GztgX01GGqvzOQ6HZXZmRJGNXRFt+BL9
         Kvxw==
X-Forwarded-Encrypted: i=1; AJvYcCWw8CBpB0leeuQddQw8Bn2xuYk6KAf277C9evo445QR9md0Y7Stj9i0G4t4fGWg1nQjzkABI/S4a93y+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRC/+31ONHb83KMxISiCO8c9yF7H0UeCnJkAQhtq7LSPa2VAYq
	ZvPGWPT5oy1vXHvGc1yoYTwZ0xeWA+TfzfVBQU2/m6Ks2Q7z3T/OXuDEMc+jB0zJOk94ZSn0QfT
	ROA7jJhmOPtwiACALLDMawAutZn3ytq0=
X-Gm-Gg: ASbGncslec0xx7QGfA1YlszVnd960Znx9j1rTFOM6ypL5sgdO1NE2HtovHLWJ0gsHhL
	n+Kgz0d/U8GXnaArIcX01bocLWjsalwao56cToS75qD85qDJy7irrZdDCHsHAwy08UqOCl5ikhB
	v8zfU8rApSzFNBiRsOA+aBoIKiCE3Fe595fQFa8lE2Z9T0BHsbYo9lC8edid6hU9Uv9yj65YtzU
	qYaIL5NExIbwZhKxfbChlMc6rZfbnI=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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

On Sat, Sep 13, 2025 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> Ooh, now I see it - you have virtual and physical initramfs address thing=
s. We
> usually call those "va" and "pa". So
>
> initramfs_{va,pa}_{start,end}

Okay, I will call external_initramfs_{va,pa}_{start,end}
(after I will remove initrd, which will happen after a year)

"external" means "bootloader-supplied" as opposed to builtin initramfs.

--=20
Askar Safin
