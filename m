Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823052;
	b=gecOIahib3WziVXPwlLz//AXQGvA5fL5K2n1td+owYFfx3dJoyRo5FEzNBnW2o5dGMHF
	 m90Kl8d7MDeyMkSoO9wta93eHMqrlO0IcaW86srUKjJCTicLl5RgyWlHw2mqc5eXFtitQ
	 7YSKCqJ9mfxzYeOKWd2ZxNVb/EOAzAXjC/Psbqd6f+zTCkSE0lG6ORU7FWNEujGHk02Mz
	 88rgpvIFtFpHxYLHpXcsWEBd1muXPgNUI25HYZc8N3rikFopP4to8brQEmwRx0WHv2TCG
	 eEHFcWYVpBtC1BFMN/lsSnLZ8RLueWIEhrXvj/gpRz1T++wTW2d7IeVHrsC1/cNhw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=KExxVdg4lHgRZVCuYNkoj9ta/jz+W3jdtECMoulugZU5i4MVBufGHp0OyMZNtMFtpAQV
	 jgAQApBZeK+kVi5f5Ku57+zWfTG1S/WxY5/qIlTlt0C0SI3lIRNVKo8axKzCghx6IaCKL
	 A7FXmTS9hg6gVjXeMQNHkafJhKeRLoJHZsCE6J3TQbgO3WMd269HSaaFcdyWFlqQUpadB
	 ofPUGln30uYCvRCu1qB9Wt6vGgkZRgoy6VnMu3ltqXFHANaZ1yPN1xSuYL/iyhT2dSuyi
	 6eC1w2i8C3ZOUHvNFt4EkOMMF1d0/fLvKfg526a35oDbdB3nsyufhki3VxVyUnYYhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fuhbIsLj;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BE6070F2C
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 20:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156BE6070F2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fuhbIsLj
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c445c95d553so164726466b.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 12:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823049; x=1794427849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=fuhbIsLjFXQH/N+tiVgXMourxAveM3ldvg1RcbTC55tiqAQrq3xgM17/FbaXzeG14m
         D+/tjc+sbgIRbZUHcAWJEp21som8ron+huu504p50Kc0oQImA+4Hi8ybbGJpWVSSecji
         n3P3lU+822mGWH5IishsbeOwPl+wndHyn3nRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823049; x=1794427849;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=BLZCyU1XSEOVE6dbO6xmWh8ar3G5vGqR+PR73laAkwjXf2hOd+a6Tk/qrzhv5+3/0O
         sPgt+1nmIrTqCSseoEqypZ3LLQ/3xF8TwqUy0TAusPlQefEKlFWqENWQOK04TJHFxyE+
         80Jxg41RQA7cJB5Kxai/cKyo3YVwjvPLcrVP6iH9WVKLRTzhptzCI56AfdnA/F8PsrQJ
         pjHwIao3kk4iohqQmtknJ7WF5nQ4ueo52IuIQeRAfKC6eW4drEWeceeH2EGpzQqtRnRB
         QTkW/hgdKvy2iFL2lz6iL9ZT+rHcI5gnUZwKQp6rqjTVxvA/MDxtQcw86oA/ssEQ7kbX
         Q8GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBZo0pA3WJe0uhaZNg6uSpClAZpWQoyVYbC1LqhEM6hZ6WQXp5IPzfp+bnSGikCUJJQn9NcgTrQSn2TQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8p2D5sRp+WQNLm9e6poouLyQ1C616Jq+6P1nyDewznsfDfAXme
	158iisyp7YaOKkrrnLpqN7E9G1gf3zYYjbHKdF2jTjtqklrAL5EonR901CtGA7IaNsEmgTYEcDS
	/P6BpLAt3YA==
X-Gm-Gg: AYBFou0SJwDQhExYHFetKBusCs/vqLW/xpfq827vwt7Qh7CCZrFUsznZaz7mAZLEyvo
	nDnBda1VYZTJnc0CuP46e7qh250I4ohmMeHA97CFssqwNCCpfvwaagN8iwi+EqxllV+sLD7xwIi
	2UW2bUnExhHFFjKmJdh0RtF0rfU6KV5xJd3eb7vwwGfa2cEV6z7CEXzKKD0LX63ZZv+M85JxtCG
	7rUTmqdG9q+yTANqPlLwf5pv+FM1m+jSPUl5W0upTWX0xHuUM2Cn9HZjMCOMv8x6ZRww/4w3sU9
	x7Yu1gYcizGPkKwwYYZbkMLrCTPLE7ZsRHi0ufMybXOfjp69dqIBywDEq6gyq7EYG+raA5lpHln
	ojckjha/Zr/kDzQieOUZqSkzOyhfmlfMsXlHLlbT+E2YBrOdwdxcRbdpXYllM3xQpfzLII5upva
	ewyMlSQCrwxCyvBJvV2fSMxjV8tb8/tHWq5bkBSPNJmNzp/NPBHJwijrez/XIY7QH1mZ/vDIH0c
	yBDYOPoyXTceM2ax2dNLMTFHCexha6ZBHG/RZqHGbxNgetl0vVTwwzTOzFsd70wR21+5GWyXb2a
	c+IVKpBpmMj4NiFFTKaCLuulkXxx4gU7ftZi0/wFa/8fi/6JTzBXHse9wdbJq8XgHUYiYk5ArgR
	44A==
X-Received: by 2002:a17:907:96a1:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c4ca7ab1161mr1582381266b.28.1793823049320;
        Wed, 04 Nov 2026 12:10:49 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48c780sm102773966b.65.2026.11.04.12.10.49
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:49 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c445c95d553so164724166b.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 12:10:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxcQma21+64EGaM0kO+ebPYLDPFfCmG1xeANl19Qev0IIWVxCrLuUN1ZYkMTfyGgeztVlJ4bqhiuc6TjA==@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
