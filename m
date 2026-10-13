Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559213815F0
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861909; cv=pass; b=drRAUZ5yESmsGySCPiRtbJc4WNgrkgEPLBB/bGfbx8ToPaNqR0m/fQE89BUbphrk0dyBEekomf6ggRcUaYndvB8m3ylIUD7aCE1Djt05pwX6ZosWmq0+FBeMqWiOa3jjMXtmMrPUgL/BHRuYnhv35KRBUrks1Dg4HJWmz+XOaww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861909; c=relaxed/simple;
	bh=Qlj6+PdrddA+XIaFJDL/MjE18zhPUetQeHCIDXrZrJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJdrNyd8mk4T0YTKBhNEFQ003h43KVzYASS9T/HfPXNtCcjL5y9ORMubWZU9epx1MCYZr5zJds+d16dNJuDpvRQYRXSz4ZDVV7+zvURzJstoHabhGe649XWQfz3vWCIgomfroIG6rNV1k/bEnJSr+2FTZh+iNJrrsp7fHV/45n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJecdFUQ; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJecdFUQ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso17843791fa.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791861906; cv=none;
        d=google.com; s=arc-20260327;
        b=HUCEh0HQs0FnSQyB6QMlEJG7rsglrqgGulTglnfiiBiwR8SIH3NiomdGUJAJLycg+q
         UJX1kbvxWWwAjFa3SrA1eLRlabA88BtS8Syj7xqsy6L/PCwSQ6qvS+1brFvjhrdPyYo3
         rzgRfEmR+/iMk2MF2Gf4/JGtRA0eQjyHNcdHUr0lTQ73fod45qKvE2InhSy6gI8hLH6g
         9b1ewnFkUIlN0030rxMXqmA3uciUW183Xj3zQHPK2M7YWiN+1v9nuoYOyb7QJxfWcv6E
         33PqSuDjx1OBASpIp9JyB0Xcdx+qhJmA66ovfk7QqzFkd70I1cReMqsBRTYWSwG9XHMu
         kMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        fh=O/WcP5AVGJuhQWGoGw/ezLdJ9Bk6CU1M3buqi1vP0cA=;
        b=Mi2sgJmKH8MscoMRIp8FUEPQKDt26PQfVbaym9tpWCs9E7Bf5MCygdnC0949gx2xJz
         +8FRKQqIBMgDZ1AWlNXrOnDgzV18tCK1soJmVT9ka9fGlmSCVACIGHN70WuM76x0bDnc
         JUg6dl+dZjXEg8+ixckakoMbG0iLwMIUI/a+Z/s0sT4bFM0he7ivaeJyBiJgKzHZYsmG
         voPMwQ0m+YtXWkfQJtpuZcGLACITAz+Yv4Fw2ZJcm5KsBTgAidYdRubB0/JdgcVHqoak
         UUwZU1h38n1AHdpRxaFoQI4bSL9FGLN1sRWKAXMkoUVnNZ152Rwwjyu6YFDjdN/A405D
         l8cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861906; x=1792466706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=OJecdFUQnuUdqqVsXwJnUTlO89VVl6Xc5CuxSDPfBAGG+cZOHO5pbmaIJYlKJ9VKu3
         0jeMPyP1Vcwo5MDlBe2fTILCMaXjjJgIcylG4EJAzQ9FTae777pLR0xG0h7j7zzv/FwS
         GyFxRSNTydaLAM8qZYD3Q/JpyGFRFJVL7RtPL6U23pYaY3m8qDSY7sO7zR7ACBQK6Fnp
         sNcpmhVbOUfIVsB5TzuiW23r9dBgadfFvCs6Ujr+XqFpzvTDo5JSQimjvHCi/btgZnIE
         FyYvzdVPFqz3sqD05hOYDKnLGRP/5/Aar8UrBImRZA+69ycX38eAjZMCkF7hrCPZ3CMu
         RsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861906; x=1792466706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=nCXL/IOGPCaFnra2wY0tlYYWezMipZkoOm8PQIuHzz9yAjb2dp5b/4Spj5Kvl0gYFf
         n5lQ+1FQzTgewZnbCQG9q9263BYFYgZt2e58T0aVZo6nasKjNLIR8s2MRtGivUYZAAFu
         sYvj6ncSmZwwxPbd6+lLB0jTXDoK11Oh4+IJwS9K4U9WGonXrG1mN6vT8zWpVESqm5Sz
         JujEQ04fqB2Y8rv6lmy8uUb9EbTeSIX5TUtF3ld2rtGzZoTuaZ1xjnyChmTGpp/6AxLr
         4cAIrEkedfdP11Jlx3RUaX2g4FmXpLjmD0L9Oy5eJv43N9kjjZvWRToDNNWcJIGX411Z
         nkIQ==
X-Forwarded-Encrypted: i=1; AKwUvByDUNgXBND3A0oOM7Pj274Hwo/Dr4rEPPdaYqNNVFFz7C7bpyncTt3xF2EBQFC1BhcnkYcgaOrdfPwJhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8BNAsRn2bCHFJ+hhTrL8l6Dr3YScfAFZmAy51+b9TRQiqhsDL
	kCqmzbaNRQVVKlHqetUX+r+4eE3/gLjsziUybCH+k73NQ5DB449q9Jtyi5nvBTFagNbeTRMLQpa
	eOdEKtJm6toNd+mRyVbuMJQtPF+AjAVY=
X-Gm-Gg: AYBFou3loDi70h6CiaOmBJnXqnwH0Qd0Nu+j9PPX/993zN7oziDbRYt3e4qzgX6nqlJ
	LOWbFSw2RD8Z//3OO7tmK2I/03mK4Q/If+1CPHJJWYTao7Yf6M+BEu6GJZ48jIinuBwaGolsyfd
	dDT6bORKo8g3hQTEUNoF/Z8JbZmbS6Pl0GyNXl3oOyVm1J6vd+07YwSCKMs9gC7Xz9cT8k4Ut6p
	zrCHafAKW/LLO4a+73kRXJ68+Ap/BVr3eFdJkqNL3JBV1kj2cpWIF0knJGufK9AVjVZVojc/q30
	abRfwr/wpu2RmMNH9zRe4K+vzVy0GgWI6e2czIDChmhRpYEgSUgLbgJ/pfxosC/KbbQ+WfAfqUU
	lidj5NPPzO1HZAUcOld7F3lZ6mVjD6axngf0QMYU=
X-Received: by 2002:a2e:a991:0:b0:3a9:76b7:c515 with SMTP id
 38308e7fff4ca-3a9c5253a1bmr24195321fa.8.1791861906046; Mon, 12 Oct 2026
 20:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com> <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261012133753.3a5868e9@pumpkin>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 12 Oct 2026 23:24:52 -0400
X-Gm-Features: AclHuK_03Oc5vixjhdWzw-DLdJM5sKo0togD5oZVsH_2hFCEPrVq0SbRDKzpVzA
Message-ID: <CAEdQ38E=_qKf+Ljy0qyBATVnjQYihGOkffgYaJuQLSmxim6Btg@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri,  9 Oct 2026 22:20:39 -0400
> Matt Turner <mattst88@gmail.com> wrote:
>
> > Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values =
by
> > a variable count. gcc open-codes such a shift when optimizing for speed=
,
> > but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> > __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> > against libgcc and Alpha does not provide them, so the link fails:
> >
> >   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
> >   (.text+0x1c0): undefined reference to `__ashlti3'
> >   (.text+0x1f8): undefined reference to `__ashrti3'
> >   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_s=
afe':
> >   (.text+0x2ac): undefined reference to `__lshrti3'
> >
> > Provide the three helpers in C, as s390 does, and export them for
> > modules. They are built into the kernel proper rather than lib.a so the
> > exports are present even when nothing built in references them.
>
> Do they need an explicit (shift &=3D 63)?
> I've seen gcc/clang remove an explicit '&=3D 63' because they know the
> hardware instruction ignores the high bits.
> But I'm not sure what happens here.
> Adding it won't make much difference - unless it matters.

No, I don't think so, the 64-bit shift counts are already 0..63 for
any count in 0..127. The !shift check is what keeps 64 - shift from
reaching 64.

gcc doesn't remove an explicit mask here, by the way. It costs an
extra and per function on Alpha. Out-of-range counts give the same
results as libgcc's versions, which is all the callers could expect.
