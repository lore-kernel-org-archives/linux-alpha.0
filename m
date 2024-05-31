Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E48156242
	for <linux-alpha@vger.kernel.org>; Fri, 31 May 2024 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173165; cv=none; b=LM3QHTJ7k8eOoO/MkAm5kdxdoVPPc2b/k/9GcXvrUfbXM8PLSLDcX3aX+5iR2+ooJwttTIkoBvuuQRKoTQT3C2X59pAerllntdHMxC3j/J2v2BDVdsb3ekZVsxfOl1CEqzZR3FBOcHTelhl2r+3kKr8UzjthLNzRshA3zeLJqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173165; c=relaxed/simple;
	bh=Mltl0pXK6YlhdW0WyyexXZZFzn0aD6bwJXi7FRIGejI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSGWKuM/2iwfI4rAIJLpXzUjEtiyI+PABU2ce59oq+dCQok8uYSnK6anuCoWhfzMZ1rX2UXR+vbbRV8rJXo5yFwmIzi5XMdSUUjJYCwpmRslUbjPZGP7LM+YlD6D8GZR5M9cXMBPCGHK00xFQP17pVCL9Dp4UsDYZVzvYzL8l+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EeNbeWCz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EeNbeWCz"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso34638001fa.2
        for <linux-alpha@vger.kernel.org>; Fri, 31 May 2024 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717173162; x=1717777962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qBpv58mvXEiXCF5CDI3gZ6QIxp2dJ2BrRtOeKNeRg60=;
        b=EeNbeWCzYd+NYZiNHD2hVN1ZzgBq3H6q9v1XtNnkh7bpJ2Jr5ahVZnG3Xpf8VOywtK
         7OdUalyGKVMEYI3JSaMLL/gV3Rxm5xiZKYmz9SNr4SxCcp3J6L4cFnzHGbtqC3Njc8c1
         ut7PR1ShtxuxYVlH3JgXs91r4DXexbyMa+Ir4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717173162; x=1717777962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBpv58mvXEiXCF5CDI3gZ6QIxp2dJ2BrRtOeKNeRg60=;
        b=nvTZlFxWScy/bgj29CbYqhYseLAChXf3lz86k42lf4I64vW8TVAK3QtwcegiQKuEVb
         o831rh3BdjX40uWhooeTZtAJgcbVpJaXXHJlqYOrWxOhWmUq1fOHf0RoNugInSwp4kfC
         8YQ3SptFB7LZzZO77gI5FrbAVsxhD28R0zNZ0ew3Hg1Mr1QtKSu5mQukiDWsp2YwL7b+
         ZICe8NnQbe2rRjiY0Hkbz8Dd4c0IBDAiXQYgPdYduYOz/zwKLTpEC4OoIUQ6/2Ps9TSF
         icONW7JRh0rEV99LD3+KCKkGnWPuUFh6SvP6i3fzC1yfxeT4Rv+So2cqAlIHhLXYaSx7
         jhGw==
X-Forwarded-Encrypted: i=1; AJvYcCWxCrhF4jEJ00g9KFk6MutJ9YG1F39GDu7I/+vAL7Rl3yWK424Vg/DvXcKgej8mxaRZMoNMzgWdOuarjS1YEy0wDRhZE93IA7RwmNI=
X-Gm-Message-State: AOJu0YySDRpY8gnU5/iIoxYfHCCZVGxWaWX5aV+TjIN7eDdEpUM+XLk5
	FSM3O0ffPu1xnEhj2/iDmSI9DD2SE89LSerj1iBVkQnZPx7Ah3xbctrjiq7SML5E15Jv4edQ+Qp
	pF54YMw==
X-Google-Smtp-Source: AGHT+IFf3nGghu9Ni0PS2WPBHaH2IsJaI+4q6jrpbPOLvXaeQmoJ9a8v3lqhy2wgxcrpwTQ1XtZMeQ==
X-Received: by 2002:a2e:b049:0:b0:2ea:9194:ab2d with SMTP id 38308e7fff4ca-2ea951147afmr19119091fa.18.1717173161674;
        Fri, 31 May 2024 09:32:41 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91983f79sm3404941fa.0.2024.05.31.09.32.40
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 09:32:40 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b86cfcbcaso2226826e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 31 May 2024 09:32:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk08q26DWgOcaZ2Zge7dMeab4nSe19CoFYQ1rlOGo0iIBRWtLd0hDmi4AqnDitcxHZlt4djaiKKSw2gpSce1LYDSQyhqF2XUMjpMI=
X-Received: by 2002:a05:6512:1108:b0:52b:8da0:e0e1 with SMTP id
 2adb3069b0e04-52b8da0e1e2mr958133e87.62.1717173160098; Fri, 31 May 2024
 09:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk> <aa397ad5-a08a-48a1-a9c0-75cfd5f6a3a5@paulmck-laptop>
 <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk> <4bb50dc0-244a-4781-85ad-9ebc5e59c99a@app.fastmail.com>
In-Reply-To: <4bb50dc0-244a-4781-85ad-9ebc5e59c99a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 May 2024 09:32:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimJ2hQhKSq7+4O1EHtkg7eFBwY+fygxD+6sjWqgyDMTQ@mail.gmail.com>
Message-ID: <CAHk-=wimJ2hQhKSq7+4O1EHtkg7eFBwY+fygxD+6sjWqgyDMTQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: cleanups for 6.10
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@kernel.org>, 
	linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 08:48, Arnd Bergmann <arnd@arndb.de> wrote:
>
>  /* Is this type a native word size -- useful for atomic operations */
>  #define __native_word(t) \
> -       (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
> -        sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
> +       (sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
>
>  #ifdef __OPTIMIZE__
>  # define __compiletime_assert(condition, msg, prefix, suffix)          \
>
> The WRITE_ONCE() calls tend to be there in order to avoid
> expensive atomic or locking when something can be expressed
> with a store that known to be visible atomically (on all other
> architectures).

No, if you go down this road, then you would want to do the same thing
we do for READ_ONCE() - but for a different reason - hook into it for
alpha, and add a memory barrier to get rid of the crazy alpha memory
ordering:

  /*
   * Alpha is apparently daft enough to reorder address-dependent loads
   * on some CPU implementations. Knock some common sense into it with
   * a memory barrier in READ_ONCE().
   *
   * For the curious, more information about this unusual reordering is
   * available in chapter 15 of the "perfbook":
   *
   *  https://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
   *
   */
  #define __READ_ONCE(x)                                                  \
  ({                                                                      \
        __unqual_scalar_typeof(x) __x =                                 \
                (*(volatile typeof(__x) *)(&(x)));                      \
        mb();                                                           \
        (typeof(x))__x;                                                 \
  })

and the solution would be to make a __WRITE_ONCE() that then uses
"sizeof()" to decide at compile-time whether it can just do it as a
regular write, or whether it needs to do it as a LL/SC loop.

Because we're definitely not changing hundreds - probably thousands -
of random generic data structures.

That said, the above fixes WRITE_ONCE() without changing the
definition of what a native word size is, but doesn't actually *fix*
the problem.

Let's take a really simple example:

    struct net_device {
        ...
        u8 reg_state;

        bool dismantle;

        enum {
                RTNL_LINK_INITIALIZED,
                RTNL_LINK_INITIALIZING,
        } rtnl_link_state:16;
        ...

are all in the same 32-bit word, and we intentionally have code
without locking like this:

        WRITE_ONCE(dev->reg_state, NETREG_RELEASED);
...
        return READ_ONCE(dev->reg_state) <= NETREG_REGISTERED;

because the code knows the state machine ordering requirements (ie
once it has moved past NETREG_REGISTERED, it won't move back).

So now - assuming we fix WRITE_ONCE() to use LL/SC, these READ_ONCE()
and WRITE_ONCE() games work fine on alpha

BUT.

Code that then does something like this:

        dev->dismantle = true;

which is all nice and good (accesses are done under the RTNL lock) now
will possibly race with the unlocked reg_state accesses.

So it's still fundamentally buggy.

And before you say "that's why I wanted to fix the __native_word()
definition", please realize that the above happens EVEN WITH the
READ_ONCE/WRITE_ONCE being done on an "int".

Yes, really. The READ_ONCE and WRITE_ONCE will be individual
instructions. But lookie here, if we have

        u32 reg_state;
        bool dismantle;

and they happen to share the same 8-byte word, and somebody passes
'&dismantle' off to something that does byte writes to it, guess what
the canonical byte write sequence is?

That's right, it looks something like this (excuse any bugs, this is
from memory and looking up the ops in the architecture manual):

        LDQ_U tmp,(addr)
        INSBL byte,addr,tmp2
        MSKBL tmp,addr,tmp
        OR tmp,tmp2,tmp
        STQ_U tmp,(addr)

and notice how in the process it read and then wrote that supposedly
atomic 'req_state" that was otherwise accessed purely with 32-bit
atomic instructions?

There are no LDL_U/STL_U instructions. The unaligned memory ops are
always 8 bytes wide (you can obviously always do address masking
manually and "emulate" a LDL_U/STL_U model, but then you make already
bad code generation even *worse*).

So no. Even 32-bit values aren't "atomic" in alpha, because of the
complete sh*t-show that is lack of byte ops.

NOTE NOTE NOTE! Note how I said "pass off the address of
'dev->dismantle' to something that does byte ops"? If you *know* the
alignment of the byte in a structure, so you don't just get a random
pointer to a byte, you can - and should - generate better code on
alpha, which may in fact involve just doing a 32-bit load, masking off
the low bits, and doing the 32-bit store.

So that LDQ_U/STQ_U sequence is for the generic case, with various
simpler sub-cases that don't necessarily require it.

The fact is, the original alpha is the worst architecture ever made.
The lack of byte instructions and the absolutely horrendous memory
ordering are fatal flaws. And while the memory ordering arguably had
excuses for it ("they didn't know better"), the lack of byte ops was
wilful misdesign that the designers were proud of, and made a central
tenet of their mess.

And I say that as somebody who *loved* it originally. Yes, the lack of
byte operations always was a pain, because it really caused the IO
subsystem to be a nightmare, but I was young, I was stupid, it was
interesting, and I had bought into the kool aid.

But alpha without BWX really is shit. People think x86 is bad. Those
people have NO CLUE.

               Linus
