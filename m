Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF21CFECE
	for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705569; cv=none; b=KZ5hl5MLvNvWEJPtygU3vXWgdD4CvCDMieEc+7DTjUIs7RXLh5dEGYhTQNjhwV1q6vYyI6NsTGGg3U6vpvD2OhOtI0EW3jH+h6j8XD3YwrU75jD/qOuAxrHnAjtuxVmHp+FDO997GZ0ugjzKgqs8KyvyJDRk7bxBS7EIcp7g3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705569; c=relaxed/simple;
	bh=HhCRM8LXsD648EezB/Ag71ruZTVUBPWIrjPd9FGl4yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrp10mIt7e7MTcWAxnSuFa0i1HwdKqnss6/PBjjFMuQReziJxk+dA478p745KK7e3vCz1lGoPbj8r4q23E77yrmR/mjwzedbRyFODTQY2oZHTE5a7cPlALAYlgV8dMCrCPiz9533eilO2+8VVPf+Gu4sr3Efr72mR5ZK6jahoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZU2ovevV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZU2ovevV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a998a5ca499so877670566b.0
        for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729705565; x=1730310365; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=ZU2ovevVAkpUpPNCNaZLd9knhxmHGnnW2er/zHUhMbhaXTalgW+K7RZflR6ARoY2yf
         CHxbOc6LCnDXwlqQeAE6vKJ9qg38XnuNHAzjqe7AJcKOwOft5ANLNPApjpHQ6lGgy3UH
         24MMPzTDltwJHhQqNy2qUf16O3liOUTWRoVds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705565; x=1730310365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=cCw5v9tNWTeZJXmVC1a+FIjR2q3I99T4a0fxK7tBCfa2tlPUjE2+HFAbv+DPOMh+Uf
         h2bknOiXyZlgFQ9zoCtlW2n5F4a+t5qN9RUZpQv40COMeSxVSCwph7jY2vew/JKMkkNH
         m7gMWXI6HTO8nCjanuH/Y9fFV7yVcw8hWcEFEs2sDEOteqdVfpTk7g+SX8/h80w+q4gn
         ilPeBWBz6Q7COLoNcd8n0CWGVmJfhUnJFBGH9agUzGUPyoSkiunPitJorTeCYl3vFbI4
         i6Av9LMDuwoJNhh3jafE27Rake98wL7mgvDlKMqY52nTYSQ+bEvn4sV6Ssb43YiqrWIy
         LrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtJVo3fGpgAcfsJif/bLqmjH/3uRjpeheqT1dO8HjwVsc0AIkmus325E9oFt+lOPqwhfkuwcBDxonI/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyW+JcA/MGvzNVOg+vP9gMnhljdV8IrwL64SLZzuPmD4a4sG7r
	MLkgEM2zLryt3xcZFz2/yAGYpRebOTESNu0RrRKQ5LAd0kZCL+AnpVL0cqUP1XdOKRzpmRE88Jh
	gGBg=
X-Google-Smtp-Source: AGHT+IHfBXUDihgfVTsvrrn9hNuR8Ax7FE15PCx6R3UKKT7aEImvE4XmuR1Ck7kKLku/XRwH/L1aLA==
X-Received: by 2002:a17:906:f593:b0:a9a:55db:85de with SMTP id a640c23a62f3a-a9abf84cf97mr323521566b.9.1729705565229;
        Wed, 23 Oct 2024 10:46:05 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d631dsm513571966b.17.2024.10.23.10.46.04
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:46:04 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0f198d38so983210766b.1
        for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 10:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVetqIBdyk3NihyZ6IfO/PwGRjDewU1P9nbq68ChI25sA3Bgq/d2SU8rKRDNv+mC3SEuy9zHjV/IUPFKQ==@vger.kernel.org
X-Received: by 2002:a17:907:94c3:b0:a9a:8042:bbb8 with SMTP id
 a640c23a62f3a-a9abf94d4b2mr369489566b.47.1729705563762; Wed, 23 Oct 2024
 10:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
In-Reply-To: <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 10:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, gregkh@linuxfoundation.org, 
	wangyuli@uniontech.com, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

Ok, lots of Russian trolls out and about.

It's entirely clear why the change was done, it's not getting
reverted, and using multiple random anonymous accounts to try to
"grass root" it by Russian troll factories isn't going to change
anything.

And FYI for the actual innocent bystanders who aren't troll farm
accounts - the "various compliance requirements" are not just a US
thing.

If you haven't heard of Russian sanctions yet, you should try to read
the news some day.  And by "news", I don't mean Russian
state-sponsored spam.

As to sending me a revert patch - please use whatever mush you call
brains. I'm Finnish. Did you think I'd be *supporting* Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too.

                      Linus
