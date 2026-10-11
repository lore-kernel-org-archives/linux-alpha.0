Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D39339386
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741556; cv=pass; b=RwNdQDJmjS9T51Gq0BSy7r/ECqc4BtGylM4mPA5HpIDvC0v1dQ9SLo411NLyAfrPxrxl/LZ1FZifbAe3LgWxw7OGfJmAkNVxj6MXZQb6NFlGQR0/BWrguZoiLOymVBU0m/SsnsTo93sTW29zHRlc4bjDBCqGD7t9L8e8Zxv4jro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741556; c=relaxed/simple;
	bh=lh0bFUxP9Sa9ghnq4M7tL9MChwbd6HJ/lA9lQmKMG50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CX1hNYl0zlHsjPbKpFRfPcCeMi+aGx5yld9d9te+4Z+ybJJ+v213mOVbCNtH5hzJpozviZew5PB7rNp4iJO0Djw9Ev13sU69s1hUywMYWDT844XoJabMXeOGVR3hA0+UbPtyn9vdsoenpOTS8yfiXsl3R/CGAxXvpaWTHJhC+qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/6BrZgn; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/6BrZgn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1838727a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 10:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791741553; cv=none;
        d=google.com; s=arc-20260327;
        b=NDoC0KgbqacixoTmeZBOXcRYeGYUxF9Eh+bocrArmI+O6FDtYiRAiFLK00Y2wa0tGh
         aecqAJDDzY/I0+zCU1B/HQP7KtqAwxhZWPFhA7ts3m9aZwjgCkyx+8/buoL5+isfCAkT
         UYZsUkFg4a+LfS0SmxBsCRQTjY0pRYFwzknKTR3UEdDgJSUKYvNONtEaTMBj89QAB5yA
         82tjjVdC2U/QZVbrWrVBaQsbw1zFDj+s7p8I9Hy8VD92K8Sv9aJAINu8nJn3+JN+AC5s
         zwIt0zAGDEb1Cni2989W/WvQoBsD5yD5Ek0Fdt/KlJOeLPuO4Cr3ZQmDZXDBwtq5yAy0
         4CNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YS1qwMmkVBYGFkB7xkWf72dzN/2vwZas7xmJ8lt3szI=;
        fh=zi+MDNuiG01+4744g72R6zn8SJErMg1/knIbSkldBIg=;
        b=PyGjizNgCc7E7ncaUkkUUe044YK4ezKWAr85ey1X6x1Nvj4seagDYDBHPqKfjl64gS
         BRFt7WJTQ0mK5LyBrz3/l8xdEf4Hg6zZZJgURpJQDUi9m3KPsCRfz+W+v5kq+ryxLWvk
         nXq4FC568PZYSdKXw0ohtUWRqwQUaaZyxx3cqbNTWVErYeLRj3HC5RJyjvVlFQ4/lmz6
         PYlMaKuzbrZywIg0+8+hNYHV+COOshuQe2i00jr7Tq258jO5ocaDjc5a1zgJCi3Keqcq
         2N+V/GxuNutz+6HMoXI7umLArq20PYhscnQWRjD6wSaUsSPNpYy8tAy9OemaoZZNofbO
         Lpkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741553; x=1792346353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YS1qwMmkVBYGFkB7xkWf72dzN/2vwZas7xmJ8lt3szI=;
        b=X/6BrZgnd8Mzs9gnApp0/su6/UWaCiR5YbTiCt78N+yWnHBsjYQ9OiFM82exRE8Kqc
         d2F+dt3mqvu82eVLCq+LCVd4T+kJphmHpV2s1FzPP9TBZQdJSpmU5YbuB4a7wQZ8yvLI
         lqOQv5zDGeXS6JdFbGyl6eZtxLgJVYqte1L9IK3KIHE/uHXSr4QIpoS4p7kkNsMBV27B
         T/YF41Q0sPFDGOouN/1e9JKgf8/jZlZSTpLtSOf3EarJEjfDxVgoLp/Lry02Y0pVu4ht
         wO8xSMa1uamLgDWxkmq24Pe7NkFKIM3n/MKMvquWyhMvK+6muxft1SOpUsU+zaNIubrC
         azwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741553; x=1792346353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YS1qwMmkVBYGFkB7xkWf72dzN/2vwZas7xmJ8lt3szI=;
        b=UrfkyKMK5EQSupXs4Pz/gwCyl+qMsVR4riaLbg2cjZsKakqH7F5BZn/sZFRFQhcHhy
         XcB47VPCQCXd1GDouESQwUYvqVBYDjiC1uVX49t2vNAJ2tvVKYm30UsYO4HUFZXXn49I
         yFOZs/2WvqCCFhLTvF41JMe+MnCLUhG7b3LS3BE8eDkUO10jQGdlu1SJKxlrycrW+wci
         lIUvqQHhmOYbqv9ajFpgT6vALBm4TYI6wgpuiyoVJv0IrfQ5edLYGncJVhv5y5fzwnVV
         3uW2clM6LRpcK6WvuwofjL9VwaH7dE7t7P4l7etr+cm8B6ujxK8K5FhmAhEoybzCA6+K
         2fNg==
X-Forwarded-Encrypted: i=1; AKwUvBziYrjMpPMuFgxJhKkKj4PcJRIwQVAJK2q0dPeSgZxTulx6s5UP/Vq/VVfSAOdlboFr8QWjX/HzvN/Nfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdGjLo9DMXVtOaQL1TKtNKeNHy/k6QMETuJvVsrX2N7jeiCW1F
	8OJ2afhhZJ7RfzZMnB8Pu8M3T9osLbtICYGn0o76AYz+lAuEp/sIjI+i0jlIqXxD/rzRa1Y7ehe
	NzHx4amj1sbcN7F0HdFSHwEF2fdvMGXF/tm82
X-Gm-Gg: AYBFou07kuRcxmN7mwJwaL8OhXQ9QD63egWYg2KuAjhL1/yBFTGnWNPl+WUFnpzDYpa
	ObzrVIC9pFV9C1icF28zuTZZHeQRpQ/EJcMceHHCm5r6/vYTAe9onk/ggyrLKVVZ/fGBjRFLi/h
	c/9phFs/j2Y/3d4dzinaFFiNCIip6gPcwGg9KO+aVwKL8KTt4lPjubPdEbSYub+GKwIM0MKgrhm
	dx/J5/LGzXJ1UgCeQs0vaMaMizxveQvfEy7xFNqGpwqykujejetByozDnopjjxvDq3d2qdOfaxN
	Idcbb4wpeYLfPQSDnFU5VpR2mWwRyFYVKLwe15GkDRJQ2yYhoviQz80Rgus+aSbyBn0PBF8tBqz
	uYB6DrK5B1WXGRK0/7XRYdGPPCqCEXrbqe0E4zz/dLs+YQIUIoQER
X-Received: by 2002:a05:6402:51c7:b0:6aa:7d3:7cb0 with SMTP id
 4fb4d7f45d1cf-6b17c26d4f6mr6318043a12.19.1791741553244; Sun, 11 Oct 2026
 10:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-4-linmag7@gmail.com>
 <CAEdQ38Ghh9rBzHSMoJ7WwwVWgwhou5d74KStxwEwRNG6hOJUEQ@mail.gmail.com>
In-Reply-To: <CAEdQ38Ghh9rBzHSMoJ7WwwVWgwhou5d74KStxwEwRNG6hOJUEQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 19:59:02 +0200
X-Gm-Features: AclHuK8El0wfzmWI4EUPqVlRFM4HeOh2ilpZiGeKICO9zgIA_YC9CiqvSjmZAf8
Message-ID: <CA+=Fv5SzDx_U8kA0ez8XXp+aKoHba05K_2ZCBvAZub35oV7Chg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] alpha: bound EV6 logout decoding by the processor area
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:38=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > The ES40 correctable logout frame has only the common CPU registers bef=
ore
> > its system area at offset 0x58. The EV6 decoder treats those system wor=
ds
> > as extra CPU registers and reads beyond the 0x80-byte frame.
>
> Is the short frame specific to the ES40? I would have guessed it comes
> from the common EV6 PALcode, in which case Titan and Nautilus have had th=
e
> same problem. If you know either way, please say so here.
>

I can confirm it from the ES40 Service Guide, Table D-19, but I
haven't established
whether Titan or Nautilus PALcode uses the same short frame. I've clarified=
 that
in the v6 commit message.

> > + if (mchk_header->proc_offset !=3D offsetof(struct el_common_EV6_mchec=
k,
> > +       I_STAT) ||
> > +    mchk_header->sys_offset < offsetof(struct el_common_EV6_mcheck,
> > +      EXC_ADDR) ||
> > +    mchk_header->sys_offset > mchk_header->size ||
> > +    ((mchk_header->sys_offset | mchk_header->size) & 7)) {
> > + if (print)
> > + printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n"=
,
> > +       err_print_prefix, mchk_header->size,
> > +       mchk_header->proc_offset, mchk_header->sys_offset);
> > + return MCHK_DISPOSITION_UNKNOWN_ERROR;
> > + }
>
> ev6_process_logout_frame() is also called for Titan and Nautilus, and
> this has only been run on an ES40. If some other firmware builds its
> frame a little differently, we now print this one line and throw the
> contents away. Before the patch an unknown error at least got the frame
> dumped.
>
> Could the failure path dump the frame raw with mchk_dump_mem(), with the
> length taken from size and capped at something sane? Then a frame we
> reject is still there to look at.
>

Agreed. V6 adds a raw fallback using the advertised size, capped at 1 KiB
and rounded down to complete quadwords, without using the rejected offsets

> The rest looks good to me.

Thanks

Magnusi
