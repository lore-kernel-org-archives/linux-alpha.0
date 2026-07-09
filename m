Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C017E301471
	for <linux-alpha@vger.kernel.org>; Thu,  9 Jul 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586948; cv=none; b=NUuMO/bN6j68WMz4miyCtkOAGIPcppzaWVKbF9Vj1hEEjGFXPv7LjgbdhLwMnQgYWBUfyzHEzi7YB9e/9NamLIpdaASGkRGqaxZAXPhvz2Q6zqS3Xsq5rc7H1bUyhGPh8zgLlX9Icou6yFtdB2dyDMxWQl5GwmOvIf8lZLmR2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586948; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCT9jzyhdf9UC4fBYmE6ZdYRWCBgUc1uKU28hUZ+oQaLWbNPXhg0EsGQzQQmEhFYB0RbC1Y5riABejIeVyvvlRfWhA+g852w4HJmZXtW1JR24L5IRpjiRIOgcdqNQJfM1yQs3HwNQ6DnRfBh5QKKBiVuQGhczXYyuXc3uR8B+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847aa193d98so1352857b3a.3
        for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 01:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586947; x=1784191747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=NrgjRaGiFlJjOQ/PvmRvoQUjZr3/0jP618RjipgRi0b1Hh5TvlVNoAE5NthfPTRe8q
         8iE63RKxsXMJbob4lb8rpumYzZZL53ptuapwGAa58Rbbl9S/RWxXbS4SZbf6T5GKmn9T
         rBvQMgAcZwsLFEHDKZBPzcMMsKHeC9VAPMLQh0ijqt/4ER0LinW/yXm7dpKk7dwIaT5w
         GPT4dT/AEkT2tNyy437a6faylK1h13K/WR2umPjfphWRT/QAvvEmgwmJIeesiWzMV1Os
         lIR7LYnMUDV8h13H1kPGRCrnprUj+C20gpR9QhEvbGLJR0VKoEobC4IQPi7fAmEylQNh
         5QVg==
X-Forwarded-Encrypted: i=1; AHgh+RqB5NwVer80wh+2QfUs3BlnH048YKtpmyx7+h1Int61uza2DaoVLBq+zL/1Piug8Ed4gW4ltgZPBx739g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8QyaYcdAc1ywgJnNje89jPWAaSoPpfq/LcjwMd7zEydt8uk1f
	6YQUJUIdwWcR5G4I0I4usTCpopjG++sYGRfx1qv4NOzKFuTP+Uqy02Q7rxQj5f3SbPk=
X-Gm-Gg: AfdE7cnrBfFmFvKgvCg2vNTOXHuFycq5soJTrENFivpQa8SBC0JjCb3FHnL/v+iSVFa
	Rz56OxtWOyAks2OveHmijxHrzkJ/BShZXH6fHWkOhzVj7y3RkEiNtCoNLVSME5b+afUDjm/ddnn
	jksOGIfJDpcyJmVzyy1vzsR3yCbiiDqDoPkSG8KncBPVJS0J68aL22l+1+7SkQa8DDdjr6nFFRA
	/vJDPlKaDMpvrGC467xdFbeT7r41XJsqoDyKq7jh2E6iGKn42u6biaRKH4ZmctATNf+pK3/qkWZ
	3CtiV5h4AVSeIlJ4O7r84KDZ1T3eMB1N4Im2AIGtPdE2sjAqCcf7/uwH2cje85BD/tkAV65NyrP
	SIUJGLsS9pfNaqH/eeiqLRl+S6kinu9dvvxnvmGRWFpOFbBCgfDUdIF6B3yVTTfS/r2kKzmqPrM
	8sE+rwvlxVlxeD74eQGsqrdF0WxVkFnyLQhKvbjtzsaJ3PWXN7qDkGrA==
X-Received: by 2002:a05:6a00:418e:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-848436754f1mr6262035b3a.68.1783586946902;
        Thu, 09 Jul 2026 01:49:06 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b36448e7sm3395637a12.23.2026.07.09.01.49.06
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:49:06 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso147389b3a.1
        for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 01:49:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rou40rP4hSmlNb+uLaC5rCTLxwhswRvqlXqpnjn3vGeli2ob5MF9KdWPfMWwf3iPDxHrieGartGCKKiVQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
