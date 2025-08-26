Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E0E307491
	for <linux-alpha@vger.kernel.org>; Tue, 26 Aug 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215186; cv=none; b=rfDzUXs1ZcIyu+rh/Yfe9qvTbqriSH+3O0bhO7iODQ95xl33pups7BIgsGinTxVLbSubnKpeo+Gr/TcmUAnpSgvkH1Fttg5maBtz6HWs3WrgEbBdS0VEHDkQzBYEytDKxOImrMIUK61WXSmnUFYhNrxKk4ao1yld7pRcIaI9F2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215186; c=relaxed/simple;
	bh=oWw9E1ARf/liDxi+bd5estjy09+4qZSi69zGI82k4YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIt4VjnAMrg8KZXA9SmBRNl0PtgzgJtAYCmM8ax/brcpjiq0QlYHX8Y4c1b6FJkX+w9/BSHYGsQ20Uj0q4kMWWTK9Oagmpkn3gWf84kP0SV7RLqvuTDb1sZfZ5j8wJkdkcJoWfTFWH27Z3KW8bLFr8r4hkMFiLCbdcKEF+ttbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0m1reDW4; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0m1reDW4"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ec4802d43eso11615785ab.1
        for <linux-alpha@vger.kernel.org>; Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=0m1reDW4hAfva0Q73AZIZFTIW2ixbvSgs1vQSkyEGR71DEPrhBuJXaQURutOBynY1v
         2vRClAv4jZk//2U1ABvIoW9v9pGCEjVPeKeR+P/vYwGUnPmsYJ+9pqOPBMvOiGAzGRzP
         aosWWb4mReYkYDqE5H1PeLiJnRbxcS0Qq0SyAjn/fjYVFcHVzlhXddXAE9U4XP3AW4+r
         QnLjmrPENmFKAcl7mweDO5NL7ch0MnNzF8xhgTcz5DAjI33bNIZdZSSxODvDi3NoFl0E
         BiLZ9l93jMHK8lYXw+QEIJKdi4QL95i8PbrXjnVnp9oFJBpIu/nukcCslWqa/rAaYuRa
         hDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=T8t6TmWqcRy0o5wXWrIsO2sdS5mUhliA9q/s2fFp7rBF083L8yEYJytRXPU1laxARr
         G/m3QcI7XrDnN62NwaPVv3NDPOkC585vDfdgowXB1OJEUwOcQ61S3GzCxGpj6OPD9/Pd
         HUWac/1/0EU3OgxG46z3bjVzhKLI8rf0O8Zh2C5Ljcz8wCGKYD0jEgUFNh3f5wqAWHGR
         /6E7PJZMFCq4K9dr3cWHxNXn/Eav+dbeC/6fBO4qkMxPyCX7K4gqulvJMQ+a7YryGkb8
         0Oh0CcFYl0a8yb07gvWP0h+9fiEE5MDIOpxmN+WAku0l1hhcjj6hzoz0L4ZHbOFWlkYn
         Zpfg==
X-Forwarded-Encrypted: i=1; AJvYcCXd3B1kqvOy2tsfdCapKkw0i0fkbKvo7bLB1dFcJ1XtRcd3Cu0QquYW4flBC6kMJS/W5O4EBbUTZYl00g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3NOKh9KqYwF+VWeqUifD5nc5SUpO4TK/Wu4xZ4lRDSU9Ar1Ud
	0exR3koGv6Ay9612yGfwi1K6iU/ihNrfbHSIbwm4szwB7rVYPGnx/QYX7Z8LVUqzYY0=
X-Gm-Gg: ASbGnctV2uQodUgt7byA+8ihFdIqUcIwGHRSvT8vWq941xeb9ZCz5qqN49LsL36layt
	UsBRwVBzsX2wtVycyZStTlYJLfsMfEVGqUgU0qYGRiuiMjfjm8aF4CHfJhbnHoWmfsUZAUYzQ0Y
	9il1dtMB9vGZzX7miQ9UN9Qwkn3q540MqZUvZmOktoYF3WfodYcBWzgPGHrkqwzoY+KC443+tEI
	bougzfD/s/q07CPLlPqyhyHDf5yXO90HWk/yNJpHTwyMn1x6+7o5D3DztlvyKrVANA9DV+WbZmI
	A2nIxOMCc0zLajjFnLUIUYIRz/6pibBSURt+Q9eDnrht0RKoe6pdh4WVPKO6SSBSEn9DlIaWWUp
	ECarD0ys8I3bC6a9IQJ7U1wvySLrCqQ==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe
