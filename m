From: David Miller <davem@davemloft.net>
Subject: Re: [Patch 4/5] module: trim exception table in module_free()
Date: Wed, 10 Jun 2009 01:09:15 -0700 (PDT)
Message-ID: <20090610.010915.255287284.davem@davemloft.net>
References: <200906041800.54696.rusty@rustcorp.com.au>
	<4A278C62.8000801@redhat.com>
	<200906060038.03089.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <200906060038.03089.rusty@rustcorp.com.au>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: rusty@rustcorp.com.au
Cc: amwang@redhat.com, linux-kernel@vger.kernel.org, jdike@addtoit.com, hch@infradead.org, mingo@elte.hu, akpm@linux-foundation.org, sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org

From: Rusty Russell <rusty@rustcorp.com.au>
Date: Sat, 6 Jun 2009 00:38:02 +0930

> Sparc32 is unique; it doesn't seem to define ARCH_HAS_SORT_EXTABLE,
> yet it defines its own sort_extable() which overrides the one in lib.
> It doesn't sort, so we have to mark deleted entries instead of
> actually trimming them.
> 
> Inspired-by: Amerigo Wang <amwang@redhat.com>
> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

Acked-by: David S. Miller <davem@davemloft.net>
