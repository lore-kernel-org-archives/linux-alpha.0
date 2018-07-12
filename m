From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] sparc64: add reads{b,w,l}/writes{b,w,l}
Date: Wed, 11 Jul 2018 19:52:14 -0700 (PDT)
Message-ID: <20180711.195214.373420143941741317.davem@davemloft.net>
References: <20180711120824.3882108-1-arnd@arndb.de>
        <20180711120824.3882108-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711120824.3882108-2-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: arnd@arndb.de
Cc: boris.brezillon@bootlin.com, linux-ia64@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 11 Jul 2018 14:08:06 +0200

> Some drivers need these for compile-testing. On most architectures
> they come from asm-generic/io.h, but not on sparc64, which has its
> own definitions.
> 
> Since we already have ioread*_rep()/iowrite*_rep() that have the
> same behavior on sparc64 (i.e. all PCI I/O space is memory mapped),
> we can rename the existing helpers and add macros to define them
> to the same implementation.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: David S. Miller <davem@davemloft.net>
