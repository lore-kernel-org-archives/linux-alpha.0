From: Richard Henderson <rth@twiddle.net>
Subject: Re: alpha: half done futex implementation
Date: Mon, 13 Apr 2009 13:23:25 -0700
Message-ID: <49E39F3D.4060501@twiddle.net>
References: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@hp.com>, Oliver Falk <oliver@linux-kernel.at>, linuxppc-dev@ozlabs.org

Matt Turner wrote:
> Hi,
> 
> Going on Richard's advice, I've tried to write an alpha futex
> implementation based on the powerpc futex.h.
> 
> I've gotten this far.. :\
> 

#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg) \
      __asm__ __volatile(             \
      __ASM_MB                        \
      "1: ldl_l   %0,0(%3)\n"         \
          insn                        \
      "2: stl_c   %1,0(%3)\n"         \
      "   beq     %1,4f\n"            \
      "   mov     $31,%1\n"           \
      "3: .subsection 2\n"            \
      "4: br      1b\n"               \
      "   .previous\n"                \
      ".section __ex_table,\"a\"\n"   \
      "   .long   1b-.\n"             \
      "   lda     %0,3b-1b(%2)\n"     \
      "   .long   2b-.\n"             \
      "   lda     %0,3b-2b(%2)\n"     \
      "   .previous\n"                \
      : "=&r" (oldval), "=&r"(ret)    \
      : "r" (uaddr), "r"(oparg)       \
      : "memory")

   switch (op) {
     case FUTEX_OP_SET:
       __futex_atomic_op("mov %0,%1", ret, oldval, uaddr, oparg);
       break;
     case FUTEX_OP_ADD:
       __futex_atomic_op("addl %0,%4,%1\n", ret, oldval, uaddr, oparg);
       break;
     case FUTEX_OP_OR:
       __futex_atomic_op("or %0,%4,%1\n", ret, oldval, uaddr, oparg);
       break;
     case FUTEX_OP_ANDN:
       __futex_atomic_op("andnot %0,%4,%1\n", ret, oldval, uaddr, oparg);
       break;
     case FUTEX_OP_XOR:
       __futex_atomic_op("xor %0,%4,%1\n", ret, oldval, uaddr, oparg);
       break;
     default:
       ret = -ENOSYS;
   }


Also, there's a bug in the powerpc implementation.  It appears that 
oparg is clobbered, and if stwcx fails the operation will be repeated 
with incorrect inputs.


r~



