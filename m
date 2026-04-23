Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5D3E3DB5
	for <linux-alpha@vger.kernel.org>; Thu, 23 Apr 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936636; cv=pass; b=nrcdG1VMcdM3T8EbecZzqrqMPrgTD7vcZv6yTCUQcvcFB7Y4xSw2Ln1NKOsgmLGOOlpzbdi30r1Z7lghM3zBEj0bMsbUwSuVLz1sVzHl2TJknVSyowfl4ogezyRjwcewcRHYchnFnTJlTWJJ3GSsQllEiDsCLYLVKTpF6H/s2lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936636; c=relaxed/simple;
	bh=H2jsz4k1ZsFZvJ6ZtBQg+ZoiUWJpwKbP8JFKUWVxGoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFbAVccxYgGOXHa+fo/6BJbhIVD8ksiBNMp+yjiVCCzmtNtvhVpt8eR/pBtAwm5MxCMzauf7UNMHjz0gAwo1Fnsu2emPKdeefM2bkJziQIfWny5ETpHjtgJa47sPEJBprXSf1WFXfLxO70sIAIY4N7B2civzkDjpLRsxy3lrObs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBPGPlso; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBPGPlso"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso858233766b.1
        for <linux-alpha@vger.kernel.org>; Thu, 23 Apr 2026 02:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776936634; cv=none;
        d=google.com; s=arc-20240605;
        b=YXJXaLLguHapcKPHB57SHRqUibIf8UZ5r37bnLmRr+BZy6itjm8AgIcxewi8tgSkz2
         zywOdH8JPRU2Z+in55GneoE6L4lrvYbvijVbRBicHBUP+xyf65LNhShZILxbvGXGgg8i
         85cEFZWSFIPsq9YW9WsMukwh4fcx+UuFGeXeBKesPGqiC/gqChrfcC5mfK9A6fRmVa4d
         7ueAGCC0Hj3pnrM+zwjkrZmGAlMUEdar8LC0NYA4A3xOVx3n0GSYQ/DJH9uS8q+1PZsF
         cPZK455twon7HvZZJ1Zt1KjmfG76/iKf03uenpeY/gOjVmManoVmg3M7y9NYY08fPD4H
         eA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ItpKPp6wgE+p2ZjnhbbB+L40pLtiuNorqGssSmn42s=;
        fh=OhkXBGnZQilZyFEi5CmVom/xYxjDM7jsvYZwc4QOgAs=;
        b=DpIqaKRGV03lWh+J3cVWbKMWYWxgF+BUolINaYZ5aD/WOl4G/ESt8mBU2vVtKv8Fx3
         It8bbqN9n7vX8MRZG2LQN2BwCUZiLBurzA4//jBwVQuCHUjrE5xD2bgqIP6XBfKd1tMW
         /lBCkbKzkshuuxWfwHRNYLDhQ+NSlJ1UlLiJb1K9/gWegEst7RhYvin3ehrnsiqqy5IL
         IInB0cP/5gmZ82N7CqwytZ0Igcv7L8jxAmw8Hrp6nOEYb8s0aUoEyBS2FsjwIatpZLW2
         zCAZSLM1iSgP1zWWvsQbO2EQM7BL8Vc0ytXRYZojqIlfJEjs2SLfcpwvku1D/Ufh1knN
         YOow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776936634; x=1777541434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ItpKPp6wgE+p2ZjnhbbB+L40pLtiuNorqGssSmn42s=;
        b=dBPGPlsoMXT+IeWSFRzA7QX1tE8dfiUoY2txA3lhFfoQbCV37FApL353ucpATgsCUK
         FB9jKQlNiyx6aX4mg2Hqa1Pqwt2rRuHO3KKE1q1P9KYssOzeoaGRU2KHkiCJFNvphcv/
         SfWXWz6N9l1BkJVbJUOOOXr5ChTzHh6PHwcnhpV/yHyoDpZfcEFaG8fB0Yav8QpDFU/Z
         0x55R2pyGMp0QZwHut5Akd3Ouy7STUfECygdT72u5FEruNw+zrrvm0tr28074N0J/bcg
         YIGu3/wEE9m6btO3cvpcaLw+byLFuXtrpRKEP0xfD8ncBsCvhMi65v1CYXNPZwvcAK0o
         Lk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936634; x=1777541434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ItpKPp6wgE+p2ZjnhbbB+L40pLtiuNorqGssSmn42s=;
        b=m68CZRIdChfJeahUuMPai6tMdBA4B7Srp0+6x+TqJ2Q1IHt08ISRGO6KyzPMt7hC6I
         P0GymYsqGtsaO5A14MBADvees95Z5+PZ0sNEuXF/jBlVwwFvQmPYbEqpeHS1JY+FmNS4
         ZWq1e5RyvrSJ8XXAQmB6rFJhoE3RZdY88TjrHbwgTvkprPvIzEiYDsc5acpbROPIPs/Q
         DEpx7UEpJA/qohhI2qAi1M/pYAUkEjD/T6C7kIcs+rq10uoAlboNpcIzoxVcLiRnh6f8
         8dGjKQ/z+tL6l4BZ//sl2gUwHvCzIGWPHG5l0xeZCLF185jQkzS7PwQnOxriZdOf0Gjo
         /cyg==
X-Gm-Message-State: AOJu0YyvAHqhNJayY3XPQAMSbrhaYjU1nD1k2tPDrxKd9EFLzUlVKoHo
	RtFSajNYq75FuX5d4jMGy2IcNxBIqflW5t1hO+JuxXrrqaZRmNFxqI/PmxBgzPxfK5U2ea6+QV2
	hnzghgWQ8WwcnCTloiIvjSxXLAjpEfzzPQBPN
X-Gm-Gg: AeBDies+gB44OXswKME2EfD9RTC0H159rwXOR5sMA9eW9ESXHUUkfg/Ge2VqCMNd0SD
	zKdJhrSFksBxM+TCK07UoBsnnWKg9pSiN+LheaYOWzD4njeG5t6ujqyQfdjnDe3+XJjr058H+vO
	bz2pITEr+DzyHWDPj9jXdF6HeJ326xlTGmW6box3w5gakS5Ko5VoWw1PakgmFkiB19LYqfWRDZP
	jfIdwoWPPsDI+lc7sOBJGqFI0oWLAcqHiEHfE7jMzOhgGaEJGZVT2CoW7RAy2rmM+JjF680gZCU
	O8kGTSxCGZQeqJ6KOgte41XbwMWaecLU8xLTnXAkPcb4aqnvibg=
X-Received: by 2002:a17:906:6a11:b0:ba4:a871:27de with SMTP id
 a640c23a62f3a-ba4a8712a6fmr1217848266b.3.1776936633531; Thu, 23 Apr 2026
 02:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E005E33F-8F2B-4885-89E7-CEAEA04F914A@flyingpenguins.org>
In-Reply-To: <E005E33F-8F2B-4885-89E7-CEAEA04F914A@flyingpenguins.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 23 Apr 2026 11:30:21 +0200
X-Gm-Features: AQROBzCND2p74CTTCJ0ZrXNBE5UljS9RIC4g9WFacUEXDxQ-QBvF5keFf2rW0YY
Message-ID: <CA+=Fv5RaTrRkjzsWgoE1hJ+nBmTzV19Ps2Wuzn1z9EKnDmN8Tw@mail.gmail.com>
Subject: Re: [RFC] alpha: optimize ip_fast_csum for BWX-capable CPUs
To: Mike Hlavac <mike@flyingpenguins.org>
Cc: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 1:44=E2=80=AFAM Mike Hlavac <mike@flyingpenguins.or=
g> wrote:
>
> On Alpha EV56 and later, we can use the 'ldwu' instruction to significant=
ly accelerate IP header checksumming. By manually unrolling the loop for th=
e common 20-byte (ihl=3D5) case, we eliminate branch penalties and allow th=
e compiler to optimally schedule instructions for the EV56 pipeline.
>
> Benchmarked on EV56 (Miata) at 633MHz:
>
>         =E2=80=A2 Legacy Path: 0.796s
>
>         =E2=80=A2 Unrolled BWX Path: 0.508s (~36% improvement)
>
> Tested with GCC 15. The unrolled C implementation results in straight-lin=
e assembly with no branches in the hot path.  I=E2=80=99d love some feedbac=
k from someone with an EV6+
>

Mike,

Thanks for working on this.  I tested the benchmark here with GCC
15.2.1 at -O2 on several CPU targets.  There does seem to be a real
optimization opportunity, but I do not think this patch is the right
shape yet.

Results here (EV67 833 MHz system) were roughly:

  ev4:  legacy ~0.365s, modern ~0.83s,  unrolled ~0.230s
  ev5:  legacy ~0.394s, modern ~0.716s, unrolled ~0.230s
  ev56: legacy ~0.304s, modern ~0.304s, unrolled ~0.171s
  ev6:  legacy ~0.314s, modern ~0.313s, unrolled ~0.177s

The measured win comes from the manually unrolled ihl=3D=3D5 case becoming
straight-line code with no inner loop branch, not from the "modern C"
rewrite by itself.  On ev56/ev6, the looped legacy and looped modern-C
variants compile to essentially the same code, while on ev4/ev5 the
plain uint16_t loop is actually much worse than legacy.

One caveat is that the benchmark repeatedly checksums the same small
static header, so it mainly measures code shape with hot data.  That
is useful, but it does not say much by itself about the end-to-end
gain on real traffic. Touching old and stable code is alway a risk to
introduce new problems.

I also think the interface change is a problem.  Today Alpha has an
out-of-line ip_fast_csum() symbol.  This patch turns it into a header
inline and makes the fallback path call do_csum(), but do_csum() is
not exported, which looks wrong for modules.

The optimization itself does not seem out of line; other archs also
treat ip_fast_csum() as a specialized IPv4-header routine.  What
would seem safer here would be to keep the Alpha-specific fast path
behind the existing ip_fast_csum() implementation, with the current
checksum code as the fallback for larger ihl values and non-BWX
friendly builds.

Thanks,
Magnus
