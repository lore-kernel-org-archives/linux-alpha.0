From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC/PATCH 00/14] split exception table content out of module.h
 into extable.h
Date: Sun, 24 Jul 2016 21:18:19 -0700
Message-ID: <CA+55aFyDw_jK609LcjpWvVMTzCWuH6nLUXiZDeYC2tpSaZqhXA@mail.gmail.com>
References: <20160725034247.109173-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=dczwZbrf2jshmJiuH9K32QWSOHoOLVMefgvZ8W9Hquo=;
        b=qS+rwXfRNqTve+MfUbJjH8XsYaKbBSWIAvUMkZvAsh0wOcMdYzjglb7y48SSgLmJKi
         xRP84Xr8sEp6x/TmDkCswobbLerSF4Ux2kmzxjrkWMHIA+3/MX0VOk4RSulSTyecLlnN
         p1l4ks40uYwzkoAVsv8G2Mab1tUc8eNOwFRv1qjjEJncGDaY0O+47AX9sc3gmut0SaS7
         MQHrC3ZeGVUU2DYNDPnItS1dJxU4wKp8AvlQkVhtIsJ7lHCWciFj3kXNusL9GxhGalOR
         jv9pscTVYtvGHZyV8dw0OdlkcMXiycMu4GXed0UdZC9w8eBYUdLpgBihRnvhYanpp+DC
         dAMg==
In-Reply-To: <20160725034247.109173-1-paul.gortmaker@windriver.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Catalin Marinas <catalin.marinas@arm.com>, Chris Metcalf <cmetcalf@mellanox.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Helge Deller <deller@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Ralf Baechle <ralf@linux-mips.org>, Richard Henderson <rth@twiddle.net>, Russell King <linux@armlinux.org.uk>, Rus

On Sun, Jul 24, 2016 at 8:42 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> While doing an audit looking for unnecessary instances of module.h
> inclusion across arch/x86/ I found a significant number of includes
> of module.h were for things like search_exception_table and friends.
>
> For historical reasons (i.e. pre-git) the exception table stuff was
> buried in the middle of the module.h file.  So we have core kernel
> files that are completely non-modular (both arch specific and arch
> independent) that are just including module.h for this.
>
> The converse is also true, in that conventional drivers, be they for
> filesystems or actual hardware peripherals or similar, do not
> normally care about the exception tables.
>
> Here we fork the exception table content [...]

This looks to be the right thing to do as far as I can tell. I'm not
sure how big of a problem the extable stuff is (we definitely have
much bigger unnecessary include files that cause a lot more problems),
but it seems like a reasonable cleanup.

              Linus
