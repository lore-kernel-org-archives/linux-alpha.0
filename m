Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24328C2A1
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596329; cv=pass; b=nF2kHVowgOIq9kwI1s0E0eNKA9oUsbCsZzVHUXmtiLLXV4Mewt3wO3llfAcrVUmB3LfxK/O/EudXGeCVwbcad8AuzqjPC+hV96SmKtDL0Y6zZn2MTa+HpH7eDz1nbHLCA+iz3tm1udbKgKbaCp8E0La4304PlxWOIWUXhP8hl0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596329; c=relaxed/simple;
	bh=YTCJoB15q85m98YBfoe4EA80dDxBYWKHug0syEFnSsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4WQrEiVu/Infw1y8Xu36Goa0XvsbHqCYCW9n7+DJc5o1tZ0Sl74KwGUOHozXj+/yiv42xRGhMbe88M3Y1qX+fkX2dkvN06HPgRbvYAyQqhJaVY7TJ927m6AMSKZWtASIYnxvHn/nrnFFh1GNxekxNjW4PSJyddzPkpuEtqd9XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL3F5Q/X; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL3F5Q/X"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a87e23860cso4475431fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596326; cv=none;
        d=google.com; s=arc-20260327;
        b=AZz+U4YlOK9BYxBsptml+NYCnR2NsjlB/xJLx3ryy/rW73W1YHkUQ6Odm+PODPb01H
         kqfD8IxKl3RHyzXM+0i3WaDbDUMLWhB0JAeFIimTTGN2GIWnzp9Z96frv2qv05mH+QWw
         bQa2Y9Lw3C8h5mBeNgs0OWKK3mFWsLfY3Wrh0R3wyIjIJ8T1on3tkIt3MxPZTTL9zNQN
         8DPr75QymQ97UXwj2vHqlKjoKiMSJxqhEpoDWTcW5Qcy3WtUcK90Sy/ODzr7xupm4NpK
         DfwqBwdY3DVrwtgDmICt3wCxDkQKrycHzIii7m8HTDBAPfYTJo87FfQV2+mIEec4+8JO
         qlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        fh=T+jYeck/O8Ljk0X29wnSEzvWINLh2EkOZxf04ciL0OY=;
        b=hw5p1CTQqUmtC5x9iVxVVAP73EfceqX7tJMCC4ZwHYneZn8XA3kL95c6M4RvwlPSMx
         3Zo1ic54CAsnTHFfv+Z+FW+59mTNvWzOUbzP+mT1inCXD+5+Vwp1gjm67Ssv/oTcO/l/
         hrLsm0sX5854odl9MqMEPOBlbBRT9YFOaW60KxvfAkiQNjl/ndUVv69Ox9gzZhzIX3Hi
         Ek2jMRkCqDDMKXSEbfPzdW1PhlCBX1kB16TAZ+S8KQjqgU/InUkFTatiOvXbpWlN9Qr3
         0R0ZKacaPjMWZxlhoyQvIeV1izvaB4BxUqK1fmS9rVzmzeKVqwJF+BzGSDUVVKRRkW5Y
         B0Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596326; x=1792201126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        b=PL3F5Q/XFQJGZAYB62IyCy4BC1kCwQ4COb70YeIzcDzXCLxsdNvMYKJTUZ9LMRi6SI
         qn7cp9NgrSP5sjM2lhC6XsuR++CwejaKfiy07xiC9H9XpNyROSgjj6NoApmz+9zWXw86
         sOJ6DH+ohvcBIEXeZFgNpJLDhSZhMgx2XpeaftrdVi0OGsdaeIJph+zZKqTCblzukT2w
         GyKeaouJY//UAK3V8nnmzdJIlvmZW3LUmStDbyH2q4zO45W7JYLdMtZswngL6HlrfxK/
         H3L7NW1siiXaKf0VhZc3Q1hYVfv62/1TerKUXtuvi1p8ktKaw0ICrLYdOmhl21U8WKni
         psig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596326; x=1792201126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        b=Yei8xEVI+Ii3q6Iu188zFPAzUtW7pLo7goSj/BY8OHE665sodNNdml2F2j2CyKNU4Y
         P6hcfriaBHx0s2qHNX3QowrwDIBagTBUsEfw9MZkSPjuuK7MI4eEp7/cPy35Ixpi4Jdn
         LFUKYstEnrQQeMRW15jEXfvGC0ezxuX6A0iqzDEikrTkQ1HjLAXMgfwSVnsMpJdJyJ/V
         POL41sNzPf9zuWadhgceYDiihM0mc7AFE2gCEULgtGjDR1Bdfr8KXSsx6y+eiylaJ16m
         0elCn2gLMWrhkEOUEsVzzOfCpLZJM4+p+OUse6ULlplgcRmNHp3fRcPraUWmu6IlBs9J
         x/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQrAiQVUIF3y9uyBIRbPd0wf41kJi4Lkx55AreVt7Z4tB4RL/EPBYPWLbzlTVRuRNJxKgiE14ExtvPSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKJAsiuNqTUdb8BtaHAMPzpOr12yCxCp1tN/wkXR9Zubvt69eY
	BbcTh9RVqk+91N9+VktaQZFv+YMdmZ1ZCwFwkay5oMThNEyBJbdkSjJ389j/ImwGj9IMXCEZidr
	TvWPI39jyGiKmvew6nJNYJWMjrxeAdin6dXGt
X-Gm-Gg: AYBFou0Qy3VQaQO7CHZz2x6kTGAqJKzuZtBLNFttPaEauXI06zvvn29riuEQd31X+Aq
	XNcdmJmyyp82nexFYO00NabZAB6sr1tGz0jgGLTU6mWOLo9APOEFs5P3z0KMTdkXCS4lMBChWx0
	62Bg5nQ+2WFLXQGazuKZsdJU2syzvYr+AHzZQutu77ELiaquuE2E+2sOJ5Ngu8jRjk4EarEVMcD
	CY8POMMZAa/ZMDtXVfDu4/H7VIaRT1FoWL1RpJBjOG4QNQBlh31QDVuWAgjWmf4jehCK9GR1Bdy
	muT02NXXgIQzq+d1mIC93Pfp5voPcE/TFQqH3IA1KJFYfzSsg975vlVrMXZxaBIwkweQl5SJg9J
	3xk+WiW1lzeKN6emeTP7Nxhoul/PpyFvQEopJMoAMz41wyyu+En13n1fyS5y8QoJUpnWrlgY=
X-Received: by 2002:a2e:9fc6:0:b0:3a7:7cb7:6fc1 with SMTP id
 38308e7fff4ca-3a9c2b33e46mr8206521fa.18.1791596325760; Fri, 09 Oct 2026
 18:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-4-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:38:32 -0400
X-Gm-Features: AclHuK9Fi1GndyEHj7ANB-B3irwZ-xExWAZmGHD2ngXtyZ5q064c9xKFsIu1uhI
Message-ID: <CAEdQ38Ghh9rBzHSMoJ7WwwVWgwhou5d74KStxwEwRNG6hOJUEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] alpha: bound EV6 logout decoding by the processor area
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> The ES40 correctable logout frame has only the common CPU registers before
> its system area at offset 0x58. The EV6 decoder treats those system words
> as extra CPU registers and reads beyond the 0x80-byte frame.

Is the short frame specific to the ES40? I would have guessed it comes
from the common EV6 PALcode, in which case Titan and Nautilus have had the
same problem. If you know either way, please say so here.

> + if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
> +       I_STAT) ||
> +    mchk_header->sys_offset < offsetof(struct el_common_EV6_mcheck,
> +      EXC_ADDR) ||
> +    mchk_header->sys_offset > mchk_header->size ||
> +    ((mchk_header->sys_offset | mchk_header->size) & 7)) {
> + if (print)
> + printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n",
> +       err_print_prefix, mchk_header->size,
> +       mchk_header->proc_offset, mchk_header->sys_offset);
> + return MCHK_DISPOSITION_UNKNOWN_ERROR;
> + }

ev6_process_logout_frame() is also called for Titan and Nautilus, and
this has only been run on an ES40. If some other firmware builds its
frame a little differently, we now print this one line and throw the
contents away. Before the patch an unknown error at least got the frame
dumped.

Could the failure path dump the frame raw with mchk_dump_mem(), with the
length taken from size and capped at something sane? Then a frame we
reject is still there to look at.

The rest looks good to me.
