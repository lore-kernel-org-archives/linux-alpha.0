Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D8199920
	for <linux-alpha@vger.kernel.org>; Mon, 22 Sep 2025 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758575061; cv=none; b=hRrketfhdwi7cDhAG4fdLd+wat4ifzcLutb6eeX3PajSIrMkNbg5dDLxAUxc2Rnnlze7IiQhcfox1FvNvpFRV5liCiXPZGeSODdA2Sz0KAVER9tXsmRBR4JofAMvhQBF1nZuaJx4xQHs5XM4CWrqfccYEYi5tG/qEHlN64PJO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758575061; c=relaxed/simple;
	bh=IR27taLTFITOYV4B00ku0qQKC4bEZ+4qpChrvPMvsvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE9wa3bXQ84mwE+dERTFfAM/aLcHkP+7r4MyhV1qbPeqsQvLm84l7ZmNFNtCDYJTVpuhZCKvvLVOz3qbid2tFigrSm/15oZmJDQbjVax/erS1hKxtbYhqPAT9kbbKUBHkzHP1sTBenAGci6hv/RyWX/jbdkDuXbz/n1gkJdodrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRjSels8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRjSels8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b07c081660aso881602666b.0
        for <linux-alpha@vger.kernel.org>; Mon, 22 Sep 2025 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758575058; x=1759179858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=BRjSels8DOVs7qW6xbfiJMfD/GfyjPcjHOVYe2Rgt+KQAzD3xMEVJXn/vZai3COf86
         269dksgcmZHtamVFgfH8sYfTPVXXWSuMj9MoViEJ5+4HLu8qwGyL8EUOtmG2hqR5p35V
         yI+hLu0BNSLw4AGDXrR09NtFb5VtSS8BBpbe5PJujhaqK2PoEpJVh1aX00FoUE8A2jMh
         S65Fu9Jqc6iQF0ibDHrITbxfN0HoM2BjS0IqXUlVyhwKuWSvIFhUUw5rAt3xLQDHs/5D
         F1s6d0NCxxk9yD17M7mGb0zy+bcuTCjw3cgLGT8FGCPFRs0GsBG4kg471XqJ3SJQ2cCK
         lVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758575058; x=1759179858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=UqsQ8RUIbmUb7uDP0bTUoC0F1AbQFZaf1sp+5v/8SoL8efb4Tiz9TqW+Y/Madh+9/3
         3jVYLWIADPKufVj85uKSfY8bUCWjnQYQPn9AZIwzptIr2Fw+30F8aXKmKJgtzFyTsdon
         AyJ9480pbboI+Ug8cpLwGVEEOETF/ZYTKCFOE9GGSqSMty1LG6ZCgNrBMOU+g8ql6YpP
         wM/ncFhQkLAvAhtdm7Ambwed9BQJ8jdsJcET6eufkJCHN1WVFRYR5RfJGXyyFsv0+XPB
         xfG9I7zd9hm68mZW9cXv8HkPjNeWqLeAN0xOZ+0KyfRxc8ZPFkLHZKHJ9wErCT8ilERQ
         xNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/83Y2AMi1mP6MPAl9Pk1ScIZcd+Q45IY78CSnY0x75Cf+AVKK7lPEk+JdiVuqZSNHd2dFlYcvQs0xUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwnD7Y7wJ00wp/NrPAqsBGXxbqaRwFgCL8+kr9/FvN5BupJpy
	h7BCf/B6uxwt1XVR30lMPWd+V23y3jwULze4RRLaZ9D3zPrFJlu2bmcliE4KG+SxV4h/Gbrk+KQ
	HUjGo+jrv6sIksSb1OqYm72T4jQv9ivo=
X-Gm-Gg: ASbGncsT9NDhRLVxK1K1Q3Fe4YjoyIPlLs6iqZCPTMmJjoiZEyjaWMl+x3jtykUfm1d
	V1J9jCrLiLAQ0jInVTVhmigRIetDRApOgHcNOFwooyeVQM44mQemJ1xerF+TRz7Ta6gIM+aRrrk
	2Qx/1q8vLBtCIj+OMMssFAiyEnNQQtu79TN1xMzHbHnNWLcVpC10ntXfffuvSMdoM7SVhdrSfka
	RSs7FpIOvI5CHKWpd8=
X-Google-Smtp-Source: AGHT+IFr06URzpJ6aUp4DpRFc3gqIF/QKzvPatkXOguRNAK+5vyBht27Wi77YYUi7cw/QJFO8eHWzN6Nc8/pR3lh7aU=
X-Received: by 2002:a17:907:72cb:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b3026c84e0cmr5356866b.20.1758575058272; Mon, 22 Sep 2025
 14:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
In-Reply-To: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 22 Sep 2025 23:04:06 +0200
X-Gm-Features: AS18NWDVFMZZnWEreuo7vPXyYUB8RQkWA0R_TESbZnVi7LcEMvax5dEHcVzVJVI
Message-ID: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:45=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.


Hi,

SInce this patch affects the Alpha platform I got curious and decided to
try it out. The patch series requires some preparatory patches. Leon
provided me with links to his dmabuf-vfio branch, which had the
patches (and some prerequisite stuff) applied already.

Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
my ES40 Alphaserver, the kernel booted fine but after a while of
moderate filesystem load I started seeing some ext3/4 related error
messages in the system logs. Rebooting with my old kernel into
single user mode, I was able to recover the filesystem using fsck.
Clearly this set of patches breaks things (at least on Alpha).

I haven't yet dug any deeper into the root causes of the file system
corruptions and I've only tested this on Alpha, maybe there has been
more testing done on other platforms targeted by this set
of patches?

Regards

Magnus Lindholm
