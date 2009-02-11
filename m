From: Matt Turner <mattst88@gmail.com>
Subject: Fwd: Need help fixing DRM locking on Alpha
Date: Wed, 11 Feb 2009 17:13:30 -0500
Message-ID: <b4198de60902111413s6bee153kfa5b5df835e05959@mail.gmail.com>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
	 <20090210154355.GA27697@jurassic.park.msu.ru>
	 <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com>
	 <20090211154829.GA27268@jurassic.park.msu.ru>
	 <b4198de60902111401x62c6eea0u8a0d02d12383ec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=e+zbZ/jeAD3c7d0uUWo7qZ/EAaP290qjMJ2LTQ4fQBs=;
        b=YYhP6l4FSy51PcF9asvRDlocVSEFUq7Iv9vJBBX3UO2Th/kVrb0rM2/BwSgpfYl4q8
         RQLbDw7MYzGyPB1rS8H+4EwNuweKSuja6Vs3OMoxSyJnpukNSc4KlHJDlCEXNEzz8Z8m
         LN8DTw3qeuQtg56wxQm4twWubWgpHZX6X6Mnc=
In-Reply-To: <b4198de60902111401x62c6eea0u8a0d02d12383ec@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Hi Ivan,

On Wed, Feb 11, 2009 at 10:48 AM, Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
> Well, I've got slightly improved version, which saves one instruction
> for register-register move. Another instruction can be saved if we
> define DRM_CAS_RESULT(_result) as "long" (no need for sign extending then).
>
> Can you test this please?
>
> Ivan.
>
> --- libdrm-2.4.4/libdrm/xf86drm.h.orig  Wed Dec 17 21:28:24 2008
> +++ libdrm-2.4.4/libdrm/xf86drm.h       Wed Feb 11 03:07:05 2009
> @@ -325,28 +325,28 @@ typedef struct _drmSetVersion {
>
>  #elif defined(__alpha__)
>
> -#define        DRM_CAS(lock, old, new, ret)            \
> -       do {                                    \
> -               int old32;                      \
> -               int cur32;                      \
> -               __asm__ __volatile__(           \
> -               "       mb\n"                   \
> -               "       zap   %4, 0xF0, %0\n"   \
> -               "       ldl_l %1, %2\n"         \
> -               "       zap   %1, 0xF0, %1\n"   \
> -                "       cmpeq %0, %1, %1\n"    \
> -                "       beq   %1, 1f\n"                \
> -               "       bis   %5, %5, %1\n"     \
> -                "       stl_c %1, %2\n"                \
> -                "1:     xor   %1, 1, %1\n"     \
> -                "       stl   %1, %3"          \
> -                : "=r" (old32),                 \
> -                 "=&r" (cur32),                \
> -                   "=m" (__drm_dummy_lock(lock)),\
> -                   "=m" (ret)                  \
> -               : "r" (old),                    \
> -                 "r" (new));                   \
> -       } while(0)
> +#define        DRM_CAS(lock, old, new, ret)            \
> +       do {                                    \
> +               int tmp, old32;                 \
> +               __asm__ __volatile__(           \
> +               "       addl    $31, %5, %3\n"  \
> +               "1:     ldl_l   %0, %2\n"       \
> +               "       cmpeq   %0, %3, %1\n"   \
> +               "       beq     %1, 2f\n"       \
> +               "       mov     %4, %0\n"       \
> +               "       stl_c   %0, %2\n"       \
> +               "       beq     %0, 3f\n"       \
> +               "       mb\n"                   \
> +               "2:     cmpeq   %1, 0, %1\n"    \
> +               ".subsection 2\n"               \
> +               "3:     br      1b\n"           \
> +               ".previous"                     \
> +               : "=&r"(tmp), "=&r"(ret),       \
> +                 "=m"(__drm_dummy_lock(lock)), \
> +                 "=&r"(old32)                  \
> +               : "r"(new), "r"(old)            \
> +               : "memory");                    \
> +       } while (0)
>
>  #elif defined(__sparc__)
>
> @@ -429,7 +429,9 @@ do {        register unsigned int __old __asm("
>  #define DRM_CAS(lock,old,new,ret) do { ret=1; } while (0) /* FAST LOCK FAILS */
>  #endif
>
> -#if defined(__alpha__) || defined(__powerpc__)
> +#if defined(__alpha__)
> +#define DRM_CAS_RESULT(_result)                long _result
> +#elif defined(__powerpc__)
>  #define DRM_CAS_RESULT(_result)                int _result
>  #else
>  #define DRM_CAS_RESULT(_result)                char _result
>

I changed 'old32' to 'old' for the %3 output argument, but it fails to
compile with

> error: lvalue required in asm statement
> error: invalid lvalue in asm output 3

I saw this error with the first patch as well, but it was easily
avoided by changing old to an input. I'd fix it, but I don't know what
the appropriate thing is.

Thanks,

Matt Turner
