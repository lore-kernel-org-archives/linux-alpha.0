Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09EB15B3
	for <linux-alpha@vger.kernel.org>; Fri, 31 May 2024 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717114280; cv=none; b=fDIr+C1EpTuTWUleeKEj2j5DSHwFnSToKBU9zB4p8LRikR8NeazyzNC16mKE2zteNhGYlCy8uVPMiqgKbwaTTNwB8cWfcfgVBT3wpyOjBVxanB0tvYOJTZNSLEF+GhvDVSh/aeY1d7O7Za8VxCUarArQio79aWhr73Ks26hzAGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717114280; c=relaxed/simple;
	bh=U0XJns+YNNmeMEASPduEJ9jHIdS9fQwGg1OuH4qRsww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWbeQga9hTWwtbo4TTH9FzM1AZgGXEhqe3T+QcgKjKZiz1kWdhqJkX60TUHgQRxCO01BKA5ucJAQzzaVEop73VTy+cz4FR/EXH7mhdG7WXGfzZgSHjTnMD0EdA+NUHoaJWyS2KYrngiFCPC2sJExcEQ6VpInrCAnRRFf1NwDB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GKchJLAj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GKchJLAj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5785eab8d5dso1609560a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 30 May 2024 17:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717114277; x=1717719077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHMYrW+TpQb5zcHr1paZFxtLcsiCfSjdSb93AnO8N4I=;
        b=GKchJLAj9vw4sKbRtxyZEpHnh1q49FIPluJHKYkljzG458HRJ+PkGJDeOuR6mqV3EQ
         BJDmyT0KkZVSpWHNhLVrH/gcJv64pMrezDpnvBm7wpdIyLMsslzJFSy3X71oDFko//Jk
         FbrTakHlClf8E+P5Zf9wUSXVsLaMfNw8Wg86I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717114277; x=1717719077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHMYrW+TpQb5zcHr1paZFxtLcsiCfSjdSb93AnO8N4I=;
        b=QukU0Ij19KibexQgldSMfo81fIQcLw7XJIhZFMz05cGkbvtduBaIlrkfB0lfeRZOTz
         NOB7WdqUdYBcWhGL/pjHEx81zYJCy+CStUsdOAm02lDCi6JBF4AZXHX3erRiOMOLsBb4
         F49F2Nn8qjE9Xtbf0smVyWiG1P7Z13AX/9lqtJU7VDPP/3Mf3Ct42bUpwIt6EdBx9I5V
         ar8sSMBK4J1xduq8rhgMFIrYlVEw5ARfIU9ksIeagvQsbSpNW9yHqqhF6ao9K9qu/2Jg
         J0tYIFH8fCIA7AF2O4RtqQm1QF1HhZ1YKv4l/8pVeIv0/av3rjIqfGlBXOt452yQoxF4
         HzHw==
X-Forwarded-Encrypted: i=1; AJvYcCUQJ+Zt+jSm1ZkqrA0pqbLd16hC7Y4nvsfafOQ9VeNoBdMu+0D5YdxJgrYlLpKP1CYOT7AK+26HLl5k/0xdViwqVpcB3gKSqxO0wBA=
X-Gm-Message-State: AOJu0YwE67B41Us+R86xOXauTSHzz+N74T0359gPgRMNiM1N7xp+I1M8
	Si0o2x9wQ1mmExWh/OwGzOyUECuuuKOvhCtjwfI8vGCV07XO6Snh6sr0RPBix/PQn469rN1qHb5
	eCFaqGg==
X-Google-Smtp-Source: AGHT+IGCsCeJnrfk0OeoPTE1isJuaFA/IQO4VjBvOGXseNCVaKbq6N47p7jneSBwGzetBAWEkDL+5w==
X-Received: by 2002:a50:ba85:0:b0:579:be37:fa5a with SMTP id 4fb4d7f45d1cf-57a363b589dmr199701a12.8.1717114276742;
        Thu, 30 May 2024 17:11:16 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb8282sm351561a12.25.2024.05.30.17.11.15
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 17:11:15 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6341cf2c99so147722966b.0
        for <linux-alpha@vger.kernel.org>; Thu, 30 May 2024 17:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVd29sjHZb8oUEg4isWi/cBVBTJtbLZvmy1Lvqbc/kY4r2F26QlgyrRRN3nCArLMaka+CvfAGZZdv5k61tj/dAOyujTNwS7NLxAAE8=
X-Received: by 2002:a17:906:258d:b0:a5c:dcd4:351b with SMTP id
 a640c23a62f3a-a6821982787mr20520766b.58.1717114275493; Thu, 30 May 2024
 17:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk> <aa397ad5-a08a-48a1-a9c0-75cfd5f6a3a5@paulmck-laptop>
 <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk> <CAHk-=wi7WfDSfunEXmCqDnH+55gumjhDar-KO_=66ziuP33piw@mail.gmail.com>
 <alpine.DEB.2.21.2405302115130.23854@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2405302115130.23854@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 May 2024 17:10:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=whiH6g+T7+YWSYgAhJ9HsJ2bUUDJfLLo_Yhbi8CVgkHDg@mail.gmail.com>
Message-ID: <CAHk-=whiH6g+T7+YWSYgAhJ9HsJ2bUUDJfLLo_Yhbi8CVgkHDg@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: cleanups for 6.10
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@kernel.org>, 
	linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 15:57, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Wed, 29 May 2024, Linus Torvalds wrote:
> >
> > The 21064 actually did atomicity with an external pin on the bus, the
> > same way people used to do before caches even existed.
>
>  Umm, 8086's LOCK#, anyone?

Well, yes and no.

So yes, exactly like 8086 did before having caches.

But no, not like the alpha contemporary PPro that did have caches. The
PPro already did locked cycles in the caches.

Yes, the PPro still did have an external lock pin (and in fact current
much more modern x86 CPUs do too), but it's only used for locked IO
accesses or possibly cacheline crossing accesses.

So x86 has supported atomic accesses on IO - and it is very very slow,
to this day. So slow, and problematic, in fact, that Intel is only now
trying to remove it (look  up "split lock"

But the 21064 explicitly did not support locking on IO - and unaligned
LL/SC accesses obviously also did not work.

So I really feel the 21064 was broken.

It's probably related to the whole cache coherency being designed to
be external to the built-in caches - or even the Bcache. The caches
basically are write-through, and the weak memory ordering was designed
for allowing this horrible model.

> > In fact, it's worse than "not thread safe". It's not even safe on UP
> > with interrupts, or even signals in user space.
>
>  Ouch, I find it a surprising oversight.

The sad part is that it doesn't seem to have been an oversight. It
really was broken-as-designed.

Basically, the CPU was designed for single-threaded Spec benchmarks
and absolutely nothing else. Classic RISC where you recompile to fix
problems like the atomicity thing - "just use a 32-bit sig_atomic_t
and you're fine")

The original alpha architecture handbook makes a big deal of how
clever the lack of byte and word operations is. I also remember
reading an article by Dick Sites - one of the main designers - talking
a lot about how the lack of byte operations is great, and encourages
vectorizing byte accesses and doing string operations in whole words.

          Linus
