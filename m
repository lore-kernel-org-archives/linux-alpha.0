Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F671E5714
	for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764437639; cv=none; b=mQvxaPkaGdkFZ2ev0CdvQ6oUZbWN6oAguJebp1CVPU3l7hE1YsICMtqu+HI6Lh49gCYEqUnhGdUBsx4TLSdxKlbUzyvgx/qZ+aC3Pjwud0cerTdiGn+OOyVR5+QY3VBrVO4VLnMDNUlvWioE0eQV6DMMzeg4WAI5bOrhBJyyKPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764437639; c=relaxed/simple;
	bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8tWSDSJreBEBFi+FGLvD1oXGYLsMYieWTxDt6ahQCkPkNlIFrdNuN7KE1qaiyiQCDpiObnpHW+x4f/TNMNuMWt+u+baMxAVru4+wc6zRWV/7ngXTI0ycSGgINxGhJV8LxoFqNi+9D5GSsQLkODLRnTC3ZcWdc8V39M74CULw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPfOtUke; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPfOtUke"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so5142454a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764437636; x=1765042436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
        b=NPfOtUke5k7Af6oeX/NKG2oz9fUX0rfOZ7kG8s9y7Bi1+4epsK37Zc5ohUo/cGPkX0
         +wz21T8lJrx6/JcZV5UVGyHVO6PN8a9zLLYcJFDHt040lSwJ2IoV3X3uqjJfNXSfAMIL
         1auZJ9VWF0hDTu4U7q25tqtbwuEily2vuJ8t44Bewnlc+OFwxWypYGTRWjIbxrHQm9l+
         bZxEI8446YxP70Bwxazzo1iErww2kXfV8fJIxroH0FPnd4747hi+uxX0VwQNLP3as6LK
         i2AgBPsHaSim15VNnMx0gp06pIdoaN/6snYm/kCweJi83mZAM9i79flqiMYkC5nfXSi1
         ca8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764437636; x=1765042436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
        b=IywFNKqKKXzg7M7FAiJvNUQ+fAaDqtz5z7bI5B/wZkWsil3rGgUPjkSCc2/svpALS+
         BuPIiraJYwnVlRe0QJDVH7pQFadz/aa57ual2QhdGDiSr+bWAPrNy33EWtoWmsgezQS8
         ealMQIokW5vyKjt3ZFBqO++p2qwf3YMZ6wOj/jpGn/BICIDPdyKJPowEHjB9GYXQItDd
         itMwjHi3t5Uyk4yfuRExfOCVBHVflJJ+67BPLtTM8ugUK+hcRoQw0+KlfJCcYfnGpT0H
         20f0nHA3kd+8SoSJHsUrL4w5Ay44Z7XBfaLq4yDrA4fAeX1JP/p5lO4haXfbEBoLWreX
         BRBg==
X-Gm-Message-State: AOJu0Yz0e3H0h7SHci6r1f2EqwkFCokaeAwRHeK9NU0URXR+BH32l6+X
	/uV/hBGVQq0LrlyWIpmjA5LTUy+gYLItyPbaOs7FHZ4fkHVCA5L2N5f/W5uZWwfESbhKDytq1g8
	ypJf44/gkSWizqPpWa62acDWqzynUjUg=
X-Gm-Gg: ASbGncvhhS6uRWlT7KoTjLtShwhtdGMFrLs10I40AZxFvo0K+9NwvDTbQZYlTBs3bET
	oo42yo2+P4NS/7o1VpG9q5M/YGF6UgtpU4oVqXDFzJtNskjmj5PV2u4z9RQqm0+swhBqaAj8TCm
	owK8Nxih2/1KUYDRVbfBBXF1dJskVMdvtb3lZhPWj6Zt2FuH/8EbITby800mksfz5px0Q23NCpV
	RMw8c90hRhbAG+6h+kxuZ7/broZZeiEqOel2J2YjkBQ20gagMo31u2k/6p7TFb5xv70aBvX
X-Google-Smtp-Source: AGHT+IF97TVQKqd4QpF5rZw3LC7DwErt4VbnYQU7X+rMmOoGn1BNPQDrloDRnIG6wiIw7nVrZXk8P8V9HT2dcIS4XAs=
X-Received: by 2002:a05:6402:4404:b0:63c:533f:4b25 with SMTP id
 4fb4d7f45d1cf-6455444ac37mr33624439a12.15.1764437635420; Sat, 29 Nov 2025
 09:33:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de> <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
 <aSslgTu6_HQfhbB2@stanley.mountain>
In-Reply-To: <aSslgTu6_HQfhbB2@stanley.mountain>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 18:33:44 +0100
X-Gm-Features: AWmQ_blXJLKqQt2Z7fhU_XKZ-vP-poW5knLgf4NBLeti_sq9o-Z362H1NN8Ndes
Message-ID: <CA+=Fv5Qm1g9JFaeVXDjXRgW8BiPCbsvHJod50Do7=KZaBvLssQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use pointers from memcpy() calls for assignments
 in two functions
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-alpha@vger.kernel.org, Chen Gang <gang.chen@asianux.com>, 
	Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"

>
> I feel like generally we decided we didn't like the p = memcpy() patches.
>

Thanks, yes.

Regards

Magnus
