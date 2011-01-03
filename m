From: "Michael Cree" <mcree@orcon.net.nz>
Subject: Re: [BUG] 2.6.37-rc8 build failure on Alpha
Date: Tue, 4 Jan 2011 11:40:26 +1300 (NZDT)
Message-ID: <60180.121.72.232.114.1294094426.squirrel@mail.orcon.net.nz>
References: <20110103205705.GA24522@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20110103205705.GA24522@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Tue, January 4, 2011 9:57 am, Bob Tracy wrote:
> This probably happened before -rc8, but was not an issue for 2.6.36.
>
> The 2.6.37-rc8 kernel build on alpha fails as follows:
>
> (...)
>   LD      usr/built-in.o
>   AS      arch/alpha/kernel/entry.o
>   CC      arch/alpha/kernel/traps.o
> cc1: warnings being treated as errors
> In file included from
> /usr/src/linux-2.6/arch/alpha/include/asm/mmu_context.h:22,
>                  from arch/alpha/kernel/traps.c:26:
> /usr/src/linux-2.6/arch/alpha/include/asm/io.h: In function '__set_hae':
> /usr/src/linux-2.6/arch/alpha/include/asm/io.h:41: error:
> 'arch_local_irq_save' is static but used in inline function '__set_hae'
> which is not static
> /usr/src/linux-2.6/arch/alpha/include/asm/io.h:49: error:
> 'arch_local_irq_restore' is static but used in inline function '__set_hae'
> which is not static

A patch that fixes this was posted to linux-alpha some time ago (see
http://www.spinics.net/linux/lists/linux-alpha/msg00710.html).  I am not
sure why it hasn't made it through to Linus as yet.

Cheers
Michael.


