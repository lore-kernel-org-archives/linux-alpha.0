From: Andrew Morton <akpm@osdl.org>
Subject: Re: BUG: Kernel Panic: kernel-2.6.0-test9-bk21  for alpha in scsi
 context ll_rw_blk.c
Date: Mon, 17 Nov 2003 13:11:45 -0800
Sender: linux-scsi-owner@vger.kernel.org
Message-ID: <20031117131145.07266f43.akpm@osdl.org>
References: <3FB92938.8040906@steudten.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <3FB92938.8040906@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: alpha@steudten.com
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-alpha@vger.kernel.org

Thomas Steudten <alpha@steudten.com> wrote:
>
> In ./drivers/block/ll_rw_blk.c __make_request:2021
>     2021         spin_lock_prefetch(q->queue_lock);
>     2022
>     2023         barrier =3D test_bit(BIO_RW_BARRIER, &bio->bi_rw);
>     2024
>     2025         ra =3D bio->bi_rw & (1 << BIO_RW_AHEAD);
>=20
>=20
>      3338:       00 00 e3 8b     lds     $f31,0(t2)
>=20
> processor.h:94
> extern inline void spin_lock_prefetch(const void *ptr)
> {
>          __builtin_prefetch(ptr, 1, 3);
> }
>=20
> So q->queue_lock isn=B4t aligned for alpha - or q isn=B4t valid.

The spinlock is aligned OK.  Could you add this patch so we can see
a bit more context?

diff -puN arch/alpha/kernel/traps.c~alpha-stack-dump arch/alpha/kernel/=
traps.c
--- 25/arch/alpha/kernel/traps.c~alpha-stack-dump	Mon Nov 17 13:10:21 2=
003
+++ 25-akpm/arch/alpha/kernel/traps.c	Mon Nov 17 13:10:30 2003
@@ -636,6 +636,7 @@ do_entUna(void * va, unsigned long opcod
 	lock_kernel();
 	printk("Bad unaligned kernel access at %016lx: %p %lx %ld\n",
 		pc, va, opcode, reg);
+	dump_stack();
 	do_exit(SIGSEGV);
=20
 got_exception:

_

-
To unsubscribe from this list: send the line "unsubscribe linux-scsi" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
