Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBCA376BD9
	for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327137; cv=none; b=VyZqZkH1K8aDgYIa6k1ki49E3oxuYGECrwtoEY5uL6OHBA+jLdgt+rxLaDWC337ajHMTaflSIMShTV+RAe2euaGM22zqg8AeEwnd0upzGP1xl6K7GwE6ErIu1wEmwOAW8De2FocFzDvS8E2ObIG05Nu20/yeXIgdFNIVt+LpEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327137; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcAV5J06+SLf8JD4qsO0jO3/1+nZR4JpVFC8LCLjd6nyzBRdeBWWiVPcvmaYc5d8m/AVdue9CCkWssFatAvnzzswiD8wqu8JxO/Hewhyi9kNdoXpKdg7HhJHwJvAx32YJ/+2+9Vy2yWhsJTFgXWaDsHVXvem/4rv04n3OhJaOl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c4MCblRH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c4MCblRH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1770787866b.2
        for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327135; x=1777931935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=c4MCblRHYBFXJ1HnPCjlzQv5HQyktfBoHG0zjaF0MaLa3vUAmxUn4/rvgGRv54y0Pj
         bimc3iV7y6rgSzRklwa8RVW/e4wS4Aykgndw4b4FUIY618E0xiYROavoPnBK7yw0Okj3
         WsrpJVM7FquJs2BrZMcNeOQqOJAvCrWHEyskQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327135; x=1777931935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=Rw0P64ti4DHEyOnJlW0K4sOA1UMvYYx7bSsjWZOxqP/2ERCqr/UbnZQKDIzInmzA8v
         MXMRM9rsRCE5snaUYSnxqSicBgVci3Eh/r8YMoANyrktxAVqZPAktq5fUB6z+1Ykl7E6
         m9R9LoGZJP6eM95PZ/7FJySV1SvhLfn1shCYhb8Fp9PCvCyX/buo4gmksaY/lsBNTUbN
         i4ogy6haNp87MQmw3V5g4H5TQ5YrKn53qxX/6ZjW9TGoYDgsELBlSzVnpS8aIKEmlG1Z
         dBbtd/8xU56vOTmMyBq7Keh4WljjIo1+cJBPw+a8fECUCmLY5hoKnKF6IxLvtBsp1LV+
         QdQw==
X-Forwarded-Encrypted: i=1; AFNElJ9OUWWT3HxwGi8e4SmTxol9YDn70Eir4CLC+tB6kPg1msf02c/Vlz4W5klLxVbIl9V0YbpeI9gpo3Uwnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQbG0w0FO4aexfDqJIC4tv1Alxuw7zsco8JCqwIgyx0pxdOZZn
	uM8QJYJxW5ONz1xmzHyvyZVNC3PxRSel2FiG0p23ZqBlzPEfO335MRf3VmwqZ5lFbBy5UkgSpm7
	hue89FC36uw==
X-Gm-Gg: AeBDiesQUk/yxwm20KHinH6iR+xRUeFYOYweS1oqX6Ar6k0as4AH54UQbni/uO3wH13
	6ejvb6KrHbz01pfinXjJK18S1bfGMSAoJyJMlE7BkLPM2JejgfAW3kewClKVUdUGFnx/6Fq8oX1
	VBfFyrNaIlhay4+HP1ecZ5yYECtuLzAvHB89kjBBEA4PgpeHyeDZFeW24FyOSC6vPUKx9hDRq/1
	yHF2RJZjWf8KuNWfMG+hYtqaPKvxG+NRqqhxi9b0b82ldrV49KcoNZom324LnCcqBanYkHOwytF
	Ll12GEohFCJtDMnxZTYUTroe7MqObDeTcOXKkNL9R1CUU2i0kcNUzZzLyZ5dgDOOCthtrBwlxZE
	rsS/FtwLObKPK3/Ksy/RxVEw7oRU0q0YWL4stZBI0yovx2ASioPYqP80341iNSdqmvurK5fHN5t
	tqrVvCpa3aSQPTyTkFTjEgXWNB4HHrKEPFctWaVk1GFYPjh9zLUER497qWwKmtmfiS2OOn7omzq
	aOvLBYoQHc=
X-Received: by 2002:a17:907:e84b:b0:ba5:dfa6:1e8e with SMTP id a640c23a62f3a-bb80100e719mr32380166b.5.1777327134695;
        Mon, 27 Apr 2026 14:58:54 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd91f49sm10368066b.51.2026.04.27.14.58.54
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:58:54 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f9568e074so1773191866b.0
        for <linux-alpha@vger.kernel.org>; Mon, 27 Apr 2026 14:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Aqon5XJ8ZQmEGvF/VYYXS93XEo4YlHgjasLSzox80PAuqMKD6L6GA0YjSO9TWlhvk+fjsqj3rrx7iJw==@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
