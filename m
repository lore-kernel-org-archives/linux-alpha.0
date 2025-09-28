Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42152DAFA9
	for <linux-alpha@vger.kernel.org>; Sun, 28 Sep 2025 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759058847; cv=none; b=aomI7fQ9M8J0cu85x+CBZwISyKp4LnJJzqc4SzYa36RGewqnjsSWDS6sojzaPKfdHfLgr881/+nJ2kNMQ3TejlUnMxJqsWtDnsRmGHkKrJXC9bRuoJ30RFkI5p+E237c7jjU6XzRGeLF10E0TN58b+uwVgN/cAtLaDE4untfyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759058847; c=relaxed/simple;
	bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOvlkBjqU5Na0jlkDcvJxhl6aK1V5ModwyNcEjSKkGT/USbavC1rNN/huBUS7eNiCXYcAHUjwmD56lujfrkdPqICTMiKkKKP/gkKwMVRVhM1DfM5hDBzROBcF3vm0++ZdQKkdnlLrX76EBZpF6GZSqjS/f/FtxZMaeJ+MME3Rbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD7rLhiy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD7rLhiy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso8019068a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 28 Sep 2025 04:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759058844; x=1759663644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=HD7rLhiyBlSDxVwrCkE0xPoKFjzZNj7YqOGmlz/JOCZQx38qd184OxbDZ63s93e5C7
         9HoOlO2hmGrRDbT/G/IEAidchn9KOnXBA3qs5Jlbu1oJFDzIhTdy7ucZsvNqeluKhvp9
         BXwHdRREnX5s2HRYUuH2iOaaK7r/Zms/sSRqlqOuI+EMjXEdOSQ1xBsUwtACyjlb6yVa
         LeG+JsjjBs8kkW4W87KZXgfF8H1hcjvOtQZOZll1D8rWfUNNc73GgspfsdX0mO6rwtBu
         JmsNO7Zkn27XyoutBK7KD7/eQMtp7A8vYCEizbGZ0TLWQPEP4lwcr7GFbqVJFX4QDSmK
         WhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759058844; x=1759663644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=b7eXrq+81HHNUo66KsbRyjOE4DV2bR17r+blzf0gl1oHiZy8cqKf7QP5cQoPjNrb+6
         KPnctOcb/zzM3N9nLTBwY4BRJR335lSFVsvkVkxqe58PkXLSy8QDtOH4iAmpQZfye3ND
         4lmtVHP78SQMOe7t00g6FYDvZGPLkjrrWAHl6D/9y8XKiTXSSnQ6BaD0X2LlaDoRl102
         9JLGsd7g18MPfwzsmP2Y5JrSVEkBnl0y+1foEWsI/ICNEEoxZuEnA7Yoamgz0G3FL9sk
         0KloegGw97RtB+UPi/52iIRgedxDw9uREQ6IdiZ4UmMUQtSm4aHe+crUglYfj7aojV4/
         IgXg==
X-Forwarded-Encrypted: i=1; AJvYcCUrI4Ii+VUcgBHUyIWb8dvUmNwSDzx82ykI3kX4hWN3pgPET96Z5AWBInNrdsxOccBdvfkNKSgJnHpacw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJt4CffocgSbqy/JMb6opHa01yvSLSB4OQjuYn6XBWHozmzJP
	fNR7xYc+uoyx8GpEdWTDnA0rTT3syI+WKH9un97vB6dHuFtfg6svpQ8dol5aCy6h4zQ9LWazFr5
	BguPjJjpO+YT5dSOOcfTt7YLA0vaxG74=
X-Gm-Gg: ASbGncvPcj8xQM/r+HTsIR0S/DZHwiefZi0/q6hZfasYz8c0IZroKm+5ObQIZt87YHs
	KRrrUQzC11v/gega3yen5aaBUHkBktXXChhZVrW9Veb0FMqKcjtJEWvIHzqiuxAi6oY+Ic01JU5
	QFKt0D4x45PdAyIXx0xkFz8DdFQpbVV3im+GEoUgdy9YNfpKmUaYzMWSh9K7GFApof1ot7Sv4/I
	x8zHgGhc+JAbYDrsRI=
X-Google-Smtp-Source: AGHT+IEbmR6jFZWeOZACTqVTuyroT1qollOj9im3bB2gCUN08/YU89k9vFmzDRRbDuqGeOLmGGtFiulh5CESx8Sm0EE=
X-Received: by 2002:a05:6402:44ce:b0:633:ddd4:4e37 with SMTP id
 4fb4d7f45d1cf-634a331587amr9387899a12.13.1759058843815; Sun, 28 Sep 2025
 04:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com> <20250928105413.GE12165@unreal>
In-Reply-To: <20250928105413.GE12165@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 13:27:12 +0200
X-Gm-Features: AS18NWDQy06zFzFA0Tb4sMvL6G-ftUfrOQ8ZIU-yy9wPAEd2O_xZFFnSMKmSHdI
Message-ID: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
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

> Thanks for the effort.
>
> Can you please check the following change instead of reverting the patches?
>

No problem, happy to assist. I think this did the trick! preliminary
testing shows
that this now works on alpha! I guess the offset information in paddr was lost
by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!

I'll keep running the system with some load to make sure there is nothing else
we haven't spotted yet, but so far so good. I'll keep you posted.

Will you be putting out a v2 of this patchset with these updates?

Regards

Magnus Lindholm
