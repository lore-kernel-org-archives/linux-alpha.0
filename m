From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] alpha: fix broken network checksum
Date: Thu, 23 Jan 2014 14:39:30 +0000 (UTC)
Message-ID: <101611139.11912.1390487970286.JavaMail.zimbra@efficios.com>
References: <alpine.LRH.2.02.1401222255470.18715@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1401222255470.18715@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, David Miller <davem@davemloft.net>, Oleg Nesterov <oleg@redhat.com>, Jay Estabrook <jay.estabrook@gmail.com>, Michael Cree <mcree@orcon.net.nz>, Jens Axboe <axboe@kernel.dk>

----- Original Message -----
> From: "Mikulas Patocka" <mpatocka@redhat.com>
> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Richard Henderson" <rth@twiddle.net>, "Ivan Kokshaysky"
> <ink@jurassic.park.msu.ru>, "Matt Turner" <mattst88@gmail.com>, linux-alpha@vger.kernel.org
> Cc: "David Miller" <davem@davemloft.net>, "Oleg Nesterov" <oleg@redhat.com>, "Jay Estabrook"
> <jay.estabrook@gmail.com>, "Michael Cree" <mcree@orcon.net.nz>, "Jens Axboe" <axboe@kernel.dk>
> Sent: Wednesday, January 22, 2014 11:04:33 PM
> Subject: [PATCH] alpha: fix broken network checksum
> 
> The patch 3ddc5b46a8e90f3c9251338b60191d0a804b0d92 breaks networking on
> alpha (there is a follow-up fix 5cfe8f1ba5eebe6f4b6e5858cdb1a5be4f3272a6,
> but networking is still broken even with the second patch).
> 
> The patch 3ddc5b46a8e90f3c9251338b60191d0a804b0d92 makes
> csum_partial_copy_from_user check the pointer with access_ok. However,
> csum_partial_copy_from_user is called also from csum_partial_copy_nocheck
> and csum_partial_copy_nocheck is called on kernel pointers and it is
> supposed not to check pointer validity.
> 
> This bug results in ssh session hangs if the system is loaded and bulk
> data are printed to ssh terminal.
> 
> This patch fixes csum_partial_copy_nocheck to call set_fs(KERNEL_DS), so
> that access_ok in csum_partial_copy_from_user accepts kernel-space
> addresses.

I see that most architectures implement a csum_partial_copy_generic()
called from csum_partial_copy_nocheck() for this purpose rather than
re-using csum_partial_copy_from_user().

I understand that this fix is the minimal change needed to get things to
work, so I think it's important to pull it in, but it might be a good
thing to consider implementing a csum_partial_copy_generic() for alpha
eventually if performance matters.

Thanks!

Mathieu

> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  arch/alpha/lib/csum_partial_copy.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> Index: linux-2.6-alpha/arch/alpha/lib/csum_partial_copy.c
> ===================================================================
> --- linux-2.6-alpha.orig/arch/alpha/lib/csum_partial_copy.c	2014-01-23
> 04:44:34.000000000 +0100
> +++ linux-2.6-alpha/arch/alpha/lib/csum_partial_copy.c	2014-01-23
> 04:45:43.000000000 +0100
> @@ -378,6 +378,11 @@ csum_partial_copy_from_user(const void _
>  __wsum
>  csum_partial_copy_nocheck(const void *src, void *dst, int len, __wsum sum)
>  {
> -	return csum_partial_copy_from_user((__force const void __user *)src,
> -			dst, len, sum, NULL);
> +	__wsum checksum;
> +	mm_segment_t oldfs = get_fs();
> +	set_fs(KERNEL_DS);
> +	checksum = csum_partial_copy_from_user((__force const void __user *)src,
> +						dst, len, sum, NULL);
> +	set_fs(oldfs);
> +	return checksum;
>  }
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
