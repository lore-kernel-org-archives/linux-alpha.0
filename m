From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/2] tty: add compat_ioctl callbacks
Date: Tue, 6 Jun 2017 14:49:15 +0200
Message-ID: <CAK8P3a2Y2U58dfAxRYPKQL2-o8ufpkvxxF07c_LCr5DOuQ4=vw@mail.gmail.com>
References: <20170603141515.9529-1-asarai@suse.de> <20170603141515.9529-2-asarai@suse.de>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=VVGCrzYPYNl9UnSdgl6LGh57Dw+RALCxW2eBYRlY1JU=;
        b=FeGBj3GbM3i1R2sZYlf4dzWOD+GICdaqL4tjkq273zawHxchklogR6ffmhPYKGRTaW
         Gi4qU0mFf8hYuwZbxQzcVOshlY4ZNYVB5yzMyJG2iaE9/lbl2be4nw/OioOftyezru2/
         pUJAM7+9LQUXRMC7ttl1CQZkrFvgZnbOVRknzAShfBiPLSNQfpcNU4TVvEgs2T9DkxCV
         Xi1m7TPgbqf6jRF8swLn7V17IrQ2z4LuWBbSuCi3JQYiy+tqhJiCPwZXWCSQgjX0b88X
         wGUmK5kZ+OyERwyk8rCMXCXE20bFXKDU4wIdcV1Yucs1eKweO6SkZYcu2qvsxr3QDSBK
         vgPg==
In-Reply-To: <20170603141515.9529-2-asarai@suse.de>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksa Sarai <asarai@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-sh@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-xtensa@linux-xtensa.org, linux-arch <linux-arch@vger.kernel.org>, Christian Brauner <christian.brauner@ubuntu.com>, Valentin Rothberg <vrothberg@suse.com>

On Sat, Jun 3, 2017 at 4:15 PM, Aleksa Sarai <asarai@suse.de> wrote:
> In order to avoid future diversions between fs/compat_ioctl.c and
> drivers/tty/pty.c, define .compat_ioctl callbacks for the relevant
> tty_operations structs. Since both pty_unix98_ioctl() and
> pty_bsd_ioctl() are compatible between 32-bit and 64-bit userspace no
> special translation is required.
>
> Signed-off-by: Aleksa Sarai <asarai@suse.de>

Looks good,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
