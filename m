From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as necessary
Date: Wed, 29 Dec 2021 20:48:23 -0500
Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com> <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com> <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640828918;
        bh=81MO7TacqQe8I5ko0Q8CwbDD4h/99BabB8aCDnWo0lQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jV/ycMyovnmu9pbcNLGboBsGNIaWSzFTvzZh+Mx9BwCcRQ4wkFdLiGVgRkSKcn1av
         ACLs6uhvkNBtfi0XHerEvqHG9aDTvnP0DnkZJ23UYJg1+rpYpog6ujNkprLhWymjWQ
         hVule2DRwuMYA/yBJYRWrQwKgFOWg5pmJP5humJTKlsctrnxGtyKKZV5MSDWgxD4iF
         I5CuYOMx73K52jL6eCERvW0K/qJG/CffLHmjFLJmfkBjIdmKueJ2GntN8tpN5P6Axu
         +/iJu6EgjHsacUxqabHsXc98pimqrGXyEBPg4rn/eSXczdd7VTgu9//4yKsbFR5Bjg
         v0Y95G8jR3CDw==
In-Reply-To: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>, Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt

On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> > On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA
> does not affect other m68k platforms when e.g. building multiplatform
> kernels.

Ok

> Replacing inb() by readb() without any address translation won't do much
> good for m68k though - addresses in the traditional ISA I/O port range
> would hit the (unmapped) zero page.

Correct, this is exactly the problem that Niklas is trying to solve here:
we do have drivers that hit this bug, and on s390 clang actually produces
a compile-time error for drivers that cause a NULL pointer dereference
this way.

What some other architectures do is to rely on inb()/outb() to have a
zero-based offset, and use an io_offset in PCI buses to ensure that a
low port number on the bus gets translated into a pointer value for the
virtual mapping in the kernel, which is then represented as an unsigned
int.

As this is indistinguishable from architectures that just don't have
a base address for I/O ports (we unfortunately picked 0 as the default
PCI_IOBASE value), my suggestion was to start marking architectures
that may have this problem as using HAS_IOPORT in order to keep
the existing behavior unchanged. If m68k does not suffer from this,
making HAS_IOPORT conditional on those config options that actually
need it would of course be best.

         Arnd
