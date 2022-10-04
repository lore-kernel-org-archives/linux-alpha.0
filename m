From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] execve updates for v6.1-rc1
Date: Mon, 3 Oct 2022 17:02:33 -0700
Message-ID: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
References: <202210010938.3922D4DCE@keescook>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cueZVs+JemlUrpCma8cU2MoonpwhlFUlNsIey5jOwDk=;
        b=XImYLaeVrdpGlNz131QskDLw57oShRWzKlWl05q7GZnGP4fmLn3bLvHYlOU50VM4qE
         TrQfrXYjC1XKLtzwwbG6eTPBPk1J5zgX5EeI1ih1razMkvCmB7KCJ/sG2aTDHxxXW6kE
         cEFUO07c0IZLTZFRJTYwoErMenDJhy5VrY4EY=
In-Reply-To: <202210010938.3922D4DCE@keescook>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, alpha <linux-alpha@vger.kernel.org>

On Sat, Oct 1, 2022 at 9:40 AM Kees Cook <keescook@chromium.org> wrote:
>
> Please pull these execve updates for v6.1-rc1. This removes a.out
> support globally; it has been disabled for a while now.

Pulled.

And I think some of the alpha side could be cleaned up a bit further,
in that I think this ends up making the osf_readv/writev system calls
be the exact same as the standard readv/writev, since the legacy OSF/1
hackery is now gone with CONFIG_OSF4_COMPAT being a thing of the past.

But it's not a big deal - cc'ing linux-alpha just in case somebody
feels inspired.

               Linus
