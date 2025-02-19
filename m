Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B2214805
	for <linux-alpha@vger.kernel.org>; Wed, 19 Feb 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740008423; cv=none; b=IRKQ5f1Bl7uZAWRwsQRnyPeeixZfJijPfHgtnTPT2p2b40cO+HmAyu/ndfvuw08Q+kXJ8lO1pTFURHr8DdXJPVGI6T8ajSqLiVt4aPDU/b0zWR7b4+QBr9MIvUWLC+wAQ9DTUNIDxPd74lZ93ADyo+Fj5dUGVdImgiKxihwhqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740008423; c=relaxed/simple;
	bh=JCK9xNuRknwFfTkdP0lbQ2c0ipKv2AhKmDDseX8W7Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up3mpggmiQaDIAL/IHLRKElVFEu52UedVg5t4KDipHwDKOy4Io/2nXJoRgpexi00VR/q/Y7kKmC+0E2WQmi8iOJOAI8re5WH3Ej54Jb99N4lLKURFHoPA8TlS5oKBIyZZQNJzwNg55I2jC/FrGEaMa1DRbpApRmdufHkkcqt0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y+QfTe1o; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y+QfTe1o"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abba1b74586so55046666b.2
        for <linux-alpha@vger.kernel.org>; Wed, 19 Feb 2025 15:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740008419; x=1740613219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vaT53iqlM6xreF7+X5o+R/5LiH0zGrtyGxtGEFrke/0=;
        b=Y+QfTe1oJcgabi7xHmMgvmk2wbnHVD7SSlR1E0Za/0nPECdtL+ZtLwN/Go7Hmyo/9i
         mM98OLz9bwc5Wx5AoAnhBJFb7JgB6GODy0j8ME1QvkA23y1c14HaLxh8UQQSUo4leN1R
         3wPhywbHeH9/pNkd85lwJim5KDbXhp4S6DuJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740008419; x=1740613219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaT53iqlM6xreF7+X5o+R/5LiH0zGrtyGxtGEFrke/0=;
        b=C6H0yekgJnpYwgdanWVTvB9MwuH7D8oyhBLAR8/91PZ8W+j0GCGF64eyZ2UEhnr3rP
         283EZSPSQ4KCKuSbXPErZXy2DKI88cTDiRkkcypfQTI0Q6ESNkWS4XVKWEKp18m5qZWP
         VYIQr0Pm2SZ+mVplS2Ltx6QwNVFPQyTGQD2Ryc+nUn49nYfxfxlxkO6kUlxWk+ZVBrXe
         GU7lAktCaXdffqThxCFHNPKaS4SgWPvPbmb8mlVpugBhjAsmOl9S4n4L28wDdHM64i+F
         kgTCEJ8gwzMSVqPub87bVZ44Rl4kfOPuyfavudxDNbUA+Xuzfd3KohKLweYGQhCmMhx0
         38RA==
X-Forwarded-Encrypted: i=1; AJvYcCWCN6HJrPUAga3qt9zhO+J7be7scaGl1L2BN4Fx7I6IGyOho5/9gLayVwODGheVrROVwmEBWxjczy6reA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXURgDS7MpgnJ2Jz9aMYTPqNl1mvzYq+RIrLKzcm/C9GPdSQC
	ZHagAtKdd7jV052wy1bak6bhCEAYUhKv2DRehKdPzjApjDtISp/nu/lUbj6FVUPJZSJ2TekD/Fx
	9N/w=
X-Gm-Gg: ASbGncviROy/AvtOxP4i3A4fRlBB228lzBgxG1CkL1J5By969DipsZmZzKSX+oDkWnp
	iDNQPVXxX/fPFDW9QV3PpEYyjkAFsuSc7gy6Cni3/QayBV2S+bLMpObWUHMbpfWeG8sDOq0Fj+a
	JejGGXu7IztLD0j9lp9WgM44Rg/XR1otAGaZr3wE+7W4z97G2XMT/PqryNzjLcFdXVDY38rfL7a
	0D2W0MnEbHKcaxBE2yILes4lW7C+fpjwWeAhBSHOSb/n1ywWbuSlAsFw21mYzHNe3t2RZf0aWYk
	2+J9wSPQlHdB1f4ROpJmQr6rH6P6khyFnIjvgiu5mSD41h7n6JiK8JrW7vR0zg908Q==
X-Google-Smtp-Source: AGHT+IGp9LgSmTl0ZBkhv0RqyX7URlbvB+L9bICFE4Z5MwJPXEuzw6LGnc56hv7eZkCquCYJdBWMyA==
X-Received: by 2002:a17:907:934a:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-abb70dd663amr1932853466b.46.1740008419165;
        Wed, 19 Feb 2025 15:40:19 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba8b1df9bsm565689766b.114.2025.02.19.15.40.16
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 15:40:18 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb7f539c35so81304066b.1
        for <linux-alpha@vger.kernel.org>; Wed, 19 Feb 2025 15:40:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEasnPCzi67JFbxol4tfGb7Vc4fONQA6lwF2YDHoGP256F/AQjtgubG3zC6wp4LNRGm7Ui1kL8AfOKTQ==@vger.kernel.org
X-Received: by 2002:a17:906:2454:b0:abb:9c8a:fbcd with SMTP id
 a640c23a62f3a-abb9c8afde3mr1350883766b.53.1740008416535; Wed, 19 Feb 2025
 15:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Feb 2025 15:40:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
X-Gm-Features: AWEUYZnbHaeGe4UgKVl0jFJTuHOYkmEVJTWaHTc9-dFDkitydo52hFCkXVkszuI
Message-ID: <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@unseen.parts>, 
	Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Magnus Lindholm <linmag7@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 04:46, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> 1. A trapping unaligned LDx_L operation results in the pair of adjacent
>    aligned whole data quantities spanned being read and stored for the
>    reference with a subsequent STx_C operation, along with the width of
>    the data accessed and its virtual address, and the task referring or
>    NULL if the kernel.  The validity marker is set.

So I have a couple of comments. I don't care deeply because I do think
alpha is dead, but for completeness:

 (a) I don't think the task checking is correct.

You're only checking the task pointer, so what can happen is that a
task exits and another starts up with the same task pointer value, and
it all matches across one task doing a ld_l and another doing a st_c.

Does this matter? No. You'd literally have to *try* to create that
situation with identical mis-aligned addresses and data contents, and
an exit after a 'ld_l', and doing a 'st_c' in the new task without the
matching ld_l.

So I suspect this works in practice, but it's still worth mentioning.

 (b) this is not truly atomic wrt concurrent aligned non-trapping
operations to the same words. Or in fact to current trapping ones,
since you end up inevitably releasing the spinlock before the final
stc emulation.

I think this is fundamental and non-fixable, because the stc is done
as two operations, and the first can succeed with the second failing
(or they can both succeed, just interleaved with other accesses).

Again, I don't think we care, and it works in practice, but it does
mean that I *really* think that:

 (c) you should not handle the kernel case at all.

If the kernel does an unaligned ld_l/st_c, that's a fundamental kernel
bug. Don't emulate it. Particularly when the emulation fundamentally
is not truly atomic wrt other accesses.

Finally:

 (d) I think you're doing a few too many inline asms by hand, and
you're masking the results too much.

On the read-side emulation, why do you do that

+               "1:     ldl %3,0(%5)\n"
+               "2:     ldl %4,4(%5)\n"
+               "       srl %3,%6,%1\n"
+               "       sll %4,%7,%2\n"
+               "       zapnot %1,15,%1\n"
+               "       zapnot %2,15,%2\n"

at all? Just do two aligned loads, and don't mask the bytes around
them. A *real* ldl/stc will fail not just when the exact bytes are
different, but when somebody has touched the same cacheline. So if the
aligned values have changed, you should fail the stc even if the
change was in other bytes.

And doing two aligned loads don't need any inline asm at all.

On the st_c side, I think you're repeating the same inline asm twice,
and should have a single helper.

Is this a NAK for the patch? No. But I do think it should be massaged a bit.

            Linus
