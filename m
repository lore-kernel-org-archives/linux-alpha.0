From: Richard Henderson <rth@twiddle.net>
Subject: Re: alpha: futex regression bisected
Date: Mon, 20 Feb 2012 09:28:42 -0800
Message-ID: <4F4282CA.5010502@twiddle.net>
References: <4F420256.2090600@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=m/78OfUQxYsGK2JmAHeo3b6AlSUPTDip9iJ7JB161oo=;
        b=etLhI2KIt6Wf1HLydgiPyhXJk1zFzI/yU+faxbI5aFZ8+iYn2G0/OeoO3uPy5F5Yhu
         RZOC0tKeVOyxyU9rz7A/FgmIDkQYCTOL1o7tgvVKKKrRvTwiDa1EGxMizS0gG2Z9AotY
         D7xevojrytCa4V0nhJywOD4iKqviFcWrpqurY=
In-Reply-To: <4F420256.2090600@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Michel Lespinasse <walken@google.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

On 02/20/12 00:20, Michael Cree wrote:
> I have noticed some user space problems (pulseaudio crashes in pthread
> code, glibc/nptl test suite failures, java compiler freezes on SMP alpha
> systems) that arise when using a 2.6.39 or later kernel on Alpha.
> Bisecting between 2.6.38 and 2.6.39 (using glibc/nptl test suite as
> criterion for good/bad kernel) eventually leads to:
> 
> 8d7718aa082aaf30a0b4989e1f04858952f941bc is the first bad commit
> commit 8d7718aa082aaf30a0b4989e1f04858952f941bc
> Author: Michel Lespinasse <walken@google.com>
> Date:   Thu Mar 10 18:50:58 2011 -0800
> 
>     futex: Sanitize futex ops argument types
> 
>     Change futex_atomic_op_inuser and futex_atomic_cmpxchg_inatomic
>     prototypes to use u32 types for the futex as this is the data type the
>     futex core code uses all over the place.


futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
                              u32 oldval, u32 newval)
...
        :       "r"(uaddr), "r"((long)oldval), "r"(newval)


There is no 32-bit compare instruction.  These are implemented by
consistently extending the values to a 64-bit type.  Since the
load instruction sign-extends, we want to sign-extend the other
quantity as well (despite the fact it's logically unsigned).

So:

-        :       "r"(uaddr), "r"((long)oldval), "r"(newval)
+        :       "r"(uaddr), "r"((long)(int)oldval), "r"(newval)

should do the trick.


r~
