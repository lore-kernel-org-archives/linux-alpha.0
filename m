Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CB35C6AE
	for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187298; cv=pass; b=TPADoDxqDk5RSiKxI3If9F/M5ohJwo6T7ADSZkQFp6LbrG2ku3WKGkTv4I/+LKtRt4gCednd0ZOXmLKISI2u4h6O7UBnsZ+AwiW7UbB+t2ELXw//XW5lJIMgjV+p1giS25m1CPvJmSJyfYCLrpLjyjU4ZiVrAp8W/dKy8jxbDCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187298; c=relaxed/simple;
	bh=m8W9Vq+2XXzLDer/FOrnl9DTY1QMXtRVvjhDwafLL1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhSkpNtN38YcV/3dGc8huqiVTNKGIqcYHqPN1uGXc/XUddGRaq48BbXvIDLkXnn2TX74FSryYUd8fUwoKzGSSve4fjX7SXf9gF2lkR+IV9fEl8UgSWvregl9PVMuh89Fgzb0rTtcgadllhX4KJLlNjHl7b8QS9tlz3yomo1W0uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCVeh42Y; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCVeh42Y"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso350870e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 14:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792187295; cv=none;
        d=google.com; s=arc-20260327;
        b=Rksx2ehVcMrs03tgHShQpf/zXoZNR2M7THbNNl3urIHl+L5+0jDNfRkw6P1+JngCN+
         oxTUDSRwR8CESA9bXiQQ7fwi4XgFr+D+crwAeCCvyeCfFW+wEuo0S5Kk5t8Yh54JzuTw
         nMCV/hypWYApQlXcl1ans13p5IVPIwWdR9AVocyA5YkAJl3vdz6Al8exa/e88Hrw2ejS
         pLtdqekqpYCb3yawBeyvKs6ze3v6vIw1RNofHA+A7sQqJmOfasWub7uRBw8jPM3yDeo2
         IhiMjI+jAMyKwZrz/GR+1yAZipkBipI0BjwQUievsDsHzrlay61rXSAkuwK7kHduzLc1
         9JDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        fh=Cv1wMBUpcdYGI0mg1LPp2wD/XA/FHtxtHzvn4SmZQ7E=;
        b=VunpER3PRodoPu3IREP65d+OCa3ZCvCvHBxSRMoN4VeRUcoNww973OZreLs0KhC2fF
         hvOaSCfClBkGa52f2XHuSKtQUuu2useVMETLv3C2ap2tTqQJ+8bqnGChQdk2AxxphunM
         DfWVINaibMNWmgxHf6MmHe97XTXTuc26PRWz/3/aVAv7I0yrj01vna9WoGvQ7rC9Cm8n
         xjIcCLMOimTsBUFK2hPu4t5LAzFr3bmUEduG0K1MuJYapT7IK9pk3TCi/99vjWtW74oH
         ezw3nrb8wqtW8cz+tKjHWv3PVw9TfJFdGPvOsM2ItIHJucApeiiQcTRCfpTzjCQ0WPbA
         1gzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187295; x=1792792095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        b=fCVeh42YlS8atdvjtXLrSSk+pRSrswWr4C7u7oVOEjEy5rdUpBkmm9+yDmRPI9gu2X
         WXR3lJ7W2ECJpaJxBYSOdHCK4aFY2mUz8ulozqSgdULVG2wpc7gq+FCZu+0abfxw+leV
         a3x+7b0AfIiaL8Eg4UqvLedKMdEMCTmfBSnKCfIV9mAg8Kto8qUDwao5TCxG3lqdg0vg
         KijDEb8Thi1VKh39TfvvkhaPk0Aq+oya34lqkiZDAFa2vyE5EmcedpqLW4eWPEUjg48Y
         E0biMr8X2E5rVEPv2wuwgv3Q7igKDsoCr8c6oUx+UJioX3xshOom4MOMOJgZO1rCbWYk
         0HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187295; x=1792792095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        b=hoB/sKovUv6xeDfBXSQUN7bxEHscfFbmdtopNzVxKjwnf09TMdc9oXbJtt0bbIqXby
         Qf3r3YI2dNSLeHy+HCmVCDIMPO4fW5YQgmt4MLlts9Ss7qcg2P0Fgxl+mvjAhhMTvEk+
         hSwQbyP8LETretUE43rZfuaskGWQ7fygsH+Z0bkgeY6dbrOk9UEWmqAizFPf/ZLYVtFF
         B01KRjcqHiQ8gurIBcXfpGmK4J0HcNgsss08rMWtf6EXmHN35CoHKQGD4XDAhVESLo11
         PWPLMZrAhYU5EC+F43yPPdQZkhhP+XuS5203kEvcAkt8NUN1B9jxHYRRJmEJFu5fB3zv
         6NEg==
X-Gm-Message-State: AFq9FYKYQdh/xixd74sriGnj782YTMKGzcfNf3Tg3CwF5BHOiVbX2U4y
	oJgVQbxxm49wBf7iEfkQE1SwV/JT91S9ulgjmDdts7EtLXXzHqgInGaCDdqz9uvh5Qcwlge0NBf
	13cqpHs0IgBeIbie75wX4GTGauc1PJIU=
X-Gm-Gg: AYBFou3hzIHvTHlThaqmjSafl4hyzQTVRIPxLJVUq8YKViQ/aVjTbeTyEXXwFlp6W2a
	JCX0H1UDo7LKeIeKGIpo9UVZjZ5iPmcChnzYkvIC6+tOTjvu5hMW1azVuy93NhakPEYQGU2G58U
	ta1s/fNmSOFIasp46QN6ICPap4uP04DUE1suuucxqDgNvRAfUQccAyFyOJkrSZUYTe5m4PxChn0
	sM1OkuXwx3JQKifD2nznkq8XzcV+IvwskFcfIgTE5Md6K4q/S6UQK19yvbVG3g2XLQIZrBnAMsI
	6yjZwCFLqt1dzmZuqz6VR1gr9/c5fz16DE5BiT5JEs03XCyS6P85XXsMU7Sd8aWY5Mx1TPcqFK5
	eeZyEQ7g5HOYmqPRqKYDI1aUg0LW6XRXw6F424w==
X-Received: by 2002:a05:6512:39c6:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5be50a49fddmr245236e87.13.1792187294734; Fri, 16 Oct 2026
 14:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 17:48:00 -0400
X-Gm-Features: AclHuK__B6Optnw2u7kpVvl6BA1iRZmam2t5bbDLLXcyYiv-5bd6n1WYFrY7dds
Message-ID: <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:13=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Thu, 1 Oct 2026, Matt Turner wrote:
>
> > The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
> > HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
> > help at the system and motherboard lists on the alphalinux.org wiki
> > instead, give LX164 a one-line description in place of its link, and
> > drop the others.
>
>  Would it make sense to keep links to archive.org copies around?
>
> > @@ -184,8 +185,8 @@ config ALPHA_EIGER
> >  config ALPHA_LX164
> >       bool "LX164"
> >       help
> > -       A technical overview of this board is available at
> > -       <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
> > +       AlphaPC164-LX, a 21164A-based single-board computer using the
> > +       Pyxis chipset.
>
>  For example:
> <https://web.archive.org/web/19990913123756/http://www.unix-ag.org/Linux-=
Alpha/Architectures/LX164.html>
> seems fully usable.
>
> > @@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
> >       select HAVE_EISA
> >       help
> >         AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machine=
s.
> > -       See HOWTO at
> > -       <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.
>
>  Likewise:
> <https://web.archive.org/web/20000817221358/http://www.alphalinux.org/doc=
s/rawhide/4100_install.shtml>.
>
> >  config ALPHA_RUFFIAN
> >       bool "Ruffian"
> >       help
> > -       Samsung APC164UX.  There is a page on known problems and workar=
ounds
> > -       at <http://www.alphalinux.org/faq/FAQ-11.html>.
> > +       Samsung APC164UX.
>
>  Likewise:
> <https://web.archive.org/web/20000130062931/http://www.alphalinux.org/faq=
/FAQ-11.html>.
>
>  Of course nested links may or may not work, but at least references to
> some information are retained.  Or has it all been already extracted and
> written down in the wiki?

Did you compare any of the wiki pages and the old links?

I looked at all of these links via archive.org before sending the
patches and didn't see any useful information. The LX164 link just
contained the board specs and a link to the Technical Reference
Manual. The Rawhide link is an install guide for Red Hat 6.0. Similar
situation with the Ruffian page.

If you see any information that's missing from the wiki that I spent a
huge amount of time creating, point it out and I'll add it. At this
point, I see no reason to keep links to 1999-era articles.
