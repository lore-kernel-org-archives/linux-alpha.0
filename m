From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 05/13] m68k: mm: use pgtable-nopXd instead of
 4level-fixup
Date: Wed, 6 Nov 2019 20:28:59 +1300
Message-ID: <15fafca0-e4c4-1f46-4f19-9b2a177f7d6b@gmail.com>
References: <1572850587-20314-1-git-send-email-rppt@kernel.org>
 <1572850587-20314-6-git-send-email-rppt@kernel.org>
 <CAMuHMdUG3V7uxzhbetw75vVeobeP0-bQySb3r=0V5XujUF123g@mail.gmail.com>
 <20191104094748.GB23288@rapoport-lnx>
 <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=CZXGdk9uFu2d7V8fak5kkfAh72DjR9+d3K1XsYdLz38=;
        b=oGcJVGIO9nAfwZ9U9gs9P3ysGflXOrasF6qEiEhb6WpEy/r0O4b4WcXcLFHBABCJ7R
         QUOnBvxM0K+ORQ5GEwdd68Rbvuyj5JajApo+O20Qk7aw+1UO9FWS+6+LzSfRmtqSLrdq
         xvCHWuUmC+aEABOOmXkQjFb1AvmC1AZ+Bwjcb+sSQtS1GRTuQLMEbpuch+Wd9OB5B9nR
         MEP3ZWqL3l8J6HAnG5DRusZtOBOPsYcpMAZ4FMs88UBSyQ00BeMuWCLwvOdu7PSHWk++
         XtgmclZQxAc89Qmj6l/gKcwAVt76pZv/YKMWttV48g2arcZGneYo8SkwGAFkxvqsnIJf
         JInQ==
In-Reply-To: <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mike Rapoport <rppt@kernel.org>
Cc: Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jeff Dike <jdike@addtoit.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linus Torvalds <torvalds@linux-foundation.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>, Richard Weinberger <richard@nod.at>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Russell King <linux@armlinux.org.uk>, Sam Creasey <sammy@sam>

Hi Geert,

Am 04.11.2019 um 22:53 schrieb Geert Uytterhoeven:
>>> This indeed boots fine on ARAnyM, which emulates on 68040.
>>> It would be good to have some boot testing on '020/030, too.
>>
>> To be honest, I have no idea how to to that :)
>
> Sure. This was more a request for the fellow m68k users.

I heard you :-) Still doing more regression testing on the latest SCSI 
fix, but I can schedule this next.

Cheers,

	Michael

> But don't worry too much about it.  If it breaks '020/'030, we can fix
> that later.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
