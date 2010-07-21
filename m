From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] math-emu: correct test for downshifting fraction in
 _FP_FROM_INT()
Date: Tue, 20 Jul 2010 18:45:48 -0700 (PDT)
Message-ID: <20100720.184548.250802682.davem@davemloft.net>
References: <19524.51858.992299.119315@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <19524.51858.992299.119315@pilspetsen.it.uu.se>
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mikpe@it.uu.se
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@ozlabs.org

From: Mikael Pettersson <mikpe@it.uu.se>
Date: Mon, 19 Jul 2010 23:58:42 +0200

> The kernel's math-emu code contains a macro _FP_FROM_INT() which is
> used to convert an integer to a raw normalized floating-point value.
> It does this basically in three steps:
 ...
> The fix is simple: the exponent comparison used to determine if the
> fraction should be downshifted must be "<=" not "<".
> 
> I'm sending a kernel module to test this as a reply to this message.
> There are also SPARC user-space test cases in the GCC bug entry.
> 
> Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>

Applied and I'll make sure this gets into -stable too.

Thanks!
