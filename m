From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] alpha: fix broken network checksum
Date: Thu, 23 Jan 2014 12:13:36 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401231157480.6842@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1401222255470.18715@file01.intranet.prod.int.rdu2.redhat.com> <101611139.11912.1390487970286.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <101611139.11912.1390487970286.JavaMail.zimbra@efficios.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, David Miller <davem@davemloft.net>, Oleg Nesterov <oleg@redhat.com>, Jay Estabrook <jay.estabrook@gmail.com>, Michael Cree <mcree@orcon.net.nz>, Jens Axboe <axboe@kernel.dk>



On Thu, 23 Jan 2014, Mathieu Desnoyers wrote:

> ----- Original Message -----
> > From: "Mikulas Patocka" <mpatocka@redhat.com>
> > To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Richard Henderson" <rth@twiddle.net>, "Ivan Kokshaysky"
> > <ink@jurassic.park.msu.ru>, "Matt Turner" <mattst88@gmail.com>, linux-alpha@vger.kernel.org
> > Cc: "David Miller" <davem@davemloft.net>, "Oleg Nesterov" <oleg@redhat.com>, "Jay Estabrook"
> > <jay.estabrook@gmail.com>, "Michael Cree" <mcree@orcon.net.nz>, "Jens Axboe" <axboe@kernel.dk>
> > Sent: Wednesday, January 22, 2014 11:04:33 PM
> > Subject: [PATCH] alpha: fix broken network checksum
> > 
> > The patch 3ddc5b46a8e90f3c9251338b60191d0a804b0d92 breaks networking on
> > alpha (there is a follow-up fix 5cfe8f1ba5eebe6f4b6e5858cdb1a5be4f3272a6,
> > but networking is still broken even with the second patch).
> > 
> > The patch 3ddc5b46a8e90f3c9251338b60191d0a804b0d92 makes
> > csum_partial_copy_from_user check the pointer with access_ok. However,
> > csum_partial_copy_from_user is called also from csum_partial_copy_nocheck
> > and csum_partial_copy_nocheck is called on kernel pointers and it is
> > supposed not to check pointer validity.
> > 
> > This bug results in ssh session hangs if the system is loaded and bulk
> > data are printed to ssh terminal.
> > 
> > This patch fixes csum_partial_copy_nocheck to call set_fs(KERNEL_DS), so
> > that access_ok in csum_partial_copy_from_user accepts kernel-space
> > addresses.
> 
> I see that most architectures implement a csum_partial_copy_generic()
> called from csum_partial_copy_nocheck() for this purpose rather than
> re-using csum_partial_copy_from_user().
> 
> I understand that this fix is the minimal change needed to get things to
> work, so I think it's important to pull it in, but it might be a good
> thing to consider implementing a csum_partial_copy_generic() for alpha
> eventually if performance matters.
> 
> Thanks!
> 
> Mathieu

You could move the common code without the access_ok check to another 
function.

But csum_partial_copy_from_user is called much more often than 
csum_partial_copy_nocheck, so the current code has smaller i-cache 
footprint.

BTW. the ia-64 version of csum_partial_copy_from_user lacks access_ok too.

Mikulas
