From: Matt Turner <mattst88@gmail.com>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Thu, 12 Feb 2009 17:15:15 -0500
Message-ID: <b4198de60902121415s4b52e2ber5d814997cb4b21e4@mail.gmail.com>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
	 <20090210154355.GA27697@jurassic.park.msu.ru>
	 <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com>
	 <20090211154829.GA27268@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ASpGFFvfx7208z0pkkw1eF9T1aBpnc9wpFN1/aXDUpU=;
        b=U9nbg+OrESU+2DOHtYyF5XKLxD2xLSGwrAqvjVDwVD9/bcqD2vOPRAfLxGjBPAqxfc
         kPxNs5T/zkdohEzETMQbidIHiHNX79wcLyQJp49S0lBjZIdOJVYszTyiwIejZgcYhruh
         KEDwkjWyAf7uYKzhoBKU4mljf1bFH8e7J0EQU=
In-Reply-To: <20090211154829.GA27268@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, klausman@schwarzvogel.de

Hi,

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

After some stupidity on my part, this patch looks good and tests well for me.

It would be great to get others to test as well. To do so,

1) patch libdrm using this patch.
2) rebuild libdrm, and at least mesa-7.2, xorg-server-1.5.3
3) patch your kernel (-29_rc series preferably) with patch in
http://bugzilla.kernel.org/show_bug.cgi?id=10893
4) startx

Thanks Ivan!

Matt
