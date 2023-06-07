From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] syscalls: add sys_ni_posix_timers prototype
Date: Wed, 7 Jun 2023 14:20:19 -0700
Message-ID: <202306071420.C4F0A99@keescook>
References: <20230607142925.3126422-1-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686172820; x=1688764820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5tumlTohvViLF4uk0FiFKpbTE6W6nPi6UHifHjjU7Gk=;
        b=l+oNp6trT33uJEfbYO2yQNVEMsga29EFAMRxZNRXXq4drjYG5twLkw34RY0BhpiJsK
         ZGeuBaA6sAJICfrCYDwjvpJcekW/fVjLkAUH/16viXRR1PZYsQ+krYBB/yry9EVGyccg
         V3cibkhbEj/6Z/Uuz3s0A+90xtin1OipzBd7c=
Content-Disposition: inline
In-Reply-To: <20230607142925.3126422-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org

On Wed, Jun 07, 2023 at 04:28:45PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The sys_ni_posix_timers() definition causes a warning when
> the declaration is missing, so this needs to be added
> along with the normal syscalls, outside of the #ifdef.
> 
> kernel/time/posix-stubs.c:26:17: error: no previous prototype for 'sys_ni_posix_timers' [-Werror=missing-prototypes]
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
