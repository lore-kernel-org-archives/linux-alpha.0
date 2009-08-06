From: Matt Turner <mattst88@gmail.com>
Subject: Bad Code generated from __{get,put}_unaligned functions
Date: Thu, 6 Aug 2009 13:56:12 -0400
Message-ID: <b4198de60908061056m2b27402cjd25f94b6bbed0707@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=ltE9ic6OLHc/f0m5ioAye1hIcvOeafpEjA+MHIeaF9E=;
        b=QbdjDGMqukf5CuzydCZMTfmSHdQGrrHNcmZ1nQdg02R9sJt+M2vGO29+TvBqZbJS28
         H4p0mIYKl76nv4fWpLla6saSDK9/gI2bexsO9g/AFN+XD73uYO/jJXoa5LgfG6YjdS/U
         tJ2b9xRmevyyEcqPPFPMzmUHDojIXpeg4FnHk=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

I was researching different ways of writing unaligned load/store
macros, so I checked how the kernel did it -- the most general way
possible. See include/linux/unaligned.h. As such, very bad code is
generated, for example on alpha with BWX, we can implement all these
functions with a single instruction, whereas we get stuff like this
generated from the generic functions.

__get_unaligned_le32:
    .frame $30,0,$26,0
    .prologue 0
    ldbu $0,1($16)
    ldbu $1,2($16)
    ldbu $2,3($16)
    ldbu $3,0($16)
    sll $1,16,$1
    sll $0,8,$0
    bis $0,$1,$0
    sll $2,24,$2
    bis $0,$3,$0
    bis $0,$2,$0
    addl $31,$0,$0
    ret $31,($26),1

4 load byte instructions, shift, shift, or, shift, or, or, sign extend
-- or ldl_u instruction. The code is more than doubly-bad for le64.

Do we use the generic functions for a reason I don't see? It appears
that it would be easy enough to add architecture-specific unaligned
get/put functions in arch/*/include/asm/unaligned.h

CC me on replies please.

Matt Turner
