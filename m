Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872817;
	b=C3Spi7Xe+sR4cj0+uZisUkUxBZb/p4jqmyClf0mDwLDgSRIB2bCUkTK0MRakMAtBKeFE
	 NoPshGCSmNK1o6AgASfOxn9r2wuzdQQdOQpD8CzVYiNJzkiyVm1Dr6QtrS81nMe64iNcZ
	 WWqj6DssDDEx5Bjs7iIMfFhvJJIAuQ81LHWFuYuvLo7GAx4JRRmHkq7og8ICuL9wZI3Al
	 6unF7vR7HG8QsGM5XV7JY4ZtY3be801KfGAiybdMvB1hPzGkJbTPEtztMwvIevNtX3o3Q
	 8m/btqnDQWcMZWl5K2ckXQeZBr40ZUYlmprajvnX6pS2SoZqfWL6rptldo4vT9QpGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872817;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=ShsPoVInRwYdJlYjZ8vNMar5w0LYQ7MbazTy0+ppA/w36rx4qyRtmhEQmdcBkeTgVOwX
	 GlH2Ka9s1UpNL2wg4Yg0Ek77svp7aivWiS9V1RBsFEnLZDtjSymy4uv5kckBw7fMKdPl7
	 Qw/pa0qN+bYjoVofXlQXaAIIO9yBc6gQTDyAeD4vXZbYsEBm4+6j7ow2sN7pASga5SpXu
	 FfXITvtUJaoJqpDNo6wgJIOetb6S49XJUq2mmtK+/8SSqjOEnvhR7YCr936cp9zjZZIqx
	 YXMeAzMKcTE55VWRKo/7xzrWO4M73lYJDeJdl1gYDPcmJXlrhQVKFwu0/MZqRiGeSsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE1606A326
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 10:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72AE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533778ab0bdso18525661cf.3
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 02:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872816; x=1794477616;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=On4cIW2IhFMFVvJxzavPY7M90reXG/q8xeWRUp7XIO53f7yCYIz5XnA3Ma02RlIZTW
         COD3UfNzdKVCsyhHLGQJQYzA6bkpdy5ZdjxNxqYRSPwEZK5RQd9XRdCwJheKYyod6FgQ
         amfFUA3qhm8cf9EWUM+Jb/ZroCRdrb6kRHJCl7dRWqa+5y70IoJ/rT/LXDP1sgAa1QED
         T76AdBB/eJOvKcf8Uz5c+qbduP3i9vmV36+1pQ2A0zVCtapN7SINLIJlzYUicH/L/RQj
         cU/zam2v9/HWl2RiM2uizQZ59Js6vYDfbJsm5klW7BgsAT531+EmvKD1hEdUYu3I1t6G
         PUgA==
X-Forwarded-Encrypted: i=1; AKwUvBxaJimlJfQRxTbAAZ4F7Y7KbnPsORqiN23YUQ3xLCzkRWaabiN3YkA9a+NXWcvGxgq/fbTKwqwQoeNbtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IPcATvWmxJ4+IG+zRFjEEH+hCtniO2JAKMRWfei+xS0WMLvKl
	GBvvJ2VpI6GHJHpCcRQbIhktedhWiZIl3TREdpb/9vCm6vkmruYdj0BUiFv7XuBaBdc=
X-Gm-Gg: AYBFou1D19pRSiBOQoe5jV+GO93xZFkREoryOMCgfMf+4fQ+WzKT+do3HZq9IvFFL6z
	U7AObVLxcV/628Mo2w0zoIuU7kZLvT0xqmOKlTI0WYRX1uOjmr8nrg+JamEvnslQUUiVOO2NNyL
	M3Yqly8epYyYTST7/THoeL4F0RNonpQR6Dgiwlsiz96bsI2VSXN1DyiKw4kSq1jMju4wd+DHquK
	YuyeQmXtwJ5m63CX++u1Qn4iZf/lpMeJGD6zgPTkISGPrI7DJ/oBw6sJ2ykSbTr15PPfmMUkZDG
	Bhbjencbp7ECCuESNv7M1gRkbixzDIhLiiR7Im/dmX6sJXvjX4l1qXzHwXynCqLYSfYWXKvA/+J
	jjLjZgjKfea+6r3jdDhs54xdx/8r+TjlqLldgWbMXZie4sO799iePLvdpu4mVEpY3AgUaslLJ+H
	l1RPS1leTj+5bOSQfVKL4G8aY8VWAqvm04IKr1V18kR+cYgIOpeGZggJx+WNyCtuAZfToI1hrGW
	z1q04sTNq7oTNbsMkkNsbjItQqwoLjx2bZPcfduHQuackysz9HZ01pBGxp3HvdJjpABS544LFmB
	djW0aCCK3xnipNPs/ufTZ8cgeRJorINMAT26KrRIYjMhjYXYKhFnuy8sJDk70oHBmw==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr322233851cf.51.1793872816137;
        Thu, 05 Nov 2026 02:00:16 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c48836sm47808371cf.21.2026.11.05.02.00.13
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:13 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c7a0c1617so23358636d6.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 02:00:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxKZZBtN8V/nx1+ISxkr1kMxy2LOX39059P5Gb7+iZ2IjQp3Vzj7oIaaC86hvP5Ux8Zwo8tQ1NmCXbZhA==@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
