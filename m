From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 2/7] alpha: Eliminate compiler warning from memset macro
Date: Wed, 17 Jul 2013 12:54:10 -0700
Message-ID: <CAEdQ38FbgCRWVrvbt6rB713QvqHtY3aQqYLp=G6WG50=OnYFKg@mail.gmail.com>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net> <1373994280-12047-3-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=XXSOBy29bFxsp+C1bCH1CQlk0wCzIP98HJb3R8CYJB0=;
        b=tA0LKtwAE+xxExej+hEG7DDO6GeSLcd0SiimJe9W94bcsjIZZChFW/dts+S4Grr9PF
         Y8n3JBVYOCXZ6y0/nnNnHnk7uN+s1t/KnZddl+i6gJZvWRY0FcLDqNzilUy7sEA69Qtr
         eC0+Ck2pkzPIPCuey4W8Y8+rlgRZQWOfJGSL1QWmyMXx3KONDYH9IvaD8x2I5+sJiFBn
         mLKP22rXxs5L9tDvQSSM0kX+7wg7zhNoW5zq/xUdzG617vs6wFRWEVtji5Mxyqzfw3q4
         DGSHlF8x8McbN+HDL84aLdLxhBHgRUCt7pqlS+iLDGTBbg8k8JIlWWb3Yw7O0uAe17sF
         tW9Q==
In-Reply-To: <1373994280-12047-3-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org

On Tue, Jul 16, 2013 at 10:04 AM, Richard Henderson <rth@twiddle.net> w=
rote:
> Compiling with GCC 4.8 yields several instances of
>
> crypto/vmac.c: In function =91vmac_final=92:
> crypto/vmac.c:616:9: warning: value computed is not used [-Wunused-va=
lue]
>   memset(&mac, 0, sizeof(vmac_t));
>          ^
> arch/alpha/include/asm/string.h:31:25: note: in definition of macro =91=
memset=92
>      ? __builtin_memset((s),0,(n))          \
>                          ^
> Converting the macro to an inline function eliminates this problem.
>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---

On IRC we found out that this breaks the breaks kernel build with
gcc-3.4 with "sorry, unimplemented: inlining failed in call to
'memset': recursive  inlining" message on some file. I'll drop this
patch for now.
