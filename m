Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962344E647
	for <linux-alpha@vger.kernel.org>; Wed, 19 Aug 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138768; cv=none; b=lUn6eMkwmg2NS1ZP/CGVBo0E8NdJAVeFUgp0ulDlPEjNIn1NILHDmEvfQvDpPBXOcHGNZ5yujwaOmPGlOOm/Ai5ip9R/JtLE4sI9QEEHN3v0n0mQTp4ganHuJbD4DuXQAknMJT4d7LJMbSs5VVdCgQmbQP0XyA+fLd93SGYjpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138768; c=relaxed/simple;
	bh=DlndU5taWNx6tKyg+8t2Gy/P71MCmKsz3gxWRPy329I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJopFt5y38CNlsP7+DEschRv0p9u+D3PMq5+a7sjNxAc6ZELMbk7+SWgHFO/orj1w+jsZYgxaMibyu7ZNN7E5u82IXZjWWM1ErrA7vosM1MQ0B+C8iC2+ajZwxJytsvNG/3ezQO5EYl5IhqZmc272Oc8KVghprNveNLOYVPgs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZpNjHDY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZpNjHDY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f96c5b722so504909f8f.0
        for <linux-alpha@vger.kernel.org>; Wed, 19 Aug 2026 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138765; x=1787743565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=cZpNjHDYrG/NDMZpAzpASah3trCCU/navF8+/9Q13fH6ECf0CuY1Pux0ujWdtZEuqd
         SJdqrqz62f1IyzZI9CpY3p4ke9eNjET12J6CExFx4SFRvVOa3m0ysdZK7UP3FezgXgJZ
         BxQ1VcXHUcpvLcxZZfpBSQHxswwWXerOdebqaJZ3Tp4x9LkupeLR8Whh4WghQrRyjlPt
         cd1RakSdQfSW2aUUb44T1j61xh/YBzOph8Jcxtik4heGZONZzZCyC8SXk0GKquXq6mN3
         I4fRb+PAl8ePOwKPYhpSU8OX06zRVLBmH+9MIIW/m3/jjaISV3PfsvextzGQb5uU+A66
         7egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138765; x=1787743565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=eg9kVlH7XsfSVtTS7UlvqOXmANy32j5E3fHFrc/Dwo0wo5r24vYjD0BYQVJr5Pqm1g
         VL2atc77pTSYIwhIzByC/pJAn/oyUJznUR+mqE8HB8yxTV637o1d9rptiPofrrCO9ZeL
         xyaRa7QT78j40JkoSo00FOCntaaPoW/G4NxrcvetzU8LO5NXoXJOyE7fNQ7qHnJVL3Do
         F5NJFelZTajvbdcDUzvz/JTSCRVXzJpygZr3+sfJ1557TI2EpgcxyT/AXesS9pADtrjQ
         0wTJiR+qfqgEufKu9XifYXuK4XlJnqj4tKI6KuVDAOFoXjgKcF2BkyGehOicVdwkszNc
         TBTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrs+o+dUY6/cZBObaiLB56eVY0OPXJGhiPIUcJSuEGQzo6uj4DVjxWBBMkr+0hKn4yOXljz/3mkv7h5DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lwiGW++tb5x7sWsrwcKEuHVMLr8uK6X88v54inlNwGkCWuPm
	UVwqIANReZP5FVcE8nIQfu5FuFK6l7iTJuC+smjvDrJozKRqkJ3OtSHy
X-Gm-Gg: AR+sD11N4/2r//6XxdVQ2fg1d30/imkLqXAnSbauHWbTZBW3VqUmMiFkQG8rV48vuEs
	NuBX3Gqn0S3YAuGLq9poqIU0u4lV/T0nUZYDrVHJw2Uwkg64KXjtKklguo8OHeTsEAvgkPpqYJX
	6OhxVCkk2PwF1lonWoDKY9bIJd2g2nFj3flZi8Xvio23MhajpkA8CIRQVDWdnV9vqt1hCyOKp44
	3jLFC9HbtID3ScH4vEQrgD5gP0EPwgLTTaTEY8AKflo04fomlUkOEPnXkrii77NYb/rYGDDxK5a
	AK9rnd5vE3ub29qo3MStc9HcLWXXOTDBNeKEpRfZlqaF7Z94UAc9f7dfE0zzZKwtIYAxIPTn2nW
	JjteBxN4qARNjQI0/L0JVnBbG3VRfLQV75DoI1PCZcjmqjTkrABkSdM0ShDZUgRzmQ41awBYmph
	GVvZdZeGeUGCbcfJgaT2DJxTd+JOwMsLzOIrkSUFge4EM51RGyZo64mnHORvRmRfy8JyY1L56x8
	OD4dttkeHZnLUZj9KVm/QBkow==
X-Received: by 2002:a05:600c:5253:b0:496:c18c:f9a3 with SMTP id 5b1f17b1804b1-499aa19a172mr62224955e9.5.1787138765123;
        Wed, 19 Aug 2026 04:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9dffa59sm74622055e9.3.2026.08.19.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:26:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas
 Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
Message-ID: <20260819122600.6324a511@pumpkin>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
	<20260803195135.GA1083357@ax162>
	<CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
	<CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
	<CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 09:24:37 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

...
> Wild.  Where did you even get real hardware? I know very little about Alpha.

There are two PC-case size alpha in my garage.
They have PCI, 64bit PCI and ISA expansion slots.
I'd guess they are 25-30 years old and are hardly used.
Both worked last time I tried to boot them, but the scsi disks have
stuck bearings.

They are close to going to the tip, but could be free to a good home!

	David




