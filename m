From: Matt Turner <mattst88@gmail.com>
Subject: alpha: half done futex implementation
Date: Sat, 11 Apr 2009 20:55:23 -0400
Message-ID: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=jJjVKFEo+WYjHTluZFjfGc4qhp+s18qeCLifb/9bzO8=;
        b=bJQNN7tehEYiJXoSm0WVLNccY8V8XkdEMHARAA+i/VUhnYNOOIXFa9BxakvuZUItYB
         vx7fM8EY6WDrPqit7i9odxieHXaaf3mu8IEgcZ9QdXbe+7endYgAocvppq4NLxfsun4M
         XtrYOq8WqNkdutw6wJuh35rPa8axUeONXw9E8=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@hp.com>, Oliver Falk <oliver@linux-kernel.at>

Hi,

Going on Richard's advice, I've tried to write an alpha futex
implementation based on the powerpc futex.h.

I've gotten this far.. :\

#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg) \
    __asm__ __volatile(             \
    "1: ldl_l   %0,%2\n"            \
        insn                        \
    /* something needs to happen here
     * to save result of insn across
     * stl_c? */
    "   stl_c   %1,%2\n"            \
    "   beq     %1,2f\n"            \
    "   mb\n"                       \
    /* something needs to happen here
     * for the ret */
    "   .subsection 2\n"            \
    "2: br      1b\n"               \
    "   .previous\n"                \
    : "=&r" (oldval), "=&r" (ret)   \
    : "b" (uaddr) \
    : "memory")

Could someone take a look and help finish it?

For futex_atomic_cmpxchg_inatomic, I think Ivan's DRM_CAS
implementation can be used with only trivial changes. See
http://cgit.freedesktop.org/mesa/drm/commit/?id=6feac49398d0f037103a4ae3d5a512badeed61fb

Please CC me on responses, as I'm not subscribed to linux-kernel@.

Thanks,

Matt Turner
