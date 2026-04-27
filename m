Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331030AD0C
	for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326328; cv=none; b=u6qJd9RNUmNHRHb0M94re3COPKJ3sdJ6C8Dm/jI/a+n0mBxQFeYr9OP4z9JxNrYUVHSNWURVAtd1tHuT+7wESpk2GlIDh8yDF/CiYZkf83xCvRN0vPV6EPiWbXYio4gfBGQzmhwofou9sCgy8pOSDdT8fDSfxF7K6zMWeS5Uu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326328; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrHXY+76yXT9wO4B7cXk5dZAVXdvlCdXFdXjXh9lb1vgNlpGlmp8LDiM3FNofrWNMVmWdqx2r/gEi/r2qOW0KinY5S7mbcsvacHiwMIHtGn/fdrnEaRnLtnRbWZxLbuVoi2hyIs/kl3IJ8fTunNZpmGiLkAQK+QyMJz0/l6NhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XdxXOMUc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XdxXOMUc"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b886fc047d5so1920943766b.3
        for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326325; x=1777931125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=XdxXOMUc3+RZxYzc3QG3frMcqDccLybNs+mjXnTcaGRbegwEAZEjvj69Ibekl3KSGz
         2s+3PErUyJvY665xCa+MgWRPKtf87iLOyW88XW0EOvMnnCIHEcmU+a1Z0TNe0HHMPdSv
         pHchbeEBJmpiAgdhrRLH5rKUDjM3Kj1SC+Cgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326325; x=1777931125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=s27XMrulDR9zqhIQ6kfPnoS2WoyZxGtNjTj8IMbd/PpzftlA4cXcWwG9JMtc8xHllE
         2zM6cYFR7V3pT68wa6Z06pb6RnZDp8NMnJUfFk4xIrfefwBLoTNso/LcIQMEKcFlmQ9+
         eOsRVcPnK+STWlLa5WdwLKcCHrUeZrMzXYiy5ZC43n82s9n1lA6dTzm+ZlQD39G0Ztq3
         CnHgN7xhqgMvXeZEQjdxtKTOy8uFNCxNZ+iDBZSvq7GKUu2ANYRFSdmNNLdOEne0Jca6
         Qi/fANlkBg/23scoc5VHIGX9sKoQbmFzLy/4TiOy/q1tyHxSqb8EMbwyt6Agbe03ERyh
         B2Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+jOmgkITIm6R1VURu6RBrxyzFyY2gyxEcquldXJLUSXePL5LqC2NGQdzbjOLzfinGfGGfTeGAsoOGClg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZmgUFKwOYizI3adKlHht5EsA+5cp3ZwIOS8jO1aPj4XHTXN6
	AGSMrtq503+YMNaAZuUazc3+B8OkcK01aRO/ivf9JGVJf2l48DocVYK3eNw4OH1RL2BqHvvTw7h
	5fyZhkuItAg==
X-Gm-Gg: AeBDievQAXJeJvwiHIutS0udYm4+6VAxRf8oIq70sc0TeNWsUqxnPyvU51yQcJEWlh3
	CUEsP7Pijx7hgCpXHYZb2T68iv/gZ5zL50T9zJknn9CkGR9TOZM2JhWYlmoABjKb8ob0b7tUtJl
	n/QYg6Cw+55KNL3apL+Dgua0fNZZWnJBi3f0cp9X+Fhz6tgLNCYc7/OMXZZU2XKIZpnp8r5Q8n5
	ZygnOfa1Vm5nM9ZX7OTSL/4rACrJak/JptkWs4SQRqaNOnRsjMmxIK1J6GmvnCh04nDl9FwxgDl
	NOKWo8g2Pjrxz537zhqN6yY6lbI1xunBGtX6gnee10XgmGZZuEyyl3NkufKY24p4yYmmXUoNL4I
	inVRKKS053JBTqpyRHJMh8N9VH7DYhKMYdyi02RjJ1aWYsZ6U461FF62cCGH4NY9uM4DCNKbSPX
	Q/c7qc2v+sz5kAWIBlYTVJvBbsgupTJUbnP/yoprycZy4iInFHjiadFUwK/a8dxPwnEB6Uns0Oo
	EkF9884oqU=
X-Received: by 2002:a17:907:c007:b0:baf:3fa:5b4d with SMTP id a640c23a62f3a-bb8020c955cmr34534466b.9.1777326325535;
        Mon, 27 Apr 2026 14:45:25 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2add1asm9648266b.36.2026.04.27.14.45.25
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:45:25 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so18827184a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 14:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lIV3Q3ppvkfli5Yh5/SLzuXYuFTEFC5RsOxPjcd1a2roT3aM/FHU2SnuZWqGfCXirOzgfCwhhKyjMLQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
