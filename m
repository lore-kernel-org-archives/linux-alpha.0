From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2] alpha: fix page fault handling for r16-r18 targets
Date: Mon, 21 Jan 2019 23:36:10 -0800
Message-ID: <CAEdQ38FiCnCVwue-7dsbvoPDiCXFk8M_Wq0+b4Ego8DXTDmQ9w@mail.gmail.com>
References: <20181231014515.GA13296@altlinux.org> <20181231115355.32051-1-slyfox@gentoo.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x61w76GzNe+nOXtRz1PrU5HrR+5Sd+AN/GUuUvwosFo=;
        b=HDCNmbLRvHyvDvcpC/mJPmUr5d02Qi8LTRlU76tLz4EK3xfLKwqJAAFMwOXwMBws7n
         iw2TRYVvrQnVpztPcyvVICVTLZVXRvWyRJhOsXAt3PiN5gy8X7Wu1LQw/rMzZBD7QmI7
         C/xHcIE/NmpGlaanUueL+mtUg8LvzbPlN95LnW0pICQi8b6Dunr3C9cZxRn3dMrEFcjU
         NOEEUX9jnvN70Kcuid0iBFClW0BS+TeiJX+/pYSjAqBB2gNJBq6KHPlQuc/DcbhGgMfU
         36BftU2aZEK4SlpDqi+rH+/76Dswnam+H6quc5uCwfRTray5q/Nq5lf+1uvpp02HyXGD
         Zu9A==
In-Reply-To: <20181231115355.32051-1-slyfox@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Trofimovich <slyfox@gentoo.org>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, stable@vger.kernel.org

On Mon, Dec 31, 2018 at 3:54 AM Sergei Trofimovich <slyfox@gentoo.org> wrote:
>
> Fix page fault handling code to fixup r16-r18 registers.
> Before the patch code had off-by-two registers bug.
> This bug caused overwriting of ps,pc,gp registers instead
> of fixing intended r16,r17,r18 (see `struct pt_regs`).
>
> More details:
>
> Initially Dmitry noticed a kernel bug as a failure
> on strace test suite. Test passes unmapped userspace
> pointer to io_submit:
>
> ```c
>     #include <err.h>
>     #include <unistd.h>
>     #include <sys/mman.h>
>     #include <asm/unistd.h>
>     int main(void)
>     {
>         unsigned long ctx = 0;
>         if (syscall(__NR_io_setup, 1, &ctx))
>             err(1, "io_setup");
>         const size_t page_size = sysconf(_SC_PAGESIZE);
>         const size_t size = page_size * 2;
>         void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
>                          MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (MAP_FAILED == ptr)
>             err(1, "mmap(%zu)", size);
>         if (munmap(ptr, size))
>             err(1, "munmap");
>         syscall(__NR_io_submit, ctx, 1, ptr + page_size);
>         syscall(__NR_io_destroy, ctx);
>         return 0;
>     }
> ```
>
> Running this test causes kernel to crash when handling page fault:
>
> ```
>     Unable to handle kernel paging request at virtual address ffffffffffff9468
>     CPU 3
>     aio(26027): Oops 0
>     pc = [<fffffc00004eddf8>]  ra = [<fffffc00004edd5c>]  ps = 0000    Not tainted
>     pc is at sys_io_submit+0x108/0x200
>     ra is at sys_io_submit+0x6c/0x200
>     v0 = fffffc00c58e6300  t0 = fffffffffffffff2  t1 = 000002000025e000
>     t2 = fffffc01f159fef8  t3 = fffffc0001009640  t4 = fffffc0000e0f6e0
>     t5 = 0000020001002e9e  t6 = 4c41564e49452031  t7 = fffffc01f159c000
>     s0 = 0000000000000002  s1 = 000002000025e000  s2 = 0000000000000000
>     s3 = 0000000000000000  s4 = 0000000000000000  s5 = fffffffffffffff2
>     s6 = fffffc00c58e6300
>     a0 = fffffc00c58e6300  a1 = 0000000000000000  a2 = 000002000025e000
>     a3 = 00000200001ac260  a4 = 00000200001ac1e8  a5 = 0000000000000001
>     t8 = 0000000000000008  t9 = 000000011f8bce30  t10= 00000200001ac440
>     t11= 0000000000000000  pv = fffffc00006fd320  at = 0000000000000000
>     gp = 0000000000000000  sp = 00000000265fd174
>     Disabling lock debugging due to kernel taint
>     Trace:
>     [<fffffc0000311404>] entSys+0xa4/0xc0
> ```
>
> Here `gp` has invalid value. `gp is s overwritten by a fixup for the
> following page fault handler in `io_submit` syscall handler:
>
> ```
>     __se_sys_io_submit
>     ...
>         ldq     a1,0(t1)
>         bne     t0,4280 <__se_sys_io_submit+0x180>
> ```
>
> After a page fault `t0` should contain -EFALUT and `a1` is 0.
> Instead `gp` was overwritten in place of `a1`.
>
> This happens due to a off-by-two bug in `dpf_reg()` for `r16-r18`
> (aka `a0-a2`).
>
> I think the bug went unnoticed for a long time as `gp` is one
> of scratch registers. Any kernel function call would re-calculate `gp`.
>
> Dmitry tracked down the bug origin back to 2.1.32 kernel version
> where trap_a{0,1,2} fields were inserted into struct pt_regs.
> And even before that `dpf_reg()` contained off-by-one error.

Wow, nice work.

I've vacuumed the patch up and will include it in my next pull req.
