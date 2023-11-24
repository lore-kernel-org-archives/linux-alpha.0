Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="v3vTFPOO"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED7419A1
	for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 06:37:15 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4D23440C53
	for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700836634;
	bh=cGwg+h1mClEhrndjxPbtDVi24ECb38Vx4CjAfkLm3D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=v3vTFPOOlaL/HNG3ZOrWVK4s4A1WnV10TEx/wATur3FFJpqxZ82KQQ2W16ocI90Rl
	 TcIj6UPfhmH7tZpY8cZV/1rgIfo56kOblVjNmUlyC3AvLgnju4seGrxSvGfzc/CkUe
	 oAO5yQN6x2SihBbYvubtdnzQXGGjevyIGoaOl6CF8BjxmqiibbN9T1ChD3PkbgXMYX
	 gpZ4jNE6oPfYNnwj83oGh/LGgdUB63IiWPvYcNk1AtMhtWGl2ZK3u2vwE4IFVpTxLb
	 pL+oaWfIjNtYyrY7I3JpA/W0wWJp4zXEXTeEuEflgoHINEsN2weFOpV4pHCTG7NzVh
	 7bKrcjiF6JqsA==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c83269c4ccso17451451fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 06:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836633; x=1701441433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGwg+h1mClEhrndjxPbtDVi24ECb38Vx4CjAfkLm3D4=;
        b=TrGArTB+8yt+hqs8idzy3+LZqkDOftTyaZqKWeg2e5Vzwe0eZchOE02G5IIIvJtL5R
         5p3sv/rLC3VwL6RbMlYZGbPhlTwXBSt/le5oIIcVby/Th+IDTU8bvF0FHViZp0MUp7SO
         Rj5LjJxy98Y7cBgFF2vq78/zar97nS5pAUytBDkVHzRlMiJOAGGB8CieSzeYb5Iup1H8
         uPRWEstfibdN9wWCuUYfE2FVNHOKezctuPsy+aIBVUF67uPaOXDNr0Nu2vKXOYnP3MzY
         iajjKtk7Gxjc8JY29eiW3E/xssl72f4PQOnAN/sPchc1Q0GMTKV4Mttu3vG3a24CuGXo
         Zg8A==
X-Gm-Message-State: AOJu0Ywnt2P7UT1W33Jza0rM63OCD+PTKVAh6V/UUkR4J67kcMWn+tuF
	IAaZPHU7V8NEQbfeg2PdE4UXnFm1vZPqzpK1mnW+Sbd1NSm7my6d20K+UTt3Qah9q/PBI//ygK7
	2KJk3kLIVOUkb7Emg0dEZ08rAUT++3Jhy1dr1KQAyiFJ2W4eHBQCnbUo1
X-Received: by 2002:a19:8c42:0:b0:509:448a:d with SMTP id i2-20020a198c42000000b00509448a000dmr1952352lfj.31.1700836633230;
        Fri, 24 Nov 2023 06:37:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoEfY0eVo4yCOZ1JPppE5or+AtqWrtaMSBx5MO4rxigdVW1Rx/L0Gn01Tvw0h7MYG18AyEEtxKjM4yDYQiFJE=
X-Received: by 2002:a19:8c42:0:b0:509:448a:d with SMTP id i2-20020a198c42000000b00509448a000dmr1952334lfj.31.1700836632861;
 Fri, 24 Nov 2023 06:37:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com> <87plzzu1w0.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87plzzu1w0.fsf@email.froward.int.ebiederm.org>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 24 Nov 2023 14:36:36 +0000
Message-ID: <CADWks+aY0jOq6erApu7i0wNVX3uXPbs=Zj7o3XHPMudOkYyeVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] remove the last bits of a.out support
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Nov 2023 at 06:01, Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
>
> > I was working on how linux-libc-dev headers are shipped in Ubuntu and
> > stumbled upon seemingly unused and useless linux/a.out.h header. It
> > seems like it is an accidental leftover at this point.
>
> How do you see that they are unused?
>
> Are they never exported to userspace?
>
> Are there any userspace programs that care?
>
> Performing a quick debian code search I see chromium, qt6, ruby-rogue, hurd,
> bazel_bootstrap, aboot, cde.
>
> I can imagine all kinds of reasons old code could be using headers for a
> historical format.  Some of them are quite legitimate, and some of them
> are quite silly.  If it is old code like aboot it may be that it is
> difficult to test any changes.  If memory serves you have to flash your
> firmware to change/test aboot.
>
> Because showing userspace does not care about the definitions in a file
> is a completely different problem then showing the kernel does not care
> about the definitions I left them, last time I was working in this area.
> Keeping headers that will never change is not cost to the kernel so it
> doesn't hurt us to be nice to historical userspace.
>
> My quick debian code search suggests that there are pieces of userspace
> that still use linux/a.out.h.  Are you seeing something I am not?
> Do all of those pieces of code compile just fine with a.out.h missing?
>

I will recheck the above mentioned things again, but as far as I could
tell up to this point, is that things mostly use a.out.h provided by
glibc.

Separately, I can do this change in a test-rebuild of ubuntu archive
of all packages on amd64,. as that's the only Ubuntu arch that ships
linux/a.out.h.

As far as I can tell, the legacy userspace access to linux/a.out.h can
use glibc's a.out.h instead. But yes, it would be pain, if code
changes are required to things.

> Eric
>
>
> > Dimitri John Ledkov (5):
> >   alpha: remove a.out support from tools/objstrip
> >   alpha: stop shipping a.out.h uapi headers
> >   m68k: stop shipping a.out.h uapi headers

I think above three patches still can be merged in m68k & alpha trees.

> >   x86: stop shipping a.out.h uapi headers
> >   uapi: remove a.out.h uapi header
> >

And these two need further validation now, based on Eric's input.

> >  arch/alpha/boot/tools/objstrip.c    |  52 +-----
> >  arch/alpha/include/uapi/asm/a.out.h |  92 ----------
> >  arch/m68k/include/uapi/asm/a.out.h  |  21 ---
> >  arch/x86/include/uapi/asm/a.out.h   |  21 ---
> >  include/uapi/Kbuild                 |   4 -
> >  include/uapi/linux/a.out.h          | 251 ----------------------------
> >  6 files changed, 6 insertions(+), 435 deletions(-)
> >  delete mode 100644 arch/alpha/include/uapi/asm/a.out.h
> >  delete mode 100644 arch/m68k/include/uapi/asm/a.out.h
> >  delete mode 100644 arch/x86/include/uapi/asm/a.out.h
> >  delete mode 100644 include/uapi/linux/a.out.h



-- 
okurrr,

Dimitri
