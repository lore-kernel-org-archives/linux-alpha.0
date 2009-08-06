From: Falk Hueffner <falk@debian.org>
Subject: Re: Bad Code generated from __{get,put}_unaligned functions
Date: Thu, 6 Aug 2009 20:39:45 +0200
Message-ID: <20090806183941.GA6854@minet.uni-jena.de>
References: <b4198de60908061056m2b27402cjd25f94b6bbed0707@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4198de60908061056m2b27402cjd25f94b6bbed0707@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Thu, Aug 06, 2009 at 01:56:12PM -0400, Matt Turner wrote:
> I was researching different ways of writing unaligned load/store
> macros, so I checked how the kernel did it -- the most general way
> possible. See include/linux/unaligned.h. As such, very bad code is
> generated, for example on alpha with BWX, we can implement all these
> functions with a single instruction, whereas we get stuff like this
> generated from the generic functions.
> 
> __get_unaligned_le32:
>     .frame $30,0,$26,0
>     .prologue 0
>     ldbu $0,1($16)
>     ldbu $1,2($16)
>     ldbu $2,3($16)
>     ldbu $3,0($16)
>     sll $1,16,$1
>     sll $0,8,$0
>     bis $0,$1,$0
>     sll $2,24,$2
>     bis $0,$3,$0
>     bis $0,$2,$0
>     addl $31,$0,$0
>     ret $31,($26),1
> 
> 4 load byte instructions, shift, shift, or, shift, or, or, sign extend
> -- or ldl_u instruction. The code is more than doubly-bad for le64.
> 
> Do we use the generic functions for a reason I don't see? It appears
> that it would be easy enough to add architecture-specific unaligned
> get/put functions in arch/*/include/asm/unaligned.h

There should be no need for architecture specific code for Alpha. GCC
can generate the optimal code sequence for reads from unaligned struct
members as in linux/unaligned/packed_struct.h, and this code should be
used. So you should try to find out why it isn't.

  Falk
